From: Christian Heimanns <heimanns@versanet.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Sat, 07 Aug 2004 15:00:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4114D272.6070808@versanet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@www.linux.org.uk

I hope I make no mistake now. I started a thread with Dominik a couple=20
of weeks ago but not in this mailing list. Now I'm back from vacation=20
and will continue troubleshooting. Thanks for understanding.

Dominik Brodowski wrote:
 >>Please find attached my acpi_pdump.report.tar.bz2 file. It includes tw=
o
 >>files with the dmesg information running on ac and battery (no
 >>differences).
 >
 > Hm. So it seems to be the BIOS which doesn't like being told to switch
 > frequencies once on AC power.
 >
 >
 >>Tomorrow I go on a two weeks vacation with my family to Turkey. No
 >>computers I promised. When I'm back I will post to the cpufreq mailing
 >>list if you agree.
 >
 >
 > Please do so -- and I hope you had a fine vacation! Just got an idea=20
what
 > might be the cause of the problem -- could you try out the attached=20
patch,
 > please?

I tried this patch=20
(http://marc.theaimsgroup.com/?l=3Dacpi4linux&m=3D107684287525298&w=3D2) =
with=20
no success. The module won't load. I'm not sure that the mistake is=20
using kernel 2.6.8-rc3 instaed of rc2?

modprobe acpi
FATAL: Error inserting acpi=20
(/lib/modules/2.6.8-rc3-bk1/kernel/arch/i386/kernel/cpu/cpufreq/acpi.ko):=
=20
No such device



--=20
---
Christian Heimanns
heimanns@versanet.de

### Pinguine k=F6nnen nicht fliegen
- Pinguine st=FCrzen auch nicht ab! ###
