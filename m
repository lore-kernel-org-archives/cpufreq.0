From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [powernow-k8] some wrong frequencies on opterons 252,
	howto find them?
Date: Thu, 1 Dec 2005 14:53:45 +0100
Message-ID: <20051201135345.GB17066@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A843032189BC@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843032189BC@SAUSEXMB1.amd.com>
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

On Wed, Nov 30, 2005 at 02:46:58PM -0600, Langsdorf, Mark wrote:
> > > It's a BIOS bug/feature, for sure.  Take it up with HP - 
> > > they've been known to make design decisions like this before.
> > > 
> > 
> > Thanks to confirm this.  I will contact HP in order to get it fixed.
> > 
> > In the meantime (and for those who may need a solution for an 
> > override) I will provide that patch to your driver.  Of 
> > course, I don't request it being merged for obvious reasons.
> > 
> > The only (maybe) thing that may be other people want to be 
> > merged in mainline is that we can get the current voltage.  I 
> > could separate the voltage attribute if you think it may be 
> > fun to have.
> 
> I can support powernow_show_voltage and powernow_show_table,
> but AMD will not maintain powernow_store_table.  

Thanks!

...

> That function scares me.  It's only useful for people with a
> mostly working set of _PSS objects, since it won't generate
> the irt, rvo, pllock, etc.

Which happens to be the case of the HP...

> People attempting to use it
> should be very careful, since incorrect fid/vid pairs 
> will hardlock the machine and potentially damage the
> processor.  I definitely don't want it in the mainstream code.

Note that I never wanted this function or any other "official"
way to change the configuration at run-time going to mainstream.
You can look at the archive that I am one which won't recommand
this kind of stuff.  But that doesn't means that we can't help
people with some kind of black magic sometimes.

Attached a version without the store function, and take care of
your remarks.

log:
add some attributes to the powernow-k8 drivers, namely:
powernow_voltage will give the current voltage applyed to the processor,
powernow_table will give all the configuration internal to help to debug
the powernow driver.

Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>


 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |   69 +++++++++++++++++++++++++++++
 1 files changed, 69 insertions(+)

--- linux-2.6.14.3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005/11/30 17:14:03	1.1
+++ linux-2.6.14.3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2005/12/01 13:52:58
@@ -1129,8 +1129,77 @@ static unsigned int powernowk8_get (unsi
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
+	voltage = find_millivolts_from_vid(data, data->currvid);
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
+static struct freq_attr powernow_attr_table = {
+	.attr = { .name = "powernow_table", .mode = 0444},
+	.show = powernow_show_table,
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
