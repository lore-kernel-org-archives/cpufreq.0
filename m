From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 11:10:41 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040114101041.GB16737@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C080EF392@txexmtae.amd.com>
	<20040113230605.GM14674@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============061280998838607825=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040113230605.GM14674@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>, paul.devriendt@amd.com, pavel@ucw.cz, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org


--===============061280998838607825==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2004 at 11:06:05PM +0000, Dave Jones wrote:
> Part of the justification for cpufreq (at least on x86) was an alternative
> for when ACPI just doesn't work, or for when folks either don't want to,
> or can't run ACPI (through various other AML bugs for eg).

Except that the ACPI P-States implementation also uses the cpufreq
infrastructure.

	Dominik
--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFABRWhZ8MDCHJbN8YRAmDFAJ9gOP+vbzJS0uHO7FG/NTSsRLYpGQCeMGIP
SYuEdVcscqj6H0wnUhnVLw8=
=NH+k
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--


--===============061280998838607825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============061280998838607825==--

