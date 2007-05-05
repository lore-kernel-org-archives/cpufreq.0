From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 05 May 2007 19:48:48 +0200
Message-ID: <463CC380.3060603@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>	 <200705042320.41278.dj@david-web.co.uk>	 <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>	 <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934049AbXEERtG@vger.kernel.org>
In-Reply-To: <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

I found one line which wasn't were it should be. Probably this will not=
=20
fix Your problem with powersave governor, but it is a bit related.=20
Looks like Longhaul isn't skipping frequency transtition when it is ask=
ed=20
to set f which is already set. Now after first transition it will not=20
try to set same frequency again. Second part contains some magic=20
because I don't have CN400 datasheet. It is NDA protected :-( Should=20
print You one byte in hex and will try to set one register. I don't=20
know if anything will change but it is worth testing.

=46ingers crossed
Rafa=B3

---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel=
/cpu/cpufreq/longhaul.c
index 2b030d6..5548e5b 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -88,6 +88,7 @@ static int clock_ratio[32];
 static int eblcr_table[32];
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
+static unsigned int old_ratio =3D -1;
=20
 #ifdef CONFIG_CPU_FREQ_DEBUG
 static char speedbuffer[8];
@@ -252,7 +253,6 @@ static void longhaul_setstate(unsigned int clock_ra=
tio_index)
 {
 	int speed, mult;
 	struct cpufreq_freqs freqs;
-	static unsigned int old_ratio=3D-1;
 	unsigned long flags;
 	unsigned int pic1_mask, pic2_mask;
=20
@@ -603,7 +603,12 @@ static int enable_arbiter_disable(void)
 		/* Find CN400 V-Link host bridge */
 		if (dev =3D=3D NULL)
 			dev =3D pci_find_device(PCI_VENDOR_ID_VIA, 0x7259, NULL);
-
+		if (dev !=3D NULL) {
+			pci_read_config_byte(dev, 0x47, &pci_cmd);
+			printk(KERN_INFO PFX "%#02x\n", pci_cmd);
+			pci_cmd |=3D 0xf;
+			pci_write_config_byte(dev, 0x47, pci_cmd);
+		}
 	}
 	if (dev !=3D NULL) {
 		/* Enable access to port 0x22 */
--=20



----------------------------------------------------------------------
Po meczu.....kurde...:)
>>> http://link.interia.pl/f1a72
