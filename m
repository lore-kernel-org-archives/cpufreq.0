From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sat, 10 Jan 2004 14:18:24 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040110131824.GA5010@dominikbrodowski.de>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============55827310083905113=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040110110800.GA8294@grep.be>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Wouter Verhelst <wouter@grep.be>
Cc: cpufreq@www.linux.org.uk


--===============55827310083905113==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2004 at 12:08:00PM +0100, Wouter Verhelst wrote:
> Vanilla 2.6.1, but I had the same problem with 2.6.0 (didn't try
> p4-clockmod on any kernel before that).

You shouldn't need to use p4-clockmod at all... speedstep-ich is a better
choice for your system... Nonetheless, let us find the bug:

> > What does "dmesg" tell us?
>=20
> 234 lines of output. Seems a bit excessive to put that in this mail, so
> I've put it on <http://users.pandora.be/wouter.verhelst/cpufreq.tgz>,
> together with the contents of /proc/cpuinfo and my .config. If you need
> any further information, please ask.

Thank you very much. Two questions: Do the init scripts modprobe either=20
the acpi module (acpi.ko) or the speedstep-ich module (speedstep-ich.ko)
anyway? What does /proc/cpuinfo say before modprobing p4-clockmod, and
after modprobing p4-clockmod?

Also, could you please uncomment the printk in line 190 of
linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c and send me a diff of the
dmesgs?

Thank you very much,
	Dominik

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQE///ugZ8MDCHJbN8YRAk1zAJsH6w3q7NOQfw3ax+BBtyTzoZrFhQCfTIiE
ZCTM5azatAoAmDas1oEdegk=
=ekDu
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--


--===============55827310083905113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============55827310083905113==--

