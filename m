From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Deadlock occurs in cpufreq_userspace.c
Date: Tue, 10 Feb 2004 22:51:38 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040210215138.GA5163@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB6082D12C@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============64581498522680114=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6082D12C@scsmsx403.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "Li, Shaohua" <shaohua.li@intel.com>, cpufreq@www.linux.org.uk, davej@redhat.com


--===============64581498522680114==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2004 at 10:17:35AM -0800, Pallipadi, Venkatesh wrote:
>=20
> Yes. We initially thought about this solution. But, we thought it is
> safer to hold policy->lock before changing the frequency. Otherwise, it
> may complicate if frequency is changed from multiple places (like
> governor and a PPC handler).

Only a governor may call the ->target() function [via
{,__}cpufreq_driver_target()}], the PPC handler _also_ doesn't change the
frequency directly but limits the range of frequencies the governor can
select from.

> If we are going to use __cpufreq_driver_target(), then can we remove
> cpufreq_driver_target() altogether? Do you see any other usage to it?

Yes, I do see correct usages of cpufreq_driver_target() in other (not yet
merged) cpufreq governors.

	Dominik

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAKVJqZ8MDCHJbN8YRAhcRAKCVwMQ5L6LAACDduJRV+igdX+tdywCfe6qd
smh3RyzFLMZ8WqRlV9Tyi/U=
=98Iw
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--


--===============64581498522680114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============64581498522680114==--

