From: Russell King <rmk@arm.linux.org.uk>
Subject: [PATCH] Fix ARM cpufreq governor selection
Date: Sat, 21 Feb 2004 00:19:16 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040221001916.E22043@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, David Jones <davej@redhat.com>

The patch below fixes the cpufreq governor selection such that it
finally works as expected on ARM platforms.

===== arch/arm/Kconfig 1.40 vs edited =====
--- 1.40/arch/arm/Kconfig	Sat Oct  4 14:36:50 2003
+++ edited/arch/arm/Kconfig	Tue Jan 27 10:53:53 2004
@@ -336,14 +336,12 @@
 	bool
 	depends on CPU_FREQ && SA1100_LART
 	default y
-	select CPU_FREQ_DEFAULT_GOV_USERSPACE
 	select CPU_FREQ_24_API if SYSCTL
 
 config CPU_FREQ_SA1110
 	bool
 	depends on CPU_FREQ && (SA1100_ASSABET || SA1100_CERF || SA1100_PT_SYSTEM3)
 	default y
-	select CPU_FREQ_DEFAULT_GOV_USERSPACE
 	select CPU_FREQ_24_API if SYSCTL
 
 config CPU_FREQ_INTEGRATOR
===== drivers/cpufreq/Kconfig 1.7 vs edited =====
--- 1.7/drivers/cpufreq/Kconfig	Mon Jan  5 18:43:42 2004
+++ edited/drivers/cpufreq/Kconfig	Tue Jan 27 10:53:48 2004
@@ -13,7 +13,8 @@
 choice
 	prompt "Default CPUFreq governor"
 	depends on CPU_FREQ
-	default CPU_FREQ_DEFAULT_GOV_PERFORMANCE
+	default CPU_FREQ_DEFAULT_GOV_PERFORMANCE if !CPU_FREQ_SA1100 && !CPU_FREQ_SA1110
+	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
 	help
 	  This option sets which CPUFreq governor shall be loaded at
 	  startup. If in doubt, select 'performance'.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
