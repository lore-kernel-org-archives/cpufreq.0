From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix powernow-k8 compilation [bug 3180]
Date: Wed, 11 Aug 2004 12:20:51 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040811102051.GA3536@dominikbrodowski.de>
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

Propagate the new CONFIG_X86_POWERNOW_K8_ACPI to powernow-k8.h to avoid
compile breakage. Fixes bug 3180.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2004-08-11 11:03:03.953517072 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2004-08-11 11:07:05.916733072 +0200
@@ -29,7 +29,7 @@
 	 * frequency is in kHz */
 	struct cpufreq_frequency_table  *powernow_table;
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K8_ACPI
 	/* the acpi table needs to be kept. it's only available if ACPI was
 	 * used to determine valid frequency/vid/fid states */
 	struct acpi_processor_performance acpi_data;
