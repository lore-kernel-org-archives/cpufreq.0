From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [powernow-k7] [dirty patch] introducing quirk_broken_bios. NEED
	TESTING
Date: Wed, 24 Mar 2004 17:13:55 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040324161355.GA8572@dominikbrodowski.de>
References: <20040324143934.GC19001@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1381808673=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040324143934.GC19001@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


--===============1381808673==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2004 at 03:39:34PM +0100, Bruno Ducrot wrote:
> You have to do something like that:
> modprobe powernow-k7 quirk_broken_bios=1

For the future: what about a dmi flag? For 2.7., the dmi decoding should be
done per-driver instead of one fixed location, by the way...

	Dominik

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAYbPDZ8MDCHJbN8YRAlw/AJ9wtWPfcq0TiwJ4BNpZrT/e5qdWsQCfQvU0
6XXEsiQudODUbVrpr7+aEho=
=YQI4
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--


--===============1381808673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1381808673==--

