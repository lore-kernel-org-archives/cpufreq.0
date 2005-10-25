From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: Re: Can't load speedstep-centrino on IBM x336?
Date: Tue, 25 Oct 2005 09:21:30 -0700
Message-ID: <20051025092130.A8573@unix-os.sc.intel.com>
References: <88056F38E9E48644A0F562A38C64FB60061BE91E@scsmsx403.amr.corp.intel.com>
	<435DCE2B.6000201@us.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <435DCE2B.6000201@us.ibm.com>;
	from djwong@us.ibm.com on Mon, Oct 24, 2005 at 11:18:19PM -0700
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
To: "Darrick J. Wong" <djwong@us.ibm.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk, Chris McDermott <lcm@us.ibm.com>

On Mon, Oct 24, 2005 at 11:18:19PM -0700, Darrick J. Wong wrote:
> Ok, I tried acpi-cpufreq and tried to change the frequency from 3.6GHz
> to 2.8.  scaling_cur_freq says I'm at 2800MHz, but /proc/cpuinfo still
> says 3600.  In dmesg, I see "Writing 0x00000e1e to port 0x0800" at the
> very end of the log, but I don't see "Looking for 0x00000e1e from port
> 0x0804" like I think I should.  I don't see "Invalid port width..."
> either--it's as if we fell out of the function.
> 

If scaling_cur_freq shows you the right freq, then things should be working.
We recently removed "Looking for * from port" in the common path.

What /proc/cpuinfo shows kind of depends on other things. I had this patch 
in my queue that fixes things with /proc/cpuinfo. This should help here..

Thanks,
Venki


What is the value shown in "cpu MHz" of /proc/cpuinfo when CPUs are capable of 
changing frequency?

Today the answer is: It depends.
On i386:
SMP kernel - It is always the boot frequency
UP kernel - Scales with the frequency change and shows that was last set.

On x86_64:
There is one single variable cpu_khz that gets written by all the CPUs. So,
the frequency set by last CPU will be seen on /proc/cpuinfo of all the
CPUs in the system.

On ia64:
It is always boot time frequency of a particular CPU that gets displayed.


The patch below changes this to:
Show the last known frequency of the particular CPU, when cpufreq is present. If
cpu doesnot support changing of frequency through cpufreq, then boot frequency 
will be shown. The patch affects i386, x86_64 and ia64 architectures.

Signed-off-by: Venkatesh Pallipadi<venkatesh.pallipadi@intel.com>

Index: linux-2.6.12/arch/i386/kernel/cpu/proc.c
===================================================================
--- linux-2.6.12.orig/arch/i386/kernel/cpu/proc.c	2005-08-30 11:10:46.000000000 -0700
+++ linux-2.6.12/arch/i386/kernel/cpu/proc.c	2005-10-07 15:39:48.000000000 -0700
@@ -3,6 +3,7 @@
 #include <linux/string.h>
 #include <asm/semaphore.h>
 #include <linux/seq_file.h>
+#include <linux/cpufreq.h>
 
 /*
  *	Get CPU information for use by the procfs.
@@ -86,8 +87,11 @@
 		seq_printf(m, "stepping\t: unknown\n");
 
 	if ( cpu_has(c, X86_FEATURE_TSC) ) {
+		unsigned int freq = cpufreq_quick_get(n);
+		if (!freq)
+			freq = cpu_khz;
 		seq_printf(m, "cpu MHz\t\t: %u.%03u\n",
-			cpu_khz / 1000, (cpu_khz % 1000));
+			freq / 1000, (freq % 1000));
 	}
 
 	/* Cache size */
