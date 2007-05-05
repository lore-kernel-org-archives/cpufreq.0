From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 05 May 2007 23:32:40 +0200
Message-ID: <463CF7F8.7080007@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>  <200705042320.41278.dj@david-web.co.uk>  <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>  <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com> <463CC380.3060603@interia.pl> <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr> <463CE1FB.4050305@interia.pl> <Pine.LNX.4.61.0705052237580.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933816AbXEEVcw@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705052237580.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Is patch attached below making things better?
You should see in log that You are using VT8235 support now.

---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
index 5548e5b..c3c9096 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -635,6 +635,8 @@ static int longhaul_setup_vt8235(void)
 
 	/* Find VT8235 southbridge */
 	dev = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8235, NULL);
+	if (dev == NULL)
+		dev = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8237, NULL);
 	if (dev != NULL) {
 		/* Set transition time to max */
 		pci_read_config_byte(dev, 0xec, &pci_cmd);
@@ -771,11 +773,11 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 		}
 	}
 	/* Check if northbridge is friendly */
-	if (enable_arbiter_disable()) {
+/*	if (enable_arbiter_disable()) {
 		longhaul_flags |= USE_NORTHBRIDGE;
 		goto print_support_type;
 	}
-	/* Use VT8235 southbridge if present */
+*/	/* Use VT8235 southbridge if present */
 	if (longhaul_version == TYPE_POWERSAVER && vt8235_present) {
 		longhaul_flags |= USE_VT8235;
 		goto print_support_type;
-- 



----------------------------------------------------------------------
Wicie, rozumicie....
Zobacz >>> http://link.interia.pl/f1a74
