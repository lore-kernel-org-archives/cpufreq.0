From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/Documentation/cpufreq core.txt,1.2,1.3 cpu-drivers.txt,1.3,1.4 governors.txt,1.2,1.3 user-guide.txt,1.4,1.5
Date: Tue, 19 Aug 2003 14:39:04 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6hU-0005kO-Gq@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq
In directory flint:/tmp/cvs-serv22028/linux/Documentation/cpufreq

Modified Files:
	core.txt cpu-drivers.txt governors.txt user-guide.txt 
Log Message:
sync with latest davej version

Index: core.txt
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq/core.txt,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- core.txt	7 Mar 2003 10:35:36 -0000	1.2
+++ core.txt	19 Aug 2003 13:38:31 -0000	1.3
@@ -73,9 +73,9 @@
 The third argument, a void *pointer, points to a struct cpufreq_policy
 consisting of five values: cpu, min, max, policy and max_cpu_freq. min 
 and max are the lower and upper frequencies (in kHz) of the new
-policy, policy the new policy, cpu the number of the affected CPU or
-CPUFREQ_ALL_CPUS for all CPUs; and max_cpu_freq the maximum supported
-CPU frequency. This value is given for informational purposes only.
+policy, policy the new policy, cpu the number of the affected CPU; and 
+max_cpu_freq the maximum supported CPU frequency. This value is given 
+for informational purposes only.
 
 
 2.2 CPUFreq transition notifiers
@@ -89,6 +89,6 @@
 
 The third argument is a struct cpufreq_freqs with the following
 values:
-cpu	- number of the affected CPU or CPUFREQ_ALL_CPUS
+cpu	- number of the affected CPU
 old	- old frequency
 new	- new frequency

Index: cpu-drivers.txt
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq/cpu-drivers.txt,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- cpu-drivers.txt	16 Jun 2003 21:07:37 -0000	1.3
+++ cpu-drivers.txt	19 Aug 2003 13:38:31 -0000	1.4
@@ -41,16 +41,17 @@
 1.1 Initialization
 ------------------
 
-First of all, in an __initcall level 7 or later (preferrably
-module_init() so that your driver is modularized) function check
-whether this kernel runs on the right CPU and the right chipset. If
-so, register a struct cpufreq_driver with the CPUfreq core using
-cpufreq_register_driver()
+First of all, in an __initcall level 7 (module_init()) or later
+function check whether this kernel runs on the right CPU and the right
+chipset. If so, register a struct cpufreq_driver with the CPUfreq core
+using cpufreq_register_driver()
 
 What shall this struct cpufreq_driver contain? 
 
 cpufreq_driver.name -		The name of this driver.
 
+cpufreq_driver.owner -		THIS_MODULE;
+
 cpufreq_driver.init -		A pointer to the per-CPU initialization 
 				function.
 
@@ -76,8 +77,7 @@
 cpufreq_driver.init is called. It takes a struct cpufreq_policy
 *policy as argument. What to do now?
 
-If necessary, activate the CPUfreq support on your CPU (unlock that
-register etc.).
+If necessary, activate the CPUfreq support on your CPU.
 
 Then, the driver must fill in the following values:
 

Index: governors.txt
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq/governors.txt,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- governors.txt	16 Jun 2003 21:07:37 -0000	1.2
+++ governors.txt	19 Aug 2003 13:38:31 -0000	1.3
@@ -135,21 +135,21 @@
 The CPUfreq governor may call the CPU processor driver using one of
 these two functions:
 
-inline int cpufreq_driver_target(struct cpufreq_policy *policy,
+int cpufreq_driver_target(struct cpufreq_policy *policy,
                                  unsigned int target_freq,
                                  unsigned int relation);
 
-inline int cpufreq_driver_target_l(struct cpufreq_policy *policy,
+int __cpufreq_driver_target(struct cpufreq_policy *policy,
                                    unsigned int target_freq,
                                    unsigned int relation);
 
 target_freq must be within policy->min and policy->max, of course.
 What's the difference between these two functions? When your governor
 still is in a direct code path of a call to governor->governor, the
-cpufreq_driver_sem lock is still held in the cpufreq core, and there's
+per-CPU cpufreq lock is still held in the cpufreq core, and there's
 no need to lock it again (in fact, this would cause a deadlock). So
-use cpufreq_driver_target only in these cases. In all other cases (for
-example, when there's a "daemonized" function that wakes up every
-second), use cpufreq_driver_target_l to lock the cpufreq_driver_sem
-before the command is passed to the cpufreq processor driver.
+use __cpufreq_driver_target only in these cases. In all other cases 
+(for example, when there's a "daemonized" function that wakes up 
+every second), use cpufreq_driver_target to lock the cpufreq per-CPU
+lock before the command is passed to the cpufreq processor driver.
 

Index: user-guide.txt
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq/user-guide.txt,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- user-guide.txt	17 Jun 2003 13:21:20 -0000	1.4
+++ user-guide.txt	19 Aug 2003 13:38:31 -0000	1.5
@@ -21,6 +21,8 @@
 1.1 ARM
 1.2 x86
 1.3 sparc64
+1.4 ppc
+1.5 SuperH
 
 2. "Policy" / "Governor"?
 2.1 Policy
@@ -77,6 +79,20 @@
 UltraSPARC-III
 
 
+1.4 ppc
+-------
+
+Several "PowerBook" and "iBook2" notebooks are supported.
+
+
+1.5 SuperH
+----------
+
+The following SuperH processors are supported by cpufreq:
+
+SH-3
+SH-4
+
 
 2. "Policy" / "Governor" ?
 ==========================
@@ -116,7 +132,7 @@
 The preferred interface is located in the sysfs filesystem. If you
 mounted it at /sys, the cpufreq interface is located in a subdirectory
 "cpufreq" within the cpu-device directory
-(e.g. /sys/class/cpu/cpu0/cpufreq/ for the first CPU).
+(e.g. /sys/devices/system/cpu/cpu0/cpufreq/ for the first CPU).
 
 cpuinfo_min_freq :		this file shows the minimum operating
 				frequency the processor can run at(in kHz) 
