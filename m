From: dual_bereta_r0x <dual_bereta_r0x@arenanetwork.com.br>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Mon, 16 Feb 2004 21:48:25 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40313AA9.1060906@arenanetwork.com.br>
References: <20040216213435.GA9680@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040216213435.GA9680@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

Dominik Brodowski wrote:
> Hi,
>=20
>=20
>>I have a P4 2.4 running @ 3.12GHz.
>=20
>=20
> So you overclock your CPU but then throttle it down... strange, but wel=
l...

Actually it isn't throttled down, only sysfs is showing it with low=20
speed. It *is* running @ 3.12 (or /proc/cpuinfo and boot messages are=20
lying to me) when in full power.

>>In 2.6.0, i could change it frequency=20
>>via speedfreqd(8) up to its actual speed. Since 2.6.1, its max speed is=
=20
>>locked on cpu *real* speed.
>=20
>=20
> It's just a change of appearance -- the cpufreq driver uses the theoret=
ical
> speed of the CPU for its calculations; the actual CPU speed isn't
> affected. You can verify this by looking at /proc/cpuinfo which still t=
ells
> 3124.376 MHz.
>=20
> By doing so it becomes easier to enter different frequencies e.g. into
> /sys/devices/system/cpu/cpufreq/scaling_setspeed -- on my desktop, typi=
ng in
> 1200000 is easier than 12121224... [*]

Sure but if i want to downgrade it, for example, by night, to a lower=20
speed, and then next day return it to full power? Will I stuck at 2.4GHz?

> 	Dominik
>=20
> [*] The _actual_ CPU speed should be used on all cpufreq drivers where =
this
> specific CPU frequency has implications to external components, e.g. LC=
D,
> memory or pcmcia devices. Where only the _frequency ratio_ is of import=
ance
> [for loops_per_jiffy and friends] such "rounding" is acceptable, as lon=
g as
> the ratio is constant.

Indeed. I'll showing in LCD a lower speed than the running.

--=20
dual_bereta_r0x -- Alexandre Hautequest
ArenaNetwork Lan House & Cyber -- www.arenanetwork.com.br

Tr=EAs an=E9is para os Reis =C9lficos sob este c=E9u,
    Sete para os Senhores-An=F5es em seus rochosos corredores,
Nove para Homens Mortais, fadados ao eternos sono,
    Um para o Senhor do Escuro em seu escuro trono
Na Terra de Mordor onde as Sombras se deitam.
    Um Anel para a todos governar, Um Anel para encontr=E1-los,
    Um Anel para a todos trazer e na escurid=E3o aprision=E1-los
Na Terra de Mordor onde as Sombras se deitam.
