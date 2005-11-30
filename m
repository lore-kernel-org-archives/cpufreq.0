From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [powernow-k8] some wrong frequencies on opterons 252,
	howto find them?
Date: Wed, 30 Nov 2005 20:55:24 +0100
Message-ID: <20051130195524.GB4713@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A84303218993@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218993@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Nov 28, 2005 at 10:33:13AM -0600, Langsdorf, Mark wrote:
> > > No, that's okay.  If you could retrieve the value of
> > > pr->performance->state_count from line 1011 of
> > > drivers/acpi/processor.c, and the values of
> > > px->control from line 1036 of the same file for each
> > > _PSS object, that would be very helpful.
> > > 
> > 
> > Ok.
> > 
> > The dmesg look like that now:
> > 
> > powernow-k8: Found 2 AMD Athlon 64 / Opteron processors 
> > (version 1.50.4) 
> > processor id 0: pr->performance->state_count 5
> > processor id 0: State [0]: core_frequency[2600] 
> > power[68000] transition_latency[100] bus_master_latency[7] 
> > control[0xc0701192] status[0x192]
> > data->acpi_data.state_count: 5
> > data->numps 5
> > powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
> > powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
> > powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
> > powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
> > powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
> >
> > For the record, I put the SSDTs loaded via the Load stuff
> > found after dumping the memory regions as I said earlier.
> > I don't think you will need them though.  There is no low 
> > frequency for sure.
> 
> It's a BIOS bug/feature, for sure.  Take it up with HP -
> they've been known to make design decisions like this 
> before.
> 

Thanks to confirm this.  I will contact HP in order to get it fixed.

In the meantime (and for those who may need a solution for an override)
I will provide that patch to your driver.  Of course, I don't request it
being merged for obvious reasons.

The only (maybe) thing that may be other people want to be merged in
mainline is that we can get the current voltage.  I could separate the
voltage attribute if you think it may be fun to have.



--- linux-2.6.14.3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005/11/30 17:14:03	1.1
+++ linux-2.6.14.3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005/11/30 18:44:19
@@ -1129,8 +1129,163 @@ static unsigned int powernowk8_get (unsi
 	return khz;
 }
 
+static ssize_t powernow_show_voltage(struct cpufreq_policy *pol, char *buf)
+{
+	struct powernow_k8_data *data = powernow_data[pol->cpu];
+	cpumask_t oldmask;
+	u32 voltage = 0;
+
+	oldmask = current->cpus_allowed;
+	set_cpus_allowed(current, cpumask_of_cpu(pol->cpu));
+	if (smp_processor_id() != pol->cpu) {
+		printk(KERN_ERR "limiting to cpu %u failed\n", pol->cpu);
+		goto err_out;
+	}
+
+	preempt_disable();
+
+	if (query_current_values_with_pending_wait(data))
+		goto err_out;
+
+	voltage = 1550 - data->currvid * 25;
+
+err_out:
+	preempt_enable_no_resched();
+	set_cpus_allowed(current, oldmask);
+
+	return sprintf(buf, "%d\n", voltage);
+}
+
+static struct freq_attr powernow_attr_voltage = {
+	.attr = { .name = "powernow_voltage", .mode = 0444},
+	.show = powernow_show_voltage,
+};
+
+static ssize_t powernow_show_table(struct cpufreq_policy *pol, char *buf)
+{
+	int i;
+	ssize_t count = 0;
+	struct powernow_k8_data *data = powernow_data[pol->cpu];
+	struct cpufreq_frequency_table *table = data->powernow_table;
+
+	count += sprintf(&buf[count], "%d %d %d %d %d %d %d %d\n",
+			 data->numps,
+			 data->batps,
+			 data->rvo,
+			 data->irt,
+			 data->vidmvs,
+			 data->vstable,
+			 data->plllock,
+			 data->exttype);
+
+	for (i = 0; table[i].frequency != CPUFREQ_TABLE_END; ++i) {
+		if (table[i].frequency == CPUFREQ_ENTRY_INVALID)
+			count += sprintf(&buf[count], "XX ");
+		else
+			count += sprintf(&buf[count], "%d ",
+					table[i].frequency);
+		count += sprintf(&buf[count], "0x%.4x\n",
+					table[i].index);
+	}
+
+	return count;
+}
+
+static ssize_t powernow_store_table(struct cpufreq_policy *pol,
+		const char *buf, size_t count)
+{
+	int retval;
+	unsigned int index;
+	int freq, min_freq, max_freq;
+	int i, j;
+	struct powernow_k8_data *data = powernow_data[pol->cpu];
+	struct cpufreq_frequency_table *pt_new = NULL;
+	struct cpufreq_frequency_table *pt_old = NULL;
+	struct cpufreq_frequency_table pt[20];	/* XXX should be dynamic... */
+
+	min_freq = -1;
+	max_freq = 0;
+	memset(pt, 0, 20 * sizeof(pt[0]));
+
+	for (i = 0; i < 20; ++i) {
+		buf = strchr(buf, '\n');
+		if (!buf)
+			break;
+		buf++;
+		if (*buf == 0)
+			break;
+
+		retval = sscanf(buf, "%u 0x%x", &freq, &index);
+		if (retval != 2)
+			goto err;
+		/* TODO validate the frequency according to FID */
+		/* TODO be sure that VID seems to be correct. */
+
+		pt[i].frequency = freq;
+		pt[i].index = index;
+
+		if (freq < min_freq)
+			min_freq = freq;
+		if (freq > max_freq)
+			max_freq = freq;
+	}
+
+	pt[i].frequency = CPUFREQ_TABLE_END;
+	pt[i].index = 0;
+
+	printk(KERN_INFO "powernow-k8: number of states: %d\n", i);
+	printk(KERN_INFO "powernow-k8: max frequency: %d   "
+			 "min frequency: %d\n", max_freq, min_freq);
+
+	for (j = 0; j < 20; ++j)
+		printk(KERN_INFO "powernow-k8: freq: %7d    index: 0x%.5x -> "
+				 "%d kHz %d mV\n",
+				pt[j].frequency,
+				pt[j].index,
+				find_khz_freq_from_fid(pt[j].index & 0xff),
+				1550 - 25 * (pt[j].index >> 8));
+
+	/* replace by new table */
+	if (i <= 1)
+		goto err;
+
+	pt_new = kmalloc((sizeof(struct cpufreq_frequency_table) * (i + 1)), GFP_KERNEL);
+	if (!pt_new)
+		return -ENOMEM;
+
+	memcpy(pt_new, pt, (sizeof(struct cpufreq_frequency_table) * (i + 1)));
+
+	pt_old = data->powernow_table;
+
+	down(&pol->lock);
+
+	data->numps = i;
+	data->powernow_table = pt_new;
+	retval = cpufreq_frequency_table_cpuinfo(pol, data->powernow_table);
+	if (retval) {
+		BUG();
+	}
+
+	up(&pol->lock);
+
+	cpufreq_update_policy(pol->cpu);
+
+	kfree(pt_old);
+err:
+	return count;
+}
+
+
+static struct freq_attr powernow_attr_table = {
+	.attr = { .name = "powernow_table", .mode = 0644},
+	.show = powernow_show_table,
+	.store = powernow_store_table,
+};
+
 static struct freq_attr* powernow_k8_attr[] = {
 	&cpufreq_freq_attr_scaling_available_freqs,
+	&powernow_attr_voltage,
+	&powernow_attr_table,
 	NULL,
 };
 

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
