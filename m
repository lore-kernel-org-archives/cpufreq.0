From: Arjan van de Ven <arjanv@redhat.com>
Subject: RE: Athlon 64 complains of frequency mismatch
Date: Tue, 22 Jun 2004 09:30:53 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1087889453.2704.11.camel@laptop.fenrus.com>
References: <84EA05E2CA77634C82730353CBE3A8431990B9@SAUSEXMB1.amd.com>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0534134861=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8431990B9@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: paul.devriendt@amd.com
Cc: cpufreq@www.linux.org.uk, elf@buici.com


--===============0534134861==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Kz4gtrJGamdWtrD7I+Vn"


--=-Kz4gtrJGamdWtrD7I+Vn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> I did intend to make this data module parameters, but have not

how about a sysfs file instead ?

> had the time to do so yet. You can find the correct data values
> for your processor from the "Power and Thermal" pdfs available=20
> on www.amd.com. Let me know if you want a copy of this hardcoded
> driver (or it is easy to modify the driver ourself).

hmmm I wonder if say x86info or similar app can include those tables and
put them into the sysfs file during system boot..... to bypass the
firmware dependancy entirely. x86info has lots of cpu low level stuff
already so it just might fit there...

--=-Kz4gtrJGamdWtrD7I+Vn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBA1+AtxULwo51rQBIRAixuAKCA5E7aJpwM1PuPbmFcFwY1wARmLQCfbd/F
n0R1LqwKO7cvLTloqAtAXck=
=9XqF
-----END PGP SIGNATURE-----

--=-Kz4gtrJGamdWtrD7I+Vn--



--===============0534134861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0534134861==--


