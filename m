From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: CPUSpeed 1.1 released (finally)
Date: Sun, 09 Nov 2003 10:31:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1068370287.7434.0.camel@laptop.fenrus.com>
References: <1068264857.2c5ff476f0b29@carlthompson.net>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============11254021254580326=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1068264857.2c5ff476f0b29@carlthompson.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Carl Thompson <cet@carlthompson.net>
Cc: Enrico Tassi <tassi@cs.unibo.it>, Gerald Teschl <Gerald.Teschl@univie.ac.at>, CPUFreq Mailing List <cpufreq@www.linux.org.uk>, NERvOus <nervous@nervous.it>, Christian Zoz <zoz@suse.de>


--===============11254021254580326==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ko9gDb/zcPAR7kN7HKQs"


--=-ko9gDb/zcPAR7kN7HKQs
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-11-08 at 05:14, Carl Thompson wrote:
> I have finally gotten around to releasing CPUSpeed v1.1 (formerly named
> cpufreq but that was too confusing).  CPUSpeed is yet another program
> (actually the first, I think?) to control CPU speed based on idle, AC
> connection and CPU temperature using the CPUFreq userspace governor.

Really really nice!
However one minor nitpick: It's not allowed to call fopen() from a
signal handler....... I'll try to work up a patch for this and send it=20

--=-ko9gDb/zcPAR7kN7HKQs
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/rglvxULwo51rQBIRAuaRAJ9UznKmveHDmNk9ibuEH2l55LgapwCeO54W
A4eYtB44dyDQOKxMQTN0XA8=
=I+hQ
-----END PGP SIGNATURE-----

--=-ko9gDb/zcPAR7kN7HKQs--


--===============11254021254580326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============11254021254580326==--

