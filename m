From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Acer Aspire  1350 broken PST
Date: Sat, 17 Apr 2004 11:32:20 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040417093220.GA7975@dominikbrodowski.de>
References: <c5n0ms$7nc$1@sea.gmane.org> <20040416120519.GT8953@poupinou.org>
	<c5osds$fed$1@sea.gmane.org> <20040416151135.GV8953@poupinou.org>
	<c5otiu$ime$1@sea.gmane.org> <20040416152432.GW8953@poupinou.org>
	<c5p3e0$6js$1@sea.gmane.org> <20040416182013.GZ8953@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0895530567=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040416182013.GZ8953@poupinou.org>
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
Cc: jy <jy454@yahoo.fr>, cpufreq@www.linux.org.uk


--===============0895530567==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 16, 2004 at 08:20:13PM +0200, Bruno Ducrot wrote:
> Try with UP kernel.  At that time, cpufreq break TSC timer on SMP
> kernels.  Or alternatively use the ACPI-timer.

Why is TSC timer on SMP broken, in your opinion? AFAICS, the problem seen on
this machine is caused because of actual cpu frequency != frequency the
cpufreq core thinks the CPU is in.

	Dominik
--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAgPmkZ8MDCHJbN8YRAoOQAJ9KjJtOH6GDAO5RAtQtUyF0oHn7qACeOxVl
Ql/RvUcKdSs0diIVSB1gKVM=
=0cw7
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--


--===============0895530567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0895530567==--

