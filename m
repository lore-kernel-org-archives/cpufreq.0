From: mark.langsdorf@amd.com
Subject: powernow-k8 patch
Date: Thu, 19 Aug 2004 12:35:35 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A84310F325@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_000_01C48612.EF735900"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk
Cc: davej@redhat.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C48612.EF735900
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

AMD recently errata'd the definition of the PSB/PST
for recent Athlon 64 and Opteron parts.  The errata
allows for a second, identical PST for those parts.
The current powernow-k8 driver will not work in 
PST/PSB mode on those parts because it requires 
there be 1 and only 1 PST.

This patch adjusts the powernow-k8 driver to 
work with that errata.

Mark Langsdorf
Advanced Micro Devices        mark.langsdorf@amd.com
5204 E. Ben White Blvd        Phone: 512.602.3756
Austin, TX 78704


------_=_NextPart_000_01C48612.EF735900
Content-Type: application/octet-stream; name=powernow-k8-new-cpus-2.6.8.1.patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename=powernow-k8-new-cpus-2.6.8.1.patch

--- arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig	2004-08-14 =
05:55:33.000000000 -0500=0A=
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-08-18 =
14:33:56.953872328 -0500=0A=
@@ -39,7 +39,7 @@=0A=
 =0A=
 #define PFX "powernow-k8: "=0A=
 #define BFX PFX "BIOS error: "=0A=
-#define VERSION "version 1.00.09b"=0A=
+#define VERSION "version 1.00.09e"=0A=
 #include "powernow-k8.h"=0A=
 =0A=
 /* serialize freq changes  */=0A=
@@ -596,6 +596,8 @@ static int find_psb_table(struct powerno=0A=
 	unsigned int i;=0A=
 	u32 mvs;=0A=
 	u8 maxvid;=0A=
+	u32 cpst =3D 0;=0A=
+	u32 thiscpuid;=0A=
 =0A=
 	for (i =3D 0xc0000; i < 0xffff0; i +=3D 0x10) {=0A=
 		/* Scan BIOS looking for the signature. */=0A=
@@ -634,7 +636,14 @@ static int find_psb_table(struct powerno=0A=
 		dprintk(KERN_INFO PFX "maximum voltage step: %d - 0x%x\n", mvs, =
data->vidmvs);=0A=
 =0A=
 		dprintk(KERN_DEBUG PFX "numpst: 0x%x\n", psb->numpst);=0A=
-		if (psb->numpst !=3D 1) {=0A=
+		cpst =3D psb->numpst;=0A=
+		if ((psb->cpuid =3D=3D 0x00000fc0) || (psb->cpuid =3D=3D 0x00000fe0) =
){=0A=
+			thiscpuid =3D cpuid_eax(CPUID_PROCESSOR_SIGNATURE);=0A=
+			if ((thiscpuid =3D=3D 0x00000fc0) || (thiscpuid =3D=3D 0x00000fe0) =
) {=0A=
+				cpst =3D 1;=0A=
+			}=0A=
+		}=0A=
+		if (cpst !=3D 1) {=0A=
 			printk(KERN_ERR BFX "numpst must be 1\n");=0A=
 			return -ENODEV;=0A=
 		}=0A=

------_=_NextPart_000_01C48612.EF735900
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_000_01C48612.EF735900--


