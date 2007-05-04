From: Chuck Ebbert <cebbert@redhat.com>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 04 May 2007 13:42:47 -0400
Message-ID: <463B7097.7070300@redhat.com>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> <463B687D.1020600@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1031418AbXEDRnk@vger.kernel.org>
In-Reply-To: <463B687D.1020600@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

Rafa=C5=82 Bilski wrote:
>> Hi,
> Hello all
>> I found that setting the cpufreq governor to ondemand making the box=
=20
>> lock up solid in 2.6.20.2 and 2.6.21 after a few seconds.
>> [...]
>=20
> I can't explain this. Some motherboards are running fine, some don't.
> I'm running longhaul too. It is working fine. No lockups at all.=20
> So far I heard only about one Epia which had problems with longhaul.=20
> It was almost like my Epia but older.
> What is possible:
> - some chipsets revisions are broken and aren't blocking DMA,
> - special setup is required, some versions of BIOS are doing=20
> necessary things, some don't,
> - some chipsets revisions are broken and drivers are not aware. At=20
> the beginning Unichrome driver was causing lockups on my machine, but=
=20
> Openchrome was fine. Longhaul may trigger, somehow, other hardware bu=
g.=20
>=20

The below is in the cpufreq git tree.

(Maybe also ondemand needs to be disabled for Longhaul?)

=46rom: Rafal Bilski <rafalbilski@interia.pl>
Date: Sun, 22 Apr 2007 10:26:04 +0000 (+0200)
Subject: [CPUFREQ] Longhaul - Revert Longhaul ver. 2
X-Git-Url: http://git.kernel.org/?p=3Dlinux%2Fkernel%2Fgit%2Fdavej%2Fcp=
ufreq.git;a=3Dcommitdiff_plain;h=3D07844252ffd81ec192a62014bada1016c970=
3765

[CPUFREQ] Longhaul - Revert Longhaul ver. 2

There is something wrong with this code. It needs more
testing. It is better to disable it for now because support
for some machines will be broken.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
Signed-off-by: Dave Jones <davej@redhat.com>
---

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel=
/cpu/cpufreq/longhaul.c
index e5fee72..a3df9c0 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -683,7 +683,7 @@ static int __init longhaul_cpu_init(struct cpufreq_=
policy *policy)
 				sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
-			longhaul_version =3D TYPE_LONGHAUL_V2;
+			longhaul_version =3D TYPE_LONGHAUL_V1;
 			if (c->x86_mask < 8) {
 				cpu_model =3D CPU_SAMUEL2;
 				cpuname =3D "C3 'Samuel 2' [C5B]";
