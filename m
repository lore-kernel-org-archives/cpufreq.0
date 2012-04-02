From: Rafal Bilski <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul: Check for CPU model first
Date: Mon,  2 Apr 2012 21:41:47 +0100
Message-ID: <1333399307-1572-1-git-send-email-rafalbilski@interia.pl>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
	s=biztos; t=1333402848;
	bh=IeQ09whOaLEK19NmbytoyReN/xhVf8tRWPIZgmSBQkI=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-Interia-Antivirus;
	b=AHiTKSjAs6DSbDHk03l2SmYyGWh3c67psjdBGl11vUx8EuPk9VYEu+1B0vKhNqpWY
	 PUfcLcYArwbatYbBLAUPvnfaKs29VA5WRFWNHvRtvQT2CTJnQ2yEqbp6Y4C7jfayZR
	 XDpI4wIIwrD5gVh8g8qsMNWhVptzBaEKPeY0z1uk=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, Rafal Bilski <rafalbilski@interia.pl>

This patch fixes bug 16274. This is C3 only driver, but APIC and
SMP checks are executed on any Centaur processor. Check for CPU
model first and stop produce bogus error messages on C7 and Nano
systems.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---

Please close bug 16274 if this patch is accepted.

 drivers/cpufreq/longhaul.c |   25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/longhaul.c b/drivers/cpufreq/longhaul.c
index f47d26e..f70287e 100644
--- a/drivers/cpufreq/longhaul.c
+++ b/drivers/cpufreq/longhaul.c
@@ -959,22 +959,23 @@ static int __init longhaul_init(void)
 	if (c->x86_vendor != X86_VENDOR_CENTAUR || c->x86 != 6)
 		return -ENODEV;
 
+	switch (c->x86_model) {
+	case 6 ... 9:
 #ifdef CONFIG_SMP
-	if (num_online_cpus() > 1) {
-		printk(KERN_ERR PFX "More than 1 CPU detected, "
-				"longhaul disabled.\n");
-		return -ENODEV;
-	}
+		if (num_online_cpus() > 1) {
+			printk(KERN_ERR PFX "More than 1 CPU detected, "
+					"longhaul disabled.\n");
+			return -ENODEV;
+		}
 #endif
 #ifdef CONFIG_X86_IO_APIC
-	if (cpu_has_apic) {
-		printk(KERN_ERR PFX "APIC detected. Longhaul is currently "
-				"broken in this configuration.\n");
-		return -ENODEV;
-	}
+		if (cpu_has_apic) {
+			printk(KERN_ERR PFX "APIC detected. Longhaul is "
+					"currently broken in this "
+					"configuration.\n");
+			return -ENODEV;
+		}
 #endif
-	switch (c->x86_model) {
-	case 6 ... 9:
 		return cpufreq_register_driver(&longhaul_driver);
 	case 10:
 		printk(KERN_ERR PFX "Use acpi-cpufreq driver for VIA C7\n");
-- 
1.7.9.4

