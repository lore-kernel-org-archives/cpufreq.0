From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Pentium-M minimum clock-freq
Date: Fri, 2 Apr 2004 19:39:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402173916.GA7499@dominikbrodowski.de>
References: <200404021824.10912.steffen-hein@gmx.de>
	<20040402164459.GB7034@dominikbrodowski.de>
	<200404021926.28812.steffen-hein@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0734980371=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200404021926.28812.steffen-hein@gmx.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Steffen Hein <steffen-hein@gmx.de>
Cc: cpufreq@www.linux.org.uk


--===============0734980371==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2004 at 07:26:28PM +0200, Steffen Hein wrote:
> On Friday 02 April 2004 18:44, Dominik Brodowski wrote:
> > 'cause the other OS's behaviour is broken, IMHO. It (also) "sells" you
> > throttling as "speedstep": Throttling means the processor is stopped for
> > short times.
>=20
> Is that compareable with the good-old "hlt" instruction?

Yes -- ACPI C1 actually does call hlt, C2 and higher do save more power than
"hlt"; but it takes a bit more time for the processor to wake up from these
"deeper sleep" states.

> > Actual speedstep states for the 1.5ghz
> > Pentium-M are 600, 800, 1000, 1200, 1400 and 1500 MHz.
>=20
> OK, good to know. I just was confused by the mhz Numbers "the other OS[tm=
]"=20
> gave me.
Many are, unfortunately...

> BTW: I'm not familiar with the current ACPI-style power-management-stuff,=
 but=20
> would it make sense to use the HLT instruction together with Speedstep? H=
ow=20
> can it be enabled on ACPI-systems? ("do cpu idle calls when idle" is=20
> connected to apm in the kernel) Or isn't it useful anymore with ACPI?

Oh yes, it's very useful if you use ACPI. It's part of the ACPI processor
module, so if you say CONFIG_ACPI_PROCESSOR=3D"y" it should already work. G=
rep
for "ACPI" and you'll find the number of C-States your processor supports.
Note that this number might change as soon as _CST support is merged (search
for it on bugzilla.kernel.org if you want to test patches, but chose Bruno's
as they're better than mine, I guess :-)

	Dominik

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAbaVEZ8MDCHJbN8YRAml7AJkBk4PRwbGnursR/PbyYrrA3MqdjACglp6L
lIQXZUqXS2SmkpMfe44oxHs=
=2HF1
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--


--===============0734980371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0734980371==--