Index: linux-2.6.12/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.12.orig/drivers/cpufreq/cpufreq.c	2005-09-26 14:59:23.000000000 -0700
+++ linux-2.6.12/drivers/cpufreq/cpufreq.c	2005-10-07 15:46:08.000000000 -0700
@@ -830,6 +830,30 @@
 
 
 /** 
+ * cpufreq_quick_get - get the CPU frequency (in kHz) frpm policy->cur
+ * @cpu: CPU number
+ *
+ * This is the last known freq, without actually getting it from the driver.
+ * Return value will be same as what is shown in scaling_cur_freq in sysfs.
+ */
+unsigned int cpufreq_quick_get(unsigned int cpu)
+{
+	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+	unsigned int ret = 0;
+
+	if (policy) {
+		down(&policy->lock);
+		ret = policy->cur;
+		up(&policy->lock);
+		cpufreq_cpu_put(policy);
+	}
+
+	return (ret);
+}
+EXPORT_SYMBOL(cpufreq_quick_get);
+
+
+/** 
  * cpufreq_get - get the current CPU frequency (in kHz)
  * @cpu: CPU number
  *
Index: linux-2.6.12/arch/x86_64/kernel/setup.c
===================================================================
--- linux-2.6.12.orig/arch/x86_64/kernel/setup.c	2005-08-31 14:46:39.000000000 -0700
+++ linux-2.6.12/arch/x86_64/kernel/setup.c	2005-10-07 15:40:24.000000000 -0700
@@ -42,6 +42,7 @@
 #include <linux/edd.h>
 #include <linux/mmzone.h>
 #include <linux/kexec.h>
+#include <linux/cpufreq.h>
 
 #include <asm/mtrr.h>
 #include <asm/uaccess.h>
@@ -1187,8 +1188,11 @@
 		seq_printf(m, "stepping\t: unknown\n");
 	
 	if (cpu_has(c,X86_FEATURE_TSC)) {
+		unsigned int freq = cpufreq_quick_get(cpu);
+		if (!freq)
+			freq = cpu_khz;
 		seq_printf(m, "cpu MHz\t\t: %u.%03u\n",
-			     cpu_khz / 1000, (cpu_khz % 1000));
+			     freq / 1000, (freq % 1000));
 	}
 
 	/* Cache size */
Index: linux-2.6.12/arch/ia64/kernel/setup.c
===================================================================
--- linux-2.6.12.orig/arch/ia64/kernel/setup.c	2005-08-31 14:46:39.000000000 -0700
+++ linux-2.6.12/arch/ia64/kernel/setup.c	2005-10-07 15:41:38.000000000 -0700
@@ -43,6 +43,7 @@
 #include <linux/initrd.h>
 #include <linux/platform.h>
 #include <linux/pm.h>
+#include <linux/cpufreq.h>
 
 #include <asm/ia32.h>
 #include <asm/machvec.h>
@@ -474,6 +475,7 @@
 	char family[32], features[128], *cp, sep;
 	struct cpuinfo_ia64 *c = v;
 	unsigned long mask;
+	unsigned int proc_freq;
 	int i;
 
 	mask = c->features;
@@ -506,6 +508,10 @@
 		sprintf(cp, " 0x%lx", mask);
 	}
 
+	proc_freq = cpufreq_quick_get(cpunum);
+	if (!proc_freq)
+		proc_freq = c->proc_freq / 1000;
+
 	seq_printf(m,
 		   "processor  : %d\n"
 		   "vendor     : %s\n"
@@ -522,7 +528,7 @@
 		   "BogoMIPS   : %lu.%02lu\n",
 		   cpunum, c->vendor, family, c->model, c->revision, c->archrev,
 		   features, c->ppn, c->number,
-		   c->proc_freq / 1000000, c->proc_freq % 1000000,
+		   proc_freq / 1000, proc_freq % 1000,
 		   c->itc_freq / 1000000, c->itc_freq % 1000000,
 		   lpj*HZ/500000, (lpj*HZ/5000) % 100);
 #ifdef CONFIG_SMP
Index: linux-2.6.12/include/linux/cpufreq.h
===================================================================
--- linux-2.6.12.orig/include/linux/cpufreq.h	2005-09-26 14:59:25.000000000 -0700
+++ linux-2.6.12/include/linux/cpufreq.h	2005-10-07 14:19:05.000000000 -0700
@@ -259,6 +259,16 @@
 /* query the current CPU frequency (in kHz). If zero, cpufreq couldn't detect it */
 unsigned int cpufreq_get(unsigned int cpu);
 
+/* query the last known CPU freq (in kHz). If zero, cpufreq couldn't detect it */
+#ifdef CONFIG_CPU_FREQ
+unsigned int cpufreq_quick_get(unsigned int cpu);
+#else
+unsigned int cpufreq_quick_get(unsigned int cpu)
+{
+	return 0;
+}
+#endif
+
 
 /*********************************************************************
  *                       CPUFREQ DEFAULT GOVERNOR                    *
