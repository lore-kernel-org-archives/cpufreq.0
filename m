From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: CPU frequency & time measurement
Date: Thu, 1 Apr 2004 14:03:14 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040401120314.GA16385@dominikbrodowski.de>
References: <002301c417df$2ef63610$286519a3@wroxos>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0386812850=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <002301c417df$2ef63610$286519a3@wroxos>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Aron <b8744029@stmail.cgu.edu.tw>
Cc: Cpufreq@www.linux.org.uk


--===============0386812850==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2004 at 07:48:00PM +0800, Aron wrote:
> If the real-time environment measure time via some functions access TSC.
> Will the time measurement via TSC register be affected by
> adjusting the CPU frequency?

If it is a Pentium 4, there might be a chance that the TSC is unaffected.
Else, the TSC is affected by adjusting the CPU frequency. The kernel core
adapts to such frequency changes; nonetheless there is a small discrepancy
whenever a frequency transition occurs.

	Dominik

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAbAUCZ8MDCHJbN8YRAnH3AJ4rs8ofr6tqup9fXwLrjfvwNkazTACfbxH4
gMIImnvM+nEFFA19knPZpa4=
=YfPg
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--


--===============0386812850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0386812850==--

