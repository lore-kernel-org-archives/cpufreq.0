From: Dominik Brodowski <linux@brodo.de>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Tue, 2 Sep 2003 10:31:50 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902083150.GA3958@brodo.de>
References: <871xuzbycu.wl%miura@da-cha.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <871xuzbycu.wl%miura@da-cha.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Hiroshi Miura <miura@da-cha.org>
Cc: Ducrot Bruno <ducrot@arm.linux.org.uk>, cpufreq@www.linux.org.uk


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for this very interesting work. Unfortunately, it doesn't work on my
aged notebook, but well, the GPO driver didn't work either....

Attached are a couple of patches for your driver:

fix-warnings
	fixes a couple of warnings

core-update-followup
	->policy shall not be set any longer in ->target cpufreq drivers
	[followup to the core patches I've posted previously]

less-verbose-and-export
	to run as a module, we need to export ist_info. Also, only show the
	IST_INFO line in dmesg if speedstep_smi is enabled.

resume
	use a new ->resume callback in the cpufreq core.


	Dominik
--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="speedstep-2.6.0-test4-core_update_followup"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 08:40:59.748663248 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 08:47:32.039026048 +0200
@@ -243,8 +243,7 @@
 		(speed / 1000));
 
 	/* cpuinfo and default policy values */
-	policy->policy = (speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? 
-		CPUFREQ_POLICY_POWERSAVE : CPUFREQ_POLICY_PERFORMANCE;
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="speedstep-2.6.0-test4-fix_warnings"

fix warning: unsigned int format, long unsigned int arg (arg 2..4)

diff -ruN linux-original/arch/i386/kernel/setup.c linux/arch/i386/kernel/setup.c
--- linux-original/arch/i386/kernel/setup.c	2003-09-02 08:40:59.749663096 +0200
+++ linux/arch/i386/kernel/setup.c	2003-09-02 08:41:55.844135440 +0200
@@ -957,7 +957,7 @@
 	edid_info = EDID_INFO;
 	apm_info.bios = APM_BIOS_INFO;
 	ist_info = IST_INFO;
-	printk("IST_SMI: signature:0x%.8x, command:0x%.8x, event:0x%.8x, perf_level:0x%.8x.\n", 
+	printk("IST_SMI: signature:0%.8lx, command:0lx%.8lx, event:0x%.8lx, perf_level:0x%.8lx.\n", 
 		ist_info.signature, ist_info.command, ist_info.event, ist_info.perf_level);
 	saved_videomode = VIDEO_MODE;
 	printk("Video mode to be used for restore is %lx\n", saved_videomode);

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="speedstep-2.6.0-test4-less_verbose_and_export"

diff -ruN linux-original/arch/i386/kernel/i386_ksyms.c linux/arch/i386/kernel/i386_ksyms.c
--- linux-original/arch/i386/kernel/i386_ksyms.c	2003-09-02 08:31:36.121347624 +0200
+++ linux/arch/i386/kernel/i386_ksyms.c	2003-09-02 08:59:29.684927288 +0200
@@ -33,6 +33,7 @@
 #include <asm/tlbflush.h>
 #include <asm/nmi.h>
 #include <asm/edd.h>
+#include <asm/ist.h>
 
 extern void dump_thread(struct pt_regs *, struct user *);
 extern spinlock_t rtc_lock;
@@ -209,3 +210,7 @@
 EXPORT_SYMBOL(edd);
 EXPORT_SYMBOL(eddnr);
 #endif
+
+#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODULE)
+EXPORT_SYMBOL(ist_info);
+#endif
diff -ruN linux-original/arch/i386/kernel/setup.c linux/arch/i386/kernel/setup.c
--- linux-original/arch/i386/kernel/setup.c	2003-09-02 08:48:14.965500232 +0200
+++ linux/arch/i386/kernel/setup.c	2003-09-02 08:58:52.739543840 +0200
@@ -957,8 +957,10 @@
 	edid_info = EDID_INFO;
 	apm_info.bios = APM_BIOS_INFO;
 	ist_info = IST_INFO;
+#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODULE) 
 	printk("IST_SMI: signature:0%.8lx, command:0lx%.8lx, event:0x%.8lx, perf_level:0x%.8lx.\n", 
 		ist_info.signature, ist_info.command, ist_info.event, ist_info.perf_level);
+#endif
 	saved_videomode = VIDEO_MODE;
 	printk("Video mode to be used for restore is %lx\n", saved_videomode);
 	if( SYS_DESC_TABLE.length != 0 ) {

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="speedstep-2.6.0-test4-resume"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 08:48:54.192536816 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 09:05:57.532965424 +0200
@@ -18,7 +18,6 @@
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
-#include <linux/pm.h>
 #include <asm/ist.h>
 
 /* speedstep system management interface port/command.
@@ -44,8 +43,6 @@
 	{0,			CPUFREQ_TABLE_END},
 };
 
-static struct pm_dev *smi_pm_dev;
-
 #define GET_SPEEDSTEP_OWNER 0
 #define GET_SPEEDSTEP_STATE 1
 #define SET_SPEEDSTEP_STATE 2
@@ -251,31 +248,25 @@
 }
 
 
+static int speedstep_resume(struct cpufreq_policy *policy)
+{
+	int result = speedstep_smi_ownership();
+
+	if (result)
+		dprintk(KERN_INFO "cpufreq: fails an aquiring ownership of a SMI interface.\n");
+
+	return result;
+}
+
+
 static struct cpufreq_driver speedstep_driver = {
 	.name		= "speedstep",
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
+	.resume		= speedstep_resume,
 };
 
-static int speedstep_pm_resume(struct pm_dev *dev, pm_request_t rqst, void *data)
-{
-	int result = 0;
-
-	switch (rqst) {
-		case PM_RESUME:
-			result = speedstep_smi_ownership();
-			if (result)
-				dprintk(KERN_INFO "cpufreq: fails an aquiring ownership of a SMI interface.\n");
-			break;
-		case PM_SUSPEND:
-		default:
-			/* no need actions */
-			break;
-	}
-	return result;
-}
-
 /**
  * speedstep_init - initializes the SpeedStep CPUFreq driver
  *
@@ -304,8 +295,6 @@
 		smi_cmd = (ist_info.command >> 16) & 0xff;
 	}
 
-	smi_pm_dev = pm_register(PM_SYS_DEV, PM_SYS_UNKNOWN, speedstep_pm_resume);
-
 	return cpufreq_register_driver(&speedstep_driver);
 }
 
@@ -317,8 +306,6 @@
  */
 static void __exit speedstep_exit(void)
 {
-	if (smi_pm_dev)
-		pm_unregister(smi_pm_dev);
 	cpufreq_unregister_driver(&speedstep_driver);
 }
 

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--h31gzZEtNLTqOjlF--

