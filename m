From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: P-M,
	ICH4 ACPI performance and throttling states and auto-switching,
	and hard drive standby-ing
Date: Sat, 17 Jan 2004 10:53:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040117095302.GA14776@dominikbrodowski.de>
References: <1074299282.547.9.camel@3piece>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============20552484431496176=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1074299282.547.9.camel@3piece>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Prantik Kundu <pkundu@andrew.cmu.edu>
Cc: cpufreq@www.linux.org.uk


--===============20552484431496176==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2004 at 07:28:02PM -0500, Prantik Kundu wrote:
> Hi. I have an IBM T40 P-M 1.6 with ICH4, I'm running 2.4.23 and have
> applied the latest ACPI patch which included ACPI CA, so, I can change
> both performance states and throttling states effectively
>=20
> I have some questions and concerns:
> Whats the difference between throttling and P-states?

P-States scale the CPU frequency, and in addition the CPU voltage, so that
the energy consumption is reduced:=20

energy consumption =3D constant * frequency * (voltage ^ 2)

Throttling stops the CPU for short periods of time, causing (less than)
linear savings in energy consumption. Moreover, no energy consumption is
reached in comparison to the CPU idle states (C2 or higher). This means: as
long as the CPU load is lower than 100% _and_ ACPI idle states function
properly, throttling does not make sense.

Throttling (either ACPI T-States or on-CPU [p4-clockmod]) only makes sense
if:
- the CPU needs to be cooled "passively"
- the user doesn't want "batch processes" [nice 19 processes] to heat up the
  CPU or cause the battery to be drained.
- ACPI/APM idle states don't work properly

> It seems that each P-state has n T-states (where n=3D8 in my case)

P-States and T-States are independent of each other, they just apply a rate
to the base frequency, e.g. CPU processing khz =3D cpu_khz * t-rate * p-rat=
e =3D=20
cpu_khz * 1/2 * 1/2 =3D cpu_khz * 1/4

> For the P-M series, what should I use to do automatic P-state/throttling
> changes? It seems that cpufreq wouldnt works since I have an ICH4.

Probably you have an ICH4-M, but that's besides the point. You should use
the speedstep-centrino driver of the 2.6. kernel series as it provides much
faster frequency transitions than the ACPI 2.4. driver or the ACPI-cpufreq
2.6. driver.

> Is there anything that can effectively manage both?

ACPI throttling works independent of the cpufreq drivers mentioned above,
so you can use ACPI for throttling if you really need it [see above], and=
=20
cpufreq for frequency scaling.

wrt "automatic": dynamic frequency governors are already written, but have
not yet been merged into the base kernel tree. You can check the cpufreq
mailing list archives for "ondemand", for example. Also, userspace tools are
available which do dynamic frequency changing using the userspace governor;
however this mechanism has some severe disadvantages.

> Also, I would very much like to do automatic hard drive standby-ing,
> what should I use to do that?

laptop-mode. Check out Documentation/laptop-mode.txt

	Dominik

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFACQX9Z8MDCHJbN8YRAqZiAJ4g0L/8eHuk3r396DOZJVbZ/K++7ACbBnwv
5mRmJHz2xW9y7TADrnrgZf4=
=7K5f
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--


--===============20552484431496176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============20552484431496176==--

