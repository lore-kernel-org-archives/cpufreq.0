From: Rafal Bilski <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul: Disable driver by default
Date: Tue, 27 Nov 2012 22:13:55 +0000
Message-ID: <1354054435-2459-1-git-send-email-rafalbilski@interia.pl>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
	s=biztos; t=1354054444;
	bh=7Zcm7HoI0qgCv8UIn/hdPBMCE1ll46fm231sKuzr3ok=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-Interia-Antivirus;
	b=F26m2PEo3ER8M3Emor2BdAFS9g+kxRU7Yqp4SZx0rs/3LG0JIG4LB/XJSx/JRkKTU
	 l60O5AQtprPNOvVNRLSXsNY4pqJiHsFKsEJ+qqThV/DTsb7OxtR0e0c0U7Gs1PiXYv
	 pEluiAm2eXKyz0lCoXLzlvmCPzFr4Gi6hgXdFd3k=
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

This is only solution I can think of. User decides if he wants this
driver on his machine. I don't have enough knowledge and time to find
the reason why same code works on some machines and doesn't on others
which use same, or very similar,  chipset and processor.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>

---
 drivers/cpufreq/longhaul.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/longhaul.c b/drivers/cpufreq/longhaul.c
index 53ddbc7..0bf5bd1 100644
--- a/drivers/cpufreq/longhaul.c
+++ b/drivers/cpufreq/longhaul.c
@@ -77,7 +77,7 @@ static unsigned int longhaul_index;
 static int scale_voltage;
 static int disable_acpi_c3;
 static int revid_errata;
-
+static int enable;
 
 /* Clock ratios multiplied by 10 */
 static int mults[32];
@@ -965,6 +965,10 @@ static int __init longhaul_init(void)
 	if (!x86_match_cpu(longhaul_id))
 		return -ENODEV;
 
+	if (!enable) {
+		printk(KERN_ERR PFX "Option \"enable\" not set. Aborting.\n");
+		return -ENODEV;
+	}
 #ifdef CONFIG_SMP
 	if (num_online_cpus() > 1) {
 		printk(KERN_ERR PFX "More than 1 CPU detected, "
@@ -1021,6 +1025,10 @@ MODULE_PARM_DESC(scale_voltage, "Scale voltage of processor");
  * such. */
 module_param(revid_errata, int, 0644);
 MODULE_PARM_DESC(revid_errata, "Ignore CPU Revision ID");
+/* By default driver is disabled to prevent incompatible
+ * system freeze. */
+module_param(enable, int, 0644);
+MODULE_PARM_DESC(enable, "Enable driver");
 
 MODULE_AUTHOR("Dave Jones <davej@redhat.com>");
 MODULE_DESCRIPTION("Longhaul driver for VIA Cyrix processors.");
-- 
1.8.0

