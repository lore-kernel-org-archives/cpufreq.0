From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH] remove invalid setting in powernow-k8
Date: Thu, 2 Oct 2003 17:47:51 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031002154751.GA18509@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, paul.devriendt@amd.com

The Powernow-K8 cpufreq driver does not yet depend on CPUFreq 
Frequency Table support - but work is going on in this direction.
Nevertheless, remove this dependency, but mark this driver as being 
"experimental".

Also, fix up the invalid usage of pol->policy in drv_init() and mark it
with a warning in drv_verify()

 arch/i386/kernel/cpu/cpufreq/Kconfig       |    2 +-
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-10-02 17:36:39.255184952 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-10-02 17:40:41.915295008 +0200
@@ -90,7 +90,7 @@
 
 config X86_POWERNOW_K8
 	tristate "AMD Opteron/Athlon64 PowerNow!"
-	depends on CPU_FREQ_TABLE
+	depends on CPU_FREQ && EXPERIMENTAL
 	help
 	  This adds the CPUFreq driver for mobile AMD Opteron/Athlon64 processors.
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-10-02 17:36:39.256184800 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-10-02 17:40:19.927637640 +0200
@@ -935,6 +935,7 @@
 		return -ENODEV;
 	}
 
+#warning pol->policy is in undefined state here
 	res = find_match(&targ, &min, &max,
 			 pol->policy == CPUFREQ_POLICY_POWERSAVE ?
 			 SEARCH_DOWN : SEARCH_UP, 0, 0);
@@ -954,7 +955,7 @@
 		return -ENODEV;
 	}
 
-	pol->policy = CPUFREQ_POLICY_PERFORMANCE; /* boot as fast as we can */
+	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	/* Take a crude guess here. */
 	pol->cpuinfo.transition_latency = ((rvo + 8) * vstable * VST_UNITS_20US)
