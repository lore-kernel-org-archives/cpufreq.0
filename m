From: Alex Simonov <a_simonov@yahoo.com>
Subject: Re: Wrong frequencies sometimes on Sony Vaio Athlon4
Date: Fri, 2 Dec 2005 07:46:07 -0800 (PST)
Message-ID: <20051202154607.43950.qmail@web32704.mail.mud.yahoo.com>
References: <20051129135423.GA20258@bungled.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051129135423.GA20258@bungled.net>
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
To: Nathan Conrad <conrad@bungled.net>, cpufreq@lists.linux.org.uk

It is strange that the cpufreq driver is not
recognising your CPU.
Did you change/upgrade it? I have the same laptop
(FX-502, which is the european version of
FXA-49). I had the same problem when I upgraded
my CPU from the original Mobile 1GHz Duron, to
Athlon XP 1900+.=20
What I did is to hardcode the powerstates table=20
(thank you CPUFREQ guys for the support and the
help in doing that!)=20
so the driver is  always using it instead of
using the ACPI perflib. Please email me if you
want my patch. Then just recompile your kernel
and have fun ! :)
May be you will need to adjust the
frequencies/voltages table yourself, as my
settings may not work for you.

Best,

Alex
Alex

--- Nathan Conrad <conrad@bungled.net> wrote:

> Hi,
>=20
> I have a 1.2 GHz Athlon4 CPU on my Sony Vaio
> PCG-FXA49 laptop. I use
> the powernow CPU scaling. Sometimes (a few
> percent of the time), the
> driver records my laptop's CPU as the wrong
> speed. For example, right
> now the following speeds are available:
>=20
> 1292256 1076880 861504 646128 538440
>=20
> The first should be almost exactly 1.2 GHz
> while the last should be
> 500 MHz.
>=20
> /proc/cpuinfo:
>=20
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 6
> model           : 6
> model name      : mobile AMD Athlon(tm) 4
> stepping        : 2
> cpu MHz         : 1076.885
> cache size      : 256 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 1
> wp              : yes
> flags           : fpu vme de pse tsc msr pae
> mce cx8 sep mtrr pge mca
> cmov pat pse36 mmx fxsr sse syscall mp mmxext
> 3dnowext 3dnow
> bogomips        : 2144.24
>=20
> dmesg reports:
>=20
> CPU: After generic identify, caps: 0383f9ff
> c1cbf9ff 00000000 00000000 00000000 00000000
> 00000000
> CPU: After vendor identify, caps: 0383f9ff
> c1cbf9ff 00000000 00000000 00000000 00000000
> 00000000
> CPU: L1 I Cache: 64K (64 bytes/line), D cache
> 64K (64 bytes/line)
> CPU: L2 Cache: 256K (64 bytes/line)
> CPU: After all inits, caps: 0383f9ff c1cbf9ff
> 00000000 00000020 00000000 00000000 00000000
> CPU: AMD mobile AMD Athlon(tm) 4  stepping 02
> powernow: PowerNOW! Technology present. Can
> scale: frequency and
> voltage.
> Detected 1292.262 MHz processor.
> powernow: No PST tables match this cpuid
> (0x762)
> powernow: This is indicative of a broken BIOS.
> powernow: Trying ACPI perflib
> powernow: Minimum speed 538 MHz. Maximum speed
> 1292 MHz.
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
>
http://lists.linux.org.uk/mailman/listinfo/cpufreq
>=20



	=09
__________________________________________=20
Yahoo! DSL =96 Something to write home about.=20
Just $16.99/mo. or less.=20
dsl.yahoo.com=20
