From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: pending cpufreq patches for 2.6
Date: Sat, 10 Jan 2004 16:19:55 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110151955.GA8163@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============023337116986286377=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: davej@redhat.com
Cc: cpufreq@www.linux.org.uk


--===============023337116986286377==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dave,

Thanks for pushing the many cpufreq changes to Linus for 2.6.1.

The following patches are still pending, though:

- [powernow-k7] scaling_available_freqs [Kronos]
  http://lkml.org/lkml/2003/12/23/151

- [geode] register fixup [Hiroshi Miura]
  http://www.linux.org.uk/mailman/private/cpufreq/2003-December/002968.html

and, possibly, my latest "fix p4-clockmod CPU detection" patch (sent a few
minutes ago)

	Dominik

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAABgbZ8MDCHJbN8YRAsifAJ0RDTCrnihSzf5i+1dOZw6okqjYIwCgjtzK
Zp3eRuu0SkQl8hxSDMx7Jlk=
=k0E0
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--


--===============023337116986286377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============023337116986286377==--

