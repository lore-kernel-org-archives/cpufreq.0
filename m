From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Mon, 28 Nov 2005 23:12:38 +0100
Message-ID: <20051128221237.GA6340@inferi.kami.home>
References: <88056F38E9E48644A0F562A38C64FB6005EB231C@scsmsx403.amr.corp.intel.com>
	<4388E454.6050304@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4388E454.6050304@tremplin-utc.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Sat, Nov 26, 2005 at 11:40:20PM +0100, Eric Piel wrote:
> 05.10.2005 22:39, Pallipadi, Venkatesh wrote/a =E9crit:
[...]
> >Do you have ACPI PM timer on your system? May be we can measure the=20
> >latency using that.=20
> >
> Hello,
>=20
> Sorry for the looonnnggg delay of the reply. I've finally found time to=
=20
> hunt for the PM timer on my computer, found it, and kludged=20
> speedstep-ich to read it :-) For verification and completeness, the=20
> patch is attached. (the PM timer address is hard-coded, it has to be=20
> changed before running it on another system, it's indicated at boot in=20
> dmesg).
>=20
> So the results are quite interesting and confirm your expectations,=20
> Venki. After few hours with the ondemand governor, I checked the logs=20
> and the transition latency seems very stable: around 735 to 742 PM timer=
=20
> ticks (~206 us). So indeed, 100us of transition latency was quite=20
> under-estimating it!

So here's some measurement on my P3M (seems a little faster than yours
in switching):

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 11
model name	: Intel(R) Pentium(R) III Mobile CPU      1000MHz
stepping	: 1
cpu MHz		: 994.394
cache size	: 512 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 mmx fxsr sse
bogomips	: 1991.49


cpufrequtils 0.3: cpufreq-info (C) Dominik Brodowski 2004
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: speedstep-ich
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 732 MHz - 998 MHz
  available frequency steps: 998 MHz, 732 MHz
  available cpufreq governors: powersave, performance
  current policy: frequency should be within 732 MHz and 998 MHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 998 MHz.

Some stats while switching from the 2 available frequencies while
doing some random compile and/or disk intensive operation:

| min->MAX                      | MAX->min
+---------                      +---------
| 709 PM cicles - occurences 1  | 709 PM cicles - occurences 1
| 710 PM cicles - occurences 1  | 710 PM cicles - occurences 5
| 711 PM cicles - occurences 3  | 711 PM cicles - occurences 2
| 712 PM cicles - occurences 2  | 712 PM cicles - occurences 3
| 713 PM cicles - occurences 9  | 713 PM cicles - occurences 3
| 714 PM cicles - occurences 1  | 714 PM cicles - occurences 3
| 715 PM cicles - occurences 4  | 715 PM cicles - occurences 3
| 716 PM cicles - occurences 5  | 716 PM cicles - occurences 6
| 717 PM cicles - occurences 5  | 717 PM cicles - occurences 6
| 718 PM cicles - occurences 2  | 718 PM cicles - occurences 5
| 719 PM cicles - occurences 6  | 719 PM cicles - occurences 4
| 720 PM cicles - occurences 1  | 720 PM cicles - occurences 2
| 721 PM cicles - occurences 3  | 721 PM cicles - occurences 1
| 722 PM cicles - occurences 4  | 722 PM cicles - occurences 4
| 723 PM cicles - occurences 1  | 723 PM cicles - occurences 2
| 724 PM cicles - occurences 3  | 724 PM cicles - occurences 1

PM cicles weighted average: 716.412
TSC cicles weighted average: 6009.422

(you don't want to see the perl script that generated it) :)

> Now back to the original problem, from those measurements, which time=20
> should we put as the maximal transition latency for speedstep-ich? Do=20
> you think we can simply put something like 300us and that's it? Maybe we=
=20

I just build speedstep-ich with transition_latency =3D 250
I'll let you know how it goes. Are you interested?

> could distinguish between PIII and P4 ? It would require someone to=20
> rerun the measurement on a P4 hardware. Do we need to take into account=
=20
> as a parameter the CPU frequency?

Maybe it's already been discussed, but how bad would be trying to
measure transition latency at runtime?

--=20
mattia
:wq!
