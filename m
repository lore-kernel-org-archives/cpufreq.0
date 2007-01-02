From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Tue, 02 Jan 2007 19:18:33 +0100
Message-ID: <459AA1F9.3040701@interia.pl>
References: <5317.195.215.10.251.1167740225.squirrel@195.41.226.86>
	<20070102173601.GD7656@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070102173601.GD7656@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

>  > Hi
>  >=20
>  > I have just bought a nice little sbc mainboard with a Via C7 cpu. It r=
un
>  > Centos with stock kernel 2.6.19.1 that I downloaded and installed a few
>  > days ago.
>  > But cpufreq does not work.
>  >=20
>  > Can I in some way help with testing/debugging the cpufreq driver (cent=
rino
>  > or longhaul?) for this cpu?
>=20
> The C7 works fine with acpi-cpufreq if the correct BIOS tables are presen=
t.
> Support *could* be added to speedstep-centrino to use hardcoded tables
> for these CPUs for systems where the BIOSes lack them, but hasn't been
> done yet.
>=20
> Given speedstep-centrino is due to be obsoleted by acpi-cpufreq at some s=
tage,
> the feature of using hardcoded tables probably needs to be added to
> acpi-cpufreq at some point too.
>=20
> 		Dave
>=20
Beauty of "Enhanced PowerSaver" is in that hardcoded tables are not necessa=
ry.=20
Would be very easy to add ACPI independent driver for these CPU's. If someb=
ody=20
would test it then I can try.
What do You think?

Rafa=B3

----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
