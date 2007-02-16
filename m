From: Thomas Renninger <trenn@suse.de>
Subject: Revert default on deprecated config X86_SPEEDSTEP_CENTRINO_ACPI
Date: Fri, 16 Feb 2007 08:44:43 +0100
Message-ID: <1171611883.25027.1085.camel@d36.suse.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq <cpufreq@lists.linux.org.uk>
Cc: Dave Jones <davej@redhat.com>

Can this be applied, pls.

Thanks,

   Thomas

Revert default on deprecated config X86_SPEEDSTEP_CENTRINO_ACPI


Signed-off-by: Thomas Renninger <trenn@suse.de>

 arch/i386/kernel/cpu/cpufreq/Kconfig |    1 -
 arch/x86_64/kernel/cpufreq/Kconfig   |    1 -
 2 files changed, 2 deletions(-)

Index: linux-2.6.20/arch/x86_64/kernel/cpufreq/Kconfig
===================================================================
--- linux-2.6.20.orig/arch/x86_64/kernel/cpufreq/Kconfig
+++ linux-2.6.20/arch/x86_64/kernel/cpufreq/Kconfig
@@ -45,7 +45,6 @@ config X86_SPEEDSTEP_CENTRINO
 config X86_SPEEDSTEP_CENTRINO_ACPI
 	bool
 	depends on X86_SPEEDSTEP_CENTRINO
-	default y
 
 config X86_ACPI_CPUFREQ
 	tristate "ACPI Processor P-States driver"
Index: linux-2.6.20/arch/i386/kernel/cpu/cpufreq/Kconfig
===================================================================
--- linux-2.6.20.orig/arch/i386/kernel/cpu/cpufreq/Kconfig
+++ linux-2.6.20/arch/i386/kernel/cpu/cpufreq/Kconfig
@@ -125,7 +125,6 @@ config X86_SPEEDSTEP_CENTRINO_ACPI
 	bool "Use ACPI tables to decode valid frequency/voltage (deprecated)"
 	depends on X86_SPEEDSTEP_CENTRINO && ACPI_PROCESSOR
 	depends on !(X86_SPEEDSTEP_CENTRINO = y && ACPI_PROCESSOR = m)
-	default y
 	help
 	  This is deprecated and this functionality is now merged into
 	  acpi_cpufreq (X86_ACPI_CPUFREQ). Use that driver instead of
