From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH 5/6] powernow-k8: Cleanup module request
Date: Sun, 20 Jan 2013 11:24:29 +0100
Message-ID: <1358677470-17394-6-git-send-email-bp@alien8.de>
References: <1358677470-17394-1-git-send-email-bp@alien8.de>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=RfzVF68s3SiPP/aIBbWgnNpDZMhL1s6C0bCjqe1ku7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=V061
	TYOq4GTJi+EWe2Xlkw2uOuZo0z44h7hKIUShANVdTsUQV2S7RWYquxMXcJqWq+UjwgD
	YiH9DovSn/o5CEQ0SJDG/cb64JiNHR7GvZMjFuesRThsUHyOnHk1QfcPS8FHamb0gfB
	ku6EVXl2Lr2U7tg7LPEaP/FfV3iKTdcMY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358677478; bh=RfzVF68s3SiPP/aIBbWgnNpDZMhL1s6C0bCjqe1ku7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=V061
	TYOq4GTJi+EWe2Xlkw2uOuZo0z44h7hKIUShANVdTsUQV2S7RWYquxMXcJqWq+UjwgD
	YiH9DovSn/o5CEQ0SJDG/cb64JiNHR7GvZMjFuesRThsUHyOnHk1QfcPS8FHamb0gfB
	ku6EVXl2Lr2U7tg7LPEaP/FfV3iKTdcMY=
In-Reply-To: <1358677470-17394-1-git-send-email-bp@alien8.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, Tom Gundersen <teg@jklm.no>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

Check whether we've actually already loaded acpi-cpufreq before
requesting it.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/cpufreq/powernow-k8.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 056faf6af1a9..0234d0c6d68c 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1249,6 +1249,24 @@ static struct cpufreq_driver cpufreq_amd64_driver = {
 	.attr		= powernow_k8_attr,
 };
 
+static void __request_acpi_cpufreq(void)
+{
+	const char *cur_drv, *drv = "acpi-cpufreq";
+
+	cur_drv = cpufreq_get_current_driver();
+	if (!cur_drv)
+		goto request;
+
+	if (strncmp(cur_drv, drv, min_t(size_t, strlen(cur_drv), strlen(drv))))
+		pr_warn(PFX "WTF driver: %s\n", cur_drv);
+
+	return;
+
+ request:
+	pr_warn(PFX "This CPU is not supported anymore, using acpi-cpufreq instead.\n");
+	request_module(drv);
+}
+
 /* driver entry point for init */
 static int __cpuinit powernowk8_init(void)
 {
@@ -1256,8 +1274,7 @@ static int __cpuinit powernowk8_init(void)
 	int rv;
 
 	if (static_cpu_has(X86_FEATURE_HW_PSTATE)) {
-		pr_warn(PFX "this CPU is not supported anymore, using acpi-cpufreq instead.\n");
-		request_module("acpi-cpufreq");
+		__request_acpi_cpufreq();
 		return -ENODEV;
 	}
 
-- 
1.8.1.rc3

