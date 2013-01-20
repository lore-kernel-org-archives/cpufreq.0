From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH 6/6] powernow-k8: Cleanup init function
Date: Sun, 20 Jan 2013 11:24:30 +0100
Message-ID: <1358677470-17394-7-git-send-email-bp@alien8.de>
References: <1358677470-17394-1-git-send-email-bp@alien8.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=jPCA0ReaSjt7ZrNBySpKhZZv7OmAgd+DoEfvXckWzPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ad5s
	M+aF2/0jSWvFn/nTp3KS2mfWYAciDsLmhHePP+v/M353ECXhAAJVLmhWuqBmUnz2nDh
	6Vtn+pMwTp5rBsC/nzl92HlA2ZTJj6NZjoPf5Uin4er016JZuDv+pFOW614TV8P0RIN
	m6H7PIyCeuJnY/UjtAqG+LekEMXsMBflw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=jPCA0ReaSjt7ZrNBySpKhZZv7OmAgd+DoEfvXckWzPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ad5s
	M+aF2/0jSWvFn/nTp3KS2mfWYAciDsLmhHePP+v/M353ECXhAAJVLmhWuqBmUnz2nDh
	6Vtn+pMwTp5rBsC/nzl92HlA2ZTJj6NZjoPf5Uin4er016JZuDv+pFOW614TV8P0RIN
	m6H7PIyCeuJnY/UjtAqG+LekEMXsMBflw=
In-Reply-To: <1358677470-17394-1-git-send-email-bp@alien8.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, Tom Gundersen <teg@jklm.no>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

Make it hotplug-safe and cleanup formatting.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/cpufreq/powernow-k8.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 0234d0c6d68c..d13a13678b5f 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1271,7 +1271,7 @@ static void __request_acpi_cpufreq(void)
 static int __cpuinit powernowk8_init(void)
 {
 	unsigned int i, supported_cpus = 0;
-	int rv;
+	int ret;
 
 	if (static_cpu_has(X86_FEATURE_HW_PSTATE)) {
 		__request_acpi_cpufreq();
@@ -1281,24 +1281,27 @@ static int __cpuinit powernowk8_init(void)
 	if (!x86_match_cpu(powernow_k8_ids))
 		return -ENODEV;
 
+	get_online_cpus();
 	for_each_online_cpu(i) {
-		int rc;
-		smp_call_function_single(i, check_supported_cpu, &rc, 1);
-		if (rc == 0)
+		smp_call_function_single(i, check_supported_cpu, &ret, 1);
+		if (!ret)
 			supported_cpus++;
 	}
 
-	if (supported_cpus != num_online_cpus())
+	if (supported_cpus != num_online_cpus()) {
+		put_online_cpus();
 		return -ENODEV;
+	}
+	put_online_cpus();
 
-	rv = cpufreq_register_driver(&cpufreq_amd64_driver);
+	ret = cpufreq_register_driver(&cpufreq_amd64_driver);
+	if (ret)
+		return ret;
 
-	if (!rv)
-		pr_info(PFX "Found %d %s (%d cpu cores) (" VERSION ")\n",
-			num_online_nodes(), boot_cpu_data.x86_model_id,
-			supported_cpus);
+	pr_info(PFX "Found %d %s (%d cpu cores) (" VERSION ")\n",
+		num_online_nodes(), boot_cpu_data.x86_model_id, supported_cpus);
 
-	return rv;
+	return ret;
 }
 
 /* driver entry point for term */
-- 
1.8.1.rc3
