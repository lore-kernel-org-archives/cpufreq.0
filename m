From: Wouter Verhelst <wouter@grep.be>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sat, 10 Jan 2004 16:02:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1073746849.1047.14.camel@worldmusic.grep.be>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============48518566013358067=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040110131824.GA5010@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk


--===============48518566013358067==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ReMXRU9xD4jRdCEnvHVQ"


--=-ReMXRU9xD4jRdCEnvHVQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Op za 10-01-2004, om 14:18 schreef Dominik Brodowski:
> On Sat, Jan 10, 2004 at 12:08:00PM +0100, Wouter Verhelst wrote:
> > Vanilla 2.6.1, but I had the same problem with 2.6.0 (didn't try
> > p4-clockmod on any kernel before that).
>=20
> You shouldn't need to use p4-clockmod at all... speedstep-ich is a better
> choice for your system...

Ah? Didn't know. OK, thanks :-)

(when checking the description now, it clearly says "P4-M"; must've
missed that before)

> Nonetheless, let us find the bug:
>=20
> > > What does "dmesg" tell us?
> >=20
> > 234 lines of output. Seems a bit excessive to put that in this mail, so
> > I've put it on <http://users.pandora.be/wouter.verhelst/cpufreq.tgz>,
> > together with the contents of /proc/cpuinfo and my .config. If you need
> > any further information, please ask.
>=20
> Thank you very much. Two questions: Do the init scripts modprobe either=20
> the acpi module (acpi.ko) or the speedstep-ich module (speedstep-ich.ko)
> anyway?

No. I compiled the ACPI module because I didn't want to convert my
scripts right away and the speedstep-ich one because I wasn't sure which
one to choose, but my /etc/modules (which lists modules to be loaded at
boot time) contained p4-clockmod alone (contained, because it's
speedstep-ich now ;-)

> What does /proc/cpuinfo say before modprobing p4-clockmod, and
> after modprobing p4-clockmod?

The only difference with the one you already have is the Mhz number
(which seems logical). Before it's loaded, it's at 2194.424; Immediately
after loading p4-clockmod, that number was still the same, but in the
mean time it went back to 1919.054

Note that I had to reboot my box to unload the module. This is probably
related to the above, but just in case it isn't: I cannot rmmod the
p4-clockmod module, trying anyway results in rmmod segfaulting -- at
least once the frequency has been altered. I didn't reboot again just to
test that, but if you want, it's no problem.

> Also, could you please uncomment the printk in line 190 of
> linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c and send me a diff of th=
e
> dmesgs?

The extra line reads:

cpufreq: P4 - MSR_EBC_FREQUENCY_ID: 0x16300a16 0x0

--=20
Wouter Verhelst
Debian GNU/Linux -- http://www.debian.org
Nederlandstalige Linux-documentatie -- http://nl.linux.org
Most people have two reasons for doing anything -- a good reason, and
the real reason

--=-ReMXRU9xD4jRdCEnvHVQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dit berichtdeel is digitaal ondertekend

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAABOhWgZ1HEtaPf0RAgzKAJoDLWdDaQjCEcX0caLSLw5ccuK6CwCeLri+
W8+mjtKQ+UiszenyQ50jIck=
=28Va
-----END PGP SIGNATURE-----

--=-ReMXRU9xD4jRdCEnvHVQ--


--===============48518566013358067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============48518566013358067==--

