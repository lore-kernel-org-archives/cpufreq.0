From: Neil Brown <neilb@suse.de>
Subject: Missing "unregister_cpu_notifier" in powernow-k8.c
Date: Wed, 24 Nov 2010 11:28:01 +1100
Message-ID: <20101124112801.78830fba@notabene.brown>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: x86@kernel.org, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>
Cc: linux-kernel@vger.kernel.org


Hi,
 (hope I got the right addressees above....)

 I appears that when powernow-k8 find that 

    No compatible ACPI _PSS objects found.

 and suggests

    Try again with latest BIOS.

 it fails the module load, but does not unregister the cpu_notifier that was 
 registered in powernowk8_init

 This ends up leaving freed memory on the cpu notifier list for some other
 poor module (e.g. md/raid5) to come along and trip over.

 The following might be a partial fix, but I suspect there is probably other
 clean-up that is needed.

 ( https://bugzilla.novell.com/show_bug.cgi?id=655215 has full dmesg traces).

Thanks,
NeilBrown


diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 491977b..812778c 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1537,6 +1537,7 @@ static struct notifier_block cpb_nb = {
 static int __cpuinit powernowk8_init(void)
 {
 	unsigned int i, supported_cpus = 0, cpu;
+	int rv;
 
 	for_each_online_cpu(i) {
 		int rc;
@@ -1574,7 +1575,10 @@ static int __cpuinit powernowk8_init(void)
 			(cpb_enabled ? "on" : "off"));
 	}
 
-	return cpufreq_register_driver(&cpufreq_amd64_driver);
+	rv = cpufreq_register_driver(&cpufreq_amd64_driver);
+	if (rv < 0 && boot_cpu_has(X86_FEATURE_CPB))
+		unregister_cpu_notifier(&cpb_nb);
+	return rv;
 }
 
 /* driver entry point for term */
