From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: core Kconfig fix
Date: Sat, 4 Sep 2004 08:20:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040904062038.GA25413@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

cpufreq core Kconfig fix:
- 24_API is a part of the userspace governor, so keep it directly below the userspace governor

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/Kconfig linux/drivers/cpufreq/Kconfig
--- linux-original/drivers/cpufreq/Kconfig	2004-09-04 08:15:44.110497328 +0200
+++ linux/drivers/cpufreq/Kconfig	2004-09-04 08:18:40.146735752 +0200
@@ -69,6 +69,21 @@
 
 	  If in doubt, say Y.
 
+config CPU_FREQ_24_API
+	bool "/proc/sys/cpu/ interface (2.4. / OLD)"
+	depends on CPU_FREQ_GOV_USERSPACE
+	depends on SYSCTL
+	help
+	  This enables the /proc/sys/cpu/ sysctl interface for controlling
+	  the CPUFreq,"userspace" governor. This is the same interface
+	  as known from the 2.4.-kernel patches for CPUFreq, and offers
+	  the same functionality as long as "userspace" is the
+	  selected governor for the specified CPU.
+	
+	  For details, take a look at <file:Documentation/cpu-freq/>.
+
+	  If in doubt, say N.
+
 config CPU_FREQ_GOV_ONDEMAND
 	tristate "'ondemand' cpufreq policy governor"
 	depends on CPU_FREQ
@@ -83,17 +98,3 @@
 	  For details, take a look at linux/Documentation/cpu-freq.
 
 	  If in doubt, say N.
-
-config CPU_FREQ_24_API
-	bool "/proc/sys/cpu/ interface (2.4. / OLD)"
-	depends on CPU_FREQ && SYSCTL && CPU_FREQ_GOV_USERSPACE
-	help
-	  This enables the /proc/sys/cpu/ sysctl interface for controlling
-	  the CPUFreq,"userspace" governor. This is the same interface
-	  as known from the 2.4.-kernel patches for CPUFreq, and offers
-	  the same functionality as long as "userspace" is the
-	  selected governor for the specified CPU.
-	
-	  For details, take a look at <file:Documentation/cpu-freq/>.
-
-	  If in doubt, say N.
