From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [ANNOUNCE] cpufrequtils-002 released
Date: Thu, 1 Jun 2006 13:01:19 +0200
Message-ID: <20060601110119.GA9011@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0860058468=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk


--===============0860058468==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

cpufrequtils-002 is released and available at

http://www.kernel.org/pub/linux/utils/kernel/cpufreq/

See also:
http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html

This release includes a couple of build and Makefile fixes by Mattia
Dongili, and also a patch by him which causes cpufrequtils to always set the
maximum frequency before the minimum frequency on a policy change, as the
kernel expects us to do so.

	Dominik

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEfsj/Z8MDCHJbN8YRAgvtAJ4qNYqOnczskMuyeiYN2XberwcLdgCfXi2g
2dNOZ37pholMRk3L3077JAw=
=9a/u
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--


--===============0860058468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0860058468==--

