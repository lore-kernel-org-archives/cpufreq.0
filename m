From: Dominik Brodowski <linux@brodo.de>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Tue, 2 Sep 2003 17:13:48 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902151348.GB8512@brodo.de>
References: <871xuzbycu.wl%miura@da-cha.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
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


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yet more patches for your speedstep-smi driver:

naming
	let's call this driver "speedstep-smi" in cpufreq_driver also

frequency_detection_fallback
	if the smi_get_freqs call fails, fall back to the "let's try it out
and see what frequency we are at" mechanism. Needed on my notebook (at
least).


	Dominik

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="speedstep-2.6.0-test4-frequency_detection_fallback"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-09-02 16:14:28.533376808 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-09-02 16:29:26.763825024 +0200
@@ -99,19 +99,6 @@
 
 	 If in doubt, say N.
 
-config X86_SPEEDSTEP_ICH
-	tristate "Intel Speedstep"
-	depends on CPU_FREQ_TABLE
-	help
-	  This adds the CPUFreq driver for certain mobile Intel Pentium III
-	  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
-	  mobile Intel Pentium 4 P4-Ms, with an Intel ICH2, ICH3,
-	  or ICH4 southbridge.
-
-	  For details, take a look at linux/Documentation/cpu-freq. 
-
-	  If in doubt, say N.
-
 config X86_SPEEDSTEP_CENTRINO
 	tristate "Intel Enhanced SpeedStep"
 	depends on CPU_FREQ_TABLE
@@ -123,23 +110,36 @@
 	  
 	  If in doubt, say N.
 
-config X86_SPEEDSTEP_LIB
-       tristate
-       depends on X86_SPEEDSTEP_ICH
-       default X86_SPEEDSTEP_ICH
+config X86_SPEEDSTEP_ICH
+	tristate "Intel Speedstep on ICH-M chipsets (ioport interface)"
+	depends on CPU_FREQ_TABLE
+	help
+	  This adds the CPUFreq driver for certain mobile Intel Pentium III
+	  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
+	  mobile Intel Pentium 4 P4-M on systems which have an Intel ICH2, 
+	  ICH3 or ICH4 southbridge.
+
+	  For details, take a look at linux/Documentation/cpu-freq. 
+
+	  If in doubt, say N.
 
 config X86_SPEEDSTEP_SMI
-	tristate "Intel SpeedStep with 440BX/MX"
+	tristate "Intel SpeedStep on 440BX/ZX/MX chipsets (SMI interface)"
 	depends on CPU_FREQ
 	help
-	  This adds the CPUFreq driver for mobile Intel Pentium III
+	  This adds the CPUFreq driver for certain mobile Intel Pentium III
 	  (Coppermine), all mobile Intel Pentium III-M (Tualatin)  
-	  with an Intel 440BX/ZX/MX southbridge.
+	  on systems which have an Intel 440BX/ZX/MX southbridge.
 
 	  For details, take a look at linux/Documentation/cpu-freq.
 
 	  If in doubt, say N.
 
+config X86_SPEEDSTEP_LIB
+	tristate
+	depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI)
+	default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI)
+
 config X86_P4_CLOCKMOD
 	tristate "Intel Pentium 4 clock modulation"
 	depends on CPU_FREQ_TABLE
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 16:26:15.956832096 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 16:41:36.060955008 +0200
@@ -20,6 +20,8 @@
 #include <linux/slab.h>
 #include <asm/ist.h>
 
+#include "speedstep-lib.h"
+
 /* speedstep system management interface port/command.
  *
  * These parameters are got from IST-SMI BIOS call.
@@ -228,8 +230,25 @@
 	/* detect low and high frequency */
 	result = speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				         &speedstep_freqs[SPEEDSTEP_HIGH].frequency);
-	if (result)
-		return result;
+	if (result) {
+		/* fall back to speedstep_lib.c dection mechanism: try both states out */
+		unsigned int speedstep_processor = speedstep_detect_processor();
+
+		dprintk(KERN_INFO "speedstep-smi: could not detect low and high frequencies by SMI call.\n");
+		if (!speedstep_processor)
+			return -ENODEV;
+
+		result = (int) speedstep_get_freqs(speedstep_processor,
+					     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
+					     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
+					     &speedstep_set_state);
+
+		if (result) {
+			dprintk(KERN_INFO "speedstep-smi: could not detect two different speeds -- aborting.\n");
+			return result;
+		} else
+			dprintk(KERN_INFO "speedstep-smi: workaround worked.\n");
+	}
 
 	/* get current speed setting */
 	state = speedstep_get_state();

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="speedstep-2.6.0-test4-naming"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 16:14:28.532376960 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-09-02 16:16:34.896166744 +0200
@@ -260,7 +260,7 @@
 
 
 static struct cpufreq_driver speedstep_driver = {
-	.name		= "speedstep",
+	.name		= "speedstep-smi",
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--7JfCtLOvnd9MIVvH--

