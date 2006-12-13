From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Don't use regs to obtain FSB frequency
Date: Thu, 14 Dec 2006 00:22:48 +0100
Message-ID: <45808B48.9060103@interia.pl>
References: <458080DA.3040504@interia.pl> <20061213225009.GL2418@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061213225009.GL2418@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

> On Wed, Dec 13, 2006 at 11:38:18PM +0100, Rafa=B3 Bilski wrote:
>  > Current code has a problem with FSB on "PowerSaver 1.0"=20
>  > CPU. FSB is incorrecly guessed (again) for mini PC by Ebox.=20
>  > There is 8x100MHz CPU with "Nehemiah" core. It is reported=20
>  > as 8x133MHz. Apparently Longhaul MSR isn't reliable source=20
>  > of information if it is RevisionID =3D=3D 0 for anything else=20
>  > then max multiplier. We can't read 200MHz FSB from it nor=20
>  > from EBLCR_POWER_ON too. This driver is working only with=20
>  > multipliers. FSB frequency is only needed to calculate CPU=20
>  > f for Cpufreq core. At boot kernel is calculating processor=20
>  > frequency. We know the multiplier. In this way we have bus=20
>  > frequency with kHz precision.
>=20
> I'm puzzled.  This description talks exclusively about Nehemiah,
> and yet it's making changes to code only run by the pre-Nehemiah cores.
> This makes me especially nervous as those chips don't get a
> great deal of testing any more, and we typically learn that we
> broke them months after making changes.
Well. I don't see a reason for not making this change. It is even more=20
compatible with older CPU's, because EBL_CR_POWERON is returning current=20
multiplier. And according to Your comments in source it isn't good to=20
depend on EBL_CR_POWERON for "PowerSaver" CPU's. Why guess FSB if=20
kernel calculated it at boot? In this way it is much simplier. Only=20
possible bug is for "PowerSaver" processor running at lower multiplier=20
then max.
My point is: can't use EBL_CR_POWERON FSB bits, nor Longhaul MSR FSB bits, =

for "Powersaver" - don't use it at all for any CPU. Find the way that will =

work for all of them.
> Has this been tested on anything other than the system mentioned above?
> It seems like huge potential for regressions here, due to the size
> and impact of the changes.
It has been tested on my Epia M-10000, system mentioned above and two=20
Epia SP-13000. I'm currently exchanging e-mails with user who has=20
Ezra with "Longhaul ver. 2" connected to SIS630 chipset. Version 2 seems=20
to have only max BR bits - same as "Powersaver 1.0". I was planing to use=20
same code for V2. I'm not sure yet if Longhaul version 2 can use ACPI C3=20
to change frequency.
>=20
> 		Dave
Rafa=B3


----------------------------------------------------------------------
smieszne, muzyka, pilka, sexy, kibice, kino, ciekawe, extreme, kabaret
http://link.interia.pl/f19d4 - najlepsze filmy w intermecie
