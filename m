From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Pentium-M minimum clock-freq
Date: Sun, 4 Apr 2004 12:56:52 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040404105652.GA7723@dominikbrodowski.de>
References: <200404021824.10912.steffen-hein@gmx.de>
	<20040402164459.GB7034@dominikbrodowski.de>
	<20040404075803.2fdc50ad.neurowork@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1859406198=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040404075803.2fdc50ad.neurowork@free.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Cyril Wattebled <neurowork@free.fr>
Cc: cpufreq@www.linux.org.uk


--===============1859406198==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 04, 2004 at 07:58:03AM +0200, Cyril Wattebled wrote:
> > > Will they be supported in future?
> >=20
> > Maybe -- if multiple cpufreq drivers can be loaded and be running at the
> > same time, it'd be possible. I'm not yet sure whether this is a good id=
ea,
> > though.
>=20
> To my opinion, even if C2 state saves even more power that cpu throttling,
> there's still a very big advantage in lowering the cpu speed for laptop u=
sers,
> especially with high speed CPUs: Heat. I have a Pentium-M 1.7 ghz and eve=
n if I
> use Linux as my main OS, I had to work on Windows from time to time (happ=
ily
> that doesn't happen too often =3D]) and I have noticed that the laptop re=
ally hot
> under linux compared with Windows. During normal use, the meters indicate=
 48
> degrees Celcius on Linux and only 32 under Windows. So heat is also a thi=
ng
> that might be interresting to be considered because it can be very
> unconfortable to use a very hot laptop that burns your knees if you put y=
our
> laptop on them, that makes your hands sweat while typing and so on.

Heat indeed is an aspect. However, there are several issues you need to
be aware of:
a) Linux has a higher processor load than Windows [especially when running
   X, this seems to be true to me... does anyone have any specifics on
   this?] -- and only as the processor load is higher, the temperature rises
   because the CPU spends less time in the idle loop. If you'd "force" it to
   spend more time in the idle loop -- and that's what throttling
   effectively does on the hardware (not software!) side, you'd find your
   system unresponsive, "busy", etc.
b) In cause you have USB devices plugged into your notebook, you'll notice
   that the CPU will never go into the C3 sleep state [check for "bus
   mastering activity" in /proc/acpi/processor/*/power ]. This is a bug, but
   I think ACPI developers are aware of this.
c) Linux does not yet take advantage of C4 or higher idle states. Patches
   which implement this are in testing stage, though.
d) If heat is an issue for you, you should adapt the limits to be found
   in /proc/acpi/thermal_zone/*/limits. It'll influence, based on
   configuration, cpufreq scaling, throttling, and fans. Note that a=20
   generic interface so that lm_sensors have this functionality, too, might
   be created during 2.7.

> I'm not qualified enough to talk about the technical aspect of the current
> implementation but would it be technicly possible to use C2 state as the =
main
> speed driver and use throttle on demand, for instance while unplugged to =
allow
> the laptop to be even cooler ?

C2 can't be a "speed driver" -- C2 is a form of "sleep" the CPU is put into
while the system is idle. It's already utilized almost always if it's
available on your system (technically, C1 is denoted "default state" in the
ACPI processor driver; however, it is hardly used in 0.01% of all cases on
my notebook...)

For thermal management (and /proc/acpi/thermal_zone/*/limits is the place
for that _policy_, not cpufreq), CPU frequency scaling is used primarily;
and only if that does not suffice, throttling is activated by the ACPI
processor driver.

	Dominik

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAb+n0Z8MDCHJbN8YRAvciAJ9KVjD0nOnitn9K0fCTRzhB3P+E/QCfe0Ol
PtX80w/KVCaXvQFJPWFXYZs=
=Pyhd
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--


--===============1859406198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1859406198==--

