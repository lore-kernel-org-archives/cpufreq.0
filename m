From: Wouter Verhelst <wouter@grep.be>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sat, 10 Jan 2004 12:08:00 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110110800.GA8294@grep.be>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============56371769305903263=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040110101534.GA10003@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============56371769305903263==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2004 at 11:15:34AM +0100, Dominik Brodowski wrote:
> On Fri, Jan 09, 2004 at 07:18:51PM +0100, Wouter Verhelst wrote:
> > Hi,
> >=20
> > I can't seem to get my processor to run at full speed when using the
> > p4-clockmod driver:
> >=20
> > root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_gover=
nor=20
> > userspace
> > root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_max_f=
req=20
> > 2193205
> > root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# echo 2193205 > sc=
aling_setspeed=20
> > root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_setsp=
eed=20
> > 1925000
> >=20
> > What am I missing?
>=20
> Which kernel version are you using?

Vanilla 2.6.1, but I had the same problem with 2.6.0 (didn't try
p4-clockmod on any kernel before that).

> What does "dmesg" tell us?

234 lines of output. Seems a bit excessive to put that in this mail, so
I've put it on <http://users.pandora.be/wouter.verhelst/cpufreq.tgz>,
together with the contents of /proc/cpuinfo and my .config. If you need
any further information, please ask.

--=20
Wouter Verhelst
Debian GNU/Linux -- http://www.debian.org
Nederlandstalige Linux-documentatie -- http://nl.linux.org
"Stop breathing down my neck." "My breathing is merely a simulation."
"So is my neck, stop it anyway!"
  -- Voyager's EMH versus the Prometheus' EMH, stardate 51462.

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQE//90QWgZ1HEtaPf0RAm+zAJ9nvf8K1Ees+5b2FtEQLSVz5sypNACfZoez
v56Hp4/6J/j/RsOITo7I/Y4=
=LtQy
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--


--===============56371769305903263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============56371769305903263==--

