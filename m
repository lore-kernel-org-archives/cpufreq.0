From: paul.devriendt@amd.com
Subject: [PATCH ] Add documentation on AMD powernow drivers
Date: Thu, 10 Jun 2004 12:24:33 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C14642AED@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Dave,

Please add a little piece of explanatory doc, as suggested by Dominik. Thanks.

Paul

diff -r -u --new-file linux-2.6.6/Documentation/cpu-freq/amd-powernow.txt linux-2.6.6.paul/Documentation/cpu-freq/amd-powernow.txt
--- linux-2.6.6/Documentation/cpu-freq/amd-powernow.txt	1969-12-31 18:00:00.000000000 -0600
+++ linux-2.6.6.paul/Documentation/cpu-freq/amd-powernow.txt	2004-06-10 10:55:31.000000000 -0500
@@ -0,0 +1,37 @@
+
+PowerNow! and Cool'n'Quiet are AMD names for frequency
+management capabilities in AMD processors. As the hardware
+implementation changes in new generations of the processors,
+there is a different cpu-freq driver for each generation.
+
+Note that the driver's will not load on the "wrong" hardware,
+so it is safe to try each driver in turn when in doubt as to
+which is the correct driver.
+
+Note that the functionality to change frequency (and voltage)
+is not available in all processors. The drivers will refuse
+to load on processors without this capability. The capability
+is detected with the cpuid instruction.
+
+The drivers use BIOS supplied tables to obtain frequency and
+voltage information appropriate for a particular platform.
+Frequency transitions will be unavailable if the BIOS does
+not supply these tables.
+
+6th Generation: powernow-k6
+
+7th Generation: powernow-k7: Athlon, Duron, Geode.
+
+8th Generation: powernow-k8: Athlon, Athlon 64, Opteron, Sempron.
+Documentation on this functionality in 8th generation processors
+is available in the "BIOS and Kernel Developer's Guide", publication
+26094, in chapter 9, available for download from www.amd.com <www.amd.com> . 
+
+BIOS supplied data, for powernow-k7 and for powernow-k8, may be
+from either the PSB table or from ACPI objects. The ACPI support
+is only available if the kernel config sets CONFIG_ACPI_PROCESSOR.
+The powernow-k8 driver will attempt to use ACPI if so configured,
+and fall back to PST if that fails.
+The powernow-k7 driver will try to use the PSB support first, and
+fall back to ACPI if the PSB support fails.
+
