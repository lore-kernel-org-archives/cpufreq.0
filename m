From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] acpi-cpufreq: add error handling for
	cpufreq_register_driver() error
Date: Mon, 14 Jul 2008 11:59:44 +0900
Message-ID: <20080714025944.GA17281@sssvn.sssvn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

add error handling for cpufreq_register_driver() error

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk
---
 arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

Index: 2.6-mmotm/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- 2.6-mmotm.orig/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ 2.6-mmotm/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -785,7 +785,11 @@ static int __init acpi_cpufreq_init(void
 	if (ret)
 		return ret;
 
-	return cpufreq_register_driver(&acpi_cpufreq_driver);
+	ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+	if (ret)
+		free_percpu(acpi_perf_data);
+
+	return ret;
 }
 
 static void __exit acpi_cpufreq_exit(void)
@@ -795,8 +799,6 @@ static void __exit acpi_cpufreq_exit(voi
 	cpufreq_unregister_driver(&acpi_cpufreq_driver);
 
 	free_percpu(acpi_perf_data);
-
-	return;
 }
 
 module_param(acpi_pstate_strict, uint, 0644);
