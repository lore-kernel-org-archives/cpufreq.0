From: Thomas Renninger <trenn@suse.de>
Subject: RE: ondemand as default governor
Date: Sat, 10 Mar 2007 19:39:15 +0100
Message-ID: <1173551955.7690.43.camel@linux-8rt8.site>
References: <653FFBB4508B9042B5D43DC9E18836F50E4405@scsmsx415.amr.corp.intel.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F50E4405@scsmsx415.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

On Wed, 2007-03-07 at 07:43 -0800, Pallipadi, Venkatesh wrote:
> 
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk 
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Dave Jones
> >Sent: Tuesday, March 06, 2007 11:02 PM
> >To: Len Brown
> >Cc: cpufreq@lists.linux.org.uk
> >Subject: Re: ondemand as default governor
> >
> >On Wed, Mar 07, 2007 at 01:24:28AM -0500, Len Brown wrote:
> > > On Thursday 01 March 2007 12:41, Thomas Renninger wrote:
> > > > I just read in drivers/cpufreq/Kconfig:
> > > > # Note that it is not currently possible to set the other 
> >governors
> > > > (such as ondemand)
> > > > # as the default, since if they fail to initialise, 
> >cpufreq will be
> > > > # left in an undefined state.
> > > > 
> > > > Is this a bigger problem to solve?
> > > > Is there already someone working/thinking on/about a solution?
> > > > 
> > > > Allowing this would be convenient...
> > > 
> > > Yes, it would, then we could delete the other governors,
> > > and then delete the concept of multiple governors alltogether.
> >
> >It's not feasible unless you have a way of making various
> >older CPUs transition faster.  Ondemand on 
> >longhaul,powernow-k6,longrun,
> >elanfreq, as well as lots of non-x86 implementations is just not
> >a feasible option.
> >
> >However.. conservative might be.  I'd still like to see conservative
> >folded into ondemand sometime, and just be a module param.
> >
> 
> One option I was thinking of doing is to add a rating system to all
> governors and to try init'ing all governors in order of their rating
> at init time (until one is successful). With that, we can fallback to
> performance or userspace if ondemand fails to init.
> 
> But, I never got around to implementing something like that.....

There are drivers to work correctly with ondemand and the others are
known
to not work with it, right?
Using userspace governor as default does not save much as it needs
fiddling in /sys/.../cpufreq anyway, ondemand as default would be much
more useful.

What about just falling back to performance governor when a non working
driver is loaded with DEFAULT_ONDEMAND governor?

A more clean way could be to add a .max_allowed_latency value to the
governor struct and fallback to performance if the latency of the
driver is too high (in init of cpufreq driver, instead of comparing
governor name)?

This is an example without latency checking, modified two drivers,
one known working with ondemand (powernow-k8) and one not
(speedstep-smi, AFAIK this one has latency problems):

---
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c   |    1 -
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    7 ++++++-
 drivers/cpufreq/Kconfig                      |   13 +++++++++++++
 drivers/cpufreq/cpufreq.c                    |    2 ++
 drivers/cpufreq/cpufreq_ondemand.c           |    7 ++++---
 include/linux/cpufreq.h                      |    5 +++++
 6 files changed, 30 insertions(+), 5 deletions(-)

Index: linux-2.6.21-rc3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
===================================================================
--- linux-2.6.21-rc3.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
+++ linux-2.6.21-rc3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
@@ -1203,7 +1203,6 @@ static int __cpuinit powernowk8_cpu_init
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
 
-	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	if (cpu_family == CPU_HW_PSTATE)
 		pol->cpus = cpumask_of_cpu(pol->cpu);
 	else
Index: linux-2.6.21-rc3/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.21-rc3.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.21-rc3/drivers/cpufreq/cpufreq_ondemand.c
@@ -573,11 +573,12 @@ static int cpufreq_governor_dbs(struct c
 	return 0;
 }
 
-static struct cpufreq_governor cpufreq_gov_dbs = {
+struct cpufreq_governor cpufreq_gov_ondemand = {
 	.name = "ondemand",
 	.governor = cpufreq_governor_dbs,
 	.owner = THIS_MODULE,
 };
+EXPORT_SYMBOL(cpufreq_gov_ondemand);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
@@ -586,12 +587,12 @@ static int __init cpufreq_gov_dbs_init(v
 		printk(KERN_ERR "Creation of kondemand failed\n");
 		return -EFAULT;
 	}
-	return cpufreq_register_governor(&cpufreq_gov_dbs);
+	return cpufreq_register_governor(&cpufreq_gov_ondemand);
 }
 
 static void __exit cpufreq_gov_dbs_exit(void)
 {
-	cpufreq_unregister_governor(&cpufreq_gov_dbs);
+	cpufreq_unregister_governor(&cpufreq_gov_ondemand);
 	destroy_workqueue(kondemand_wq);
 }
 
Index: linux-2.6.21-rc3/include/linux/cpufreq.h
===================================================================
--- linux-2.6.21-rc3.orig/include/linux/cpufreq.h
+++ linux-2.6.21-rc3/include/linux/cpufreq.h
@@ -286,6 +286,11 @@ extern struct cpufreq_governor cpufreq_g
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND)
+extern struct cpufreq_governor cpufreq_gov_ondemand;
+extern struct cpufreq_governor cpufreq_gov_performance;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_ondemand;
+#define CPUFREQ_PERFORMANCE_GOVERNOR	&cpufreq_gov_performance;
 #endif
 
 
Index: linux-2.6.21-rc3/drivers/cpufreq/Kconfig
===================================================================
--- linux-2.6.21-rc3.orig/drivers/cpufreq/Kconfig
+++ linux-2.6.21-rc3/drivers/cpufreq/Kconfig
@@ -75,6 +75,19 @@ config CPU_FREQ_DEFAULT_GOV_USERSPACE
 	  program shall be able to set the CPU dynamically without having
 	  to enable the userspace governor manually.
 
+config CPU_FREQ_DEFAULT_GOV_ONDEMAND
+	bool "ondemand"
+	select CPU_FREQ_GOV_ONDEMAND
+	select CPU_FREQ_GOV_PERFORMANCE
+	help
+	  Use the CPUFreq governor 'ondemand' as default. This allows
+	  you to get a full dynamic frequency capable system by simply
+	  loading your cpufreq driver.
+	  Be aware that not all cpufreq drivers support the ondemand
+	  governor. If unsure have a look at the help section of the
+	  driver. Fallback governor will then be the performance
+	  governor.
+
 endchoice
 
 config CPU_FREQ_GOV_PERFORMANCE
Index: linux-2.6.21-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
===================================================================
--- linux-2.6.21-rc3.orig/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
+++ linux-2.6.21-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
@@ -290,7 +290,12 @@ static int speedstep_cpu_init(struct cpu
 		(speed / 1000));
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
+	/* this driver does not support ondemand as governor
+	   due to too high latency values */
+	policy->governor = CPUFREQ_PERFORMANCE_GOVERNOR;
+#endif
+
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 
Index: linux-2.6.21-rc3/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.21-rc3.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.21-rc3/drivers/cpufreq/cpufreq.c
@@ -762,6 +762,8 @@ static int cpufreq_add_dev (struct sys_d
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
 	 */
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+
 	ret = cpufreq_driver->init(policy);
 	if (ret) {
 		dprintk("initialization failed\n");
