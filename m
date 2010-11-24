From: Borislav Petkov <bp@amd64.org>
Subject: [PATCH 2/2] x86, powernow-k8: Fix exit path
Date: Wed, 24 Nov 2010 14:19:01 +0100
Message-ID: <1290604741-25151-2-git-send-email-bp@amd64.org>
References: <20101124131303.GA24892@aftab>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101124131303.GA24892@aftab>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>, Neil Brown <neilb@suse.de>, x86@kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>

From: Borislav Petkov <bp@alien8.de>

When Cool'n'Quiet is disabled in the BIOS we're missing _PSS
objects and powernow-k8 fails loading with a juicy firmware bug
message. However, on machines with boosting cpus, it forgets
to unreg from the cpu notifier chain leading to oops. See also
https://bugzilla.novell.com/show_bug.cgi?id=655215

Fix error path accordingly.

Originally-by: Neil Brown <neilb@suse.de>
Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
---
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index d2e53ac..ccfc68b 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1540,6 +1540,7 @@ static struct notifier_block cpb_nb = {
 static int __cpuinit powernowk8_init(void)
 {
 	unsigned int i, supported_cpus = 0, cpu;
+	int err = 0;
 
 	for_each_online_cpu(i) {
 		int rc;
@@ -1560,10 +1561,11 @@ static int __cpuinit powernowk8_init(void)
 
 		register_cpu_notifier(&cpb_nb);
 
+		err = -ENOMEM;
 		msrs = msrs_alloc();
 		if (!msrs) {
 			printk(KERN_ERR "%s: Error allocating msrs!\n", __func__);
-			return -ENOMEM;
+			goto unreg;
 		}
 
 		rdmsr_on_cpus(cpu_online_mask, MSR_K7_HWCR, msrs);
@@ -1577,7 +1579,15 @@ static int __cpuinit powernowk8_init(void)
 			(cpb_enabled ? "on" : "off"));
 	}
 
-	return cpufreq_register_driver(&cpufreq_amd64_driver);
+	err = cpufreq_register_driver(&cpufreq_amd64_driver);
+	if (!err)
+		goto out;
+
+unreg:
+	if (cpb_capable)
+		unregister_cpu_notifier(&cpb_nb);
+out:
+	return err;
 }
 
 /* driver entry point for term */
@@ -1585,7 +1595,7 @@ static void __exit powernowk8_exit(void)
 {
 	dprintk("exit\n");
 
-	if (boot_cpu_has(X86_FEATURE_CPB)) {
+	if (cpb_capable) {
 		msrs_free(msrs);
 		msrs = NULL;
 
-- 
1.7.3.1.50.g1e633

