From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [RFC] cpufreq_get()
Date: Thu, 22 Jan 2004 21:56:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040122205620.GA8012@dominikbrodowski.de>
References: <20040122190649.GC25416@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============30542300467628669=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040122190649.GC25416@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


--===============30542300467628669==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 22, 2004 at 08:06:49PM +0100, Ducrot Bruno wrote:
> I'm planing to add the cpufreq_get() in struct cpufreq_driver,
> but in a hardware fashion, eventually replacing the name by
> something more appropriate.

I appreciate this suggestion.

>   Even for longrun, we
>   can verify that the frequency is between min and max.

For ->range() drivers [I intend to rename ->setpolicy() to ->range()], we
should leave the ->get() function optional in case the speed isn't
detectable.

	Dominik

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAEDj0Z8MDCHJbN8YRAhUAAKCZAU9K25ZAMekNjnLuLET5r4sMOACdFSnL
pRU0IgSRudDPk+0O9I6mxow=
=GIdz
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--


--===============30542300467628669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============30542300467628669==--

