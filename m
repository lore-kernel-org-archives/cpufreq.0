From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Driver to export CPUfreq statistic
Date: Tue, 16 Nov 2004 21:42:02 +0100
Message-ID: <20041116204202.GA9121@dominikbrodowski.de>
References: <894E37DECA393E4D9374E0ACBBE7427013C98A@pdsmsx402.ccr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <894E37DECA393E4D9374E0ACBBE7427013C98A@pdsmsx402.ccr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Zou, Nanhai" <nanhai.zou@intel.com>
Cc: cpufreq@www.linux.org.uk

Hi,

> Please test and review it.

A review is first -- it looks good and useful, just a few small issues:


+static spinlock_t cpufreq_stats_lock = SPIN_LOCK_UNLOCKED;

Please use spin_lock_init(&cpufreq_stats_lock) in cpufreq_stats_init()
instead of SPIN_LOCK_UNLOCKED, please. It's something which helps for the
"real-time" patches currently under discussion.

+#define CPUFREQ_STATDEVICE_ATTR(_name,_mode,_show) \
+static struct cpufreq_stats_attribute _attr_##_name = {\
+	.attr = {.name = __stringify(_name), .mode = _mode, }, \

AFAICS a ".owner = THIS_MODULE" is missing inside .attr

+	struct kobject kobj;

Do we need a kobject for this? Could a atrribute_group suffice?

+cpufreq_stats_attr_show(struct kobject * kobj,
+		struct attribute *attr, char *buf)
+{
+	struct cpufreq_stats_attribute *cpufreq_stat_attr
+		= (struct cpufreq_stats_attribute *)(attr);
+	struct cpufreq_stats *stat = (struct cpufreq_stats *)kobj;

This looks like a hack. Please use "container_of(,,)" instead, possibly in a
#define -- like
#define to_pci_bus(n)   container_of(n, struct pci_bus, class_dev)

+static struct kobj_type ktype_cpufreq_stats = {
+	.sysfs_ops = &cpufreq_stats_attr_ops,
+	.default_attrs = default_attrs
+};
+
...
+	for (i = 0;(attr = stat_attrs[i]); i++) {
+		if ((ret = sysfs_create_file(&stat->kobj, &attr->attr)))
+			goto error_out_unregister;
+	}

You can remove this loop (and stat_attrs[]) if you do:

static struct attribute *default_attrs[] = {
	&_attr_total_trans.attr,
	&_attr_time_in_state.attr,
#ifdef CONFIG_CPU_FREQ_STAT_DETAILS 
	&_attr_trans_table.attr,
#endif	
	NULL
};

+	for (i=0; table[i].frequency != CPUFREQ_TABLE_END; i++) {
+		unsigned int freq = table[i].frequency;
+		if (freq == CPUFREQ_ENTRY_INVALID)
+			continue;
+		count++;
+	}
+
+	alloc_size = count * sizeof(int) + count * sizeof(long long);
+
+#ifdef CONFIG_CPU_FREQ_STAT_DETAILS
+	alloc_size += count * count * sizeof(int);
+#endif 
+	stat->max_state = count;
+	stat->time_in_state = kmalloc(alloc_size, GFP_KERNEL);
+	if (!stat->time_in_state) {
+		ret = -ENOMEM;
+		goto error_out_unregister;
+	}
+	memset(stat->time_in_state, 0, alloc_size);
+	stat->freq_table = (unsigned int *)(stat->time_in_state + count);
+
+#ifdef CONFIG_CPU_FREQ_STAT_DETAILS
+	stat->trans_table = stat->freq_table + count;
+#endif
+	j = 0;
+	for (i = 0; table[i].frequency != CPUFREQ_TABLE_END; i++) {
+		unsigned int freq = table[i].frequency;
+		if (freq == CPUFREQ_ENTRY_INVALID)
+			continue;
+		if (freq_table_get_index(stat, freq) == -1) 
+			stat->freq_table[j++] = freq;
+	}

I'm worried a bit about the handling of the frequency table, and asserting
that it doesn't disappear in between. As you use the one reported to the
freq table helpers, it may not change during normal operation, and gets
unregistered during the driver's ->exit() function. Therefore, we need to
avoid ->exit() being called as long as the frequency table is handled in
this stats driver. This means:

	... cpufreq_cpu_get()
	...
	table = cpufreq_frequency_get_table()
	/* use table */

	/* from now on the table can't be used directly any more */
	cpufreq_cpu_put(...)


+cpufreq_stat_notifier_policy (struct notifier_block *nb, unsigned long val,
+		void *data)
+{
+	int ret;
+	struct cpufreq_policy *policy = data;
+	struct cpufreq_frequency_table *table;
+	unsigned int cpu = policy->cpu;
+	if (val != CPUFREQ_NOTIFY)
+		return 0;
+	table = cpufreq_frequency_get_table(cpu);
+	if (current_freq_tables[cpu] != table) {
+		if (current_freq_tables[cpu])
+			cpufreq_stats_free_table(cpu);
+		if ((ret = cpufreq_stats_create_table(policy, table)))
+			return ret;
+		current_freq_tables[cpu] = table;


Uh, do you really want to handle tables changing in between? Those exported
via freq_table to userspace _may_ not change between registration and
unregistration. I'm worried more about drivers which either have no
freq_table, or don't export it (yet) (like pmac_cpufreq).

+{
+	int ret;
+	unsigned int cpu;
+	if ((ret = cpufreq
+		return ret;
+	for_each_cpu(cpu)
+		cpufreq_update_policy(cpu);
+	return cpufreq_register_notifier(&notifier_trans_block,
+			CPUFREQ_TRANSITION_NOTIFIER);

This will cause an oops if the register_notifier(POLICY) succeeded, but
register_notifier(TRANSITION) failed: you'd need to do
	ret = cpufreq_register_notifier(&notifier_trans_block,
			CPUFREQ_TRANSITION_NOTIFIER);
	if (ret)
		cpufreq_unregister_notifier(&notifier_policy_block,
					CPUFREQ_POLICY_NOTIFIER)))

+struct cpufreq_frequency_table *cpufreq_frequency_get_table(unsigned int cpu)
+{
+	        return show_table[cpu];
+}
+EXPORT_SYMBOL_GPL(cpufreq_frequency_get_table);

Please add a comment above this function that it is only safe to use the
data obtained as long as a reference obtained by cpufreq_cpu_get() is held;
and you need to copy it to a local place __and__ can't be sure it doesn't
change forever.

+config CPU_FREQ_STAT
+       tristate "CPU frequency translation statistics"
+       depends on CPU_FREQ_TABLE
+       default y
+       help
+         This driver exports CPU frequency statistics information through sysfs
+         file system
+
+config CPU_FREQ_STAT_DETAILS
+       bool "CPU frequency translation statistics details"
+       depends on CPU_FREQ_STAT
+       default n
+       help
+         This will show detail CPU frequency translation table in sysfs file
+         system

I'm pondering two things: 
a) should we make this dependant on CPU_FREQ_DEBUG?
b) should we make CPU_FREQ_STAT_DETAILS available unconditionally?


 /* the following are really really optional */
+
+struct cpufreq_policy * cpufreq_cpu_get(unsigned int cpu);
+void cpufreq_cpu_put(struct cpufreq_policy *data);
+

Please put these two in a different section, possibly titled
/* for cpufreq core use only */

+struct cpufreq_frequency_table *cpufreq_frequency_get_table(unsigned int cpu);

... and put this one in that section, too.
