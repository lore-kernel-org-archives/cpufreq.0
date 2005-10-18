From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5435] Powernow code has random CPU speed
Date: Tue, 18 Oct 2005 07:31:21 -0700
Message-ID: <200510181431.j9IEVL8t024507@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5435





------- Additional Comments From Larry.Finger@lwfinger.net  2005-10-18 07:28 -------
I think I now understand this problem. As noted earlier, calibrate_tsc is being
called twice. The first call always results in the correct result; however the
second sometimes returns too small a value because 'count' is too small. As
interrupts are enabled during the second call, it is likely that this routine
was interrupted. During the interrupt processing, the contents of the RDTSC are
increasing but the loop counter 'count' will not be incremented.

The attached patch makes two changes. The first forces the initial value of
cpu_khz to be zero (may not be encessary), and the second skips the
redetermination of cpu_khz in init_cpu_khz if it is non-zero meaning that it has
already been determined.

 
diff --git a/arch/i386/kernel/time.c b/arch/i386/kernel/time.c
--- a/arch/i386/kernel/time.c
+++ b/arch/i386/kernel/time.c
@@ -78,7 +78,7 @@ u64 jiffies_64 = INITIAL_JIFFIES;

 EXPORT_SYMBOL(jiffies_64);

-unsigned int cpu_khz;  /* Detected as we calibrate the TSC */
+unsigned int cpu_khz=0;        /* Detected as we calibrate the TSC */
 EXPORT_SYMBOL(cpu_khz);

 extern unsigned long wall_jiffies;
diff --git a/arch/i386/kernel/timers/common.c b/arch/i386/kernel/timers/common.c
--- a/arch/i386/kernel/timers/common.c
+++ b/arch/i386/kernel/timers/common.c
@@ -151,7 +151,7 @@ unsigned long read_timer_tsc(void)
 /* calculate cpu_khz */
 void init_cpu_khz(void)
 {
-       if (cpu_has_tsc) {
+       if (cpu_has_tsc && !cpu_khz) {
                unsigned long tsc_quotient = calibrate_tsc();
                if (tsc_quotient) {
                        /* report CPU clock rate in Hz.


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
