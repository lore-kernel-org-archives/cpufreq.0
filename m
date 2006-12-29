From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Fix hole
Date: Fri, 29 Dec 2006 15:57:29 -0500
Message-ID: <20061229205729.GA27523@redhat.com>
References: <45957B5D.7070901@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <45957B5D.7070901@interia.pl>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Fri, Dec 29, 2006 at 09:32:29PM +0100, Rafa=C5=82 Bilski wrote:
 > ACPI PM2 register was fallback for "Longhaul ver. 1" CPU's.=20
 > My assumption that this register isn't present at=20
 > "PowerSaver" motherboards is so far true, but current code=20
 > will not work correctly in other case. There are three possible=20
 > supports: ACPI C3, PM2 and northbridge. That was my assumption=20
 > that ACPI C3 and northbridge is for PS and northbridge and PM2=20
 > is for V1. In current code we can only check if it is ACPI=20
 > support or not by port22_en. So remove port22_en and add=20
 > longhaul_flags. If USE_ACPI_C3 and USE_NORTHBRIDGE are both=20
 > clear then it means ACPI PM2 support. Also change order of=20
 > support probe from ACPI C3, PM2, northbridge to ACPI C3,=20
 > northbridge, ACPI PM2. Paranoid protection against port 0x22=20
 > cast as ACPI PM2 register. Bit 1 clear in such case - lockup=20
 > on AGP DMA. And obvious (now) fixup for do_powersaver. Use=20
 > cx->address only for ACPI C3 ("PowerSaver" processor using=20
 > PM2 support).

Much better description, thanks.
I renamed the subject "Fix up powersaver assumptions" which is a bit
more descriptive.
=20
 > diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/=
cpu/cpufreq/longhaul.c
 > --- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
 > +++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
 > @@ -52,6 +52,10 @@
 > #define	CPU_EZRA_T	4
 > #define	CPU_NEHEMIAH	5
 >=20
 > +/* Flags */
 > +#define USE_ACPI_C3		(1 << 1)
 > +#define USE_NORTHBRIDGE		(1 << 2)
 > +
 > static int cpu_model;
 > static unsigned int numscales=3D16;
 > static unsigned int fsb;

The diff got whitespace damaged this time, so I glued the
description above on the old diff, which applied
(after I fixed up the trailing whitespace addition which git hates).

Applied though finally :)

Thanks,

		Dave

--=20
http://www.codemonkey.org.uk
