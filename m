From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 16:08:06 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040114150806.GA5137@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C080EF3A4@txexmtae.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============70023051996840779=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <99F2150714F93F448942F9A9F112634C080EF3A4@txexmtae.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: paul.devriendt@amd.com
Cc: davej@redhat.com, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, pavel@ucw.cz, linux-kernel@vger.kernel.org


--===============70023051996840779==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2004 at 08:49:18AM -0600, paul.devriendt@amd.com wrote:
> Absolutely. I am planning on using them also in the new ACPI based driver,
> along with your acpi-perflib.

Excellent.

> What is your progress on getting acpi-perflib merged into the kernel so t=
hat
> an additional patch is not needed ?

Unfortunately, it seems to be too invasive in the form it was proposed at
first. However, I'm currently in the process of getting the same
infrastructure[*] in place by doing small, logical, incremental changes to
drivers/acpi/processor.c. The first three patches are submitted to Len Brown
[1][2][3]; I haven't received a reply from him about these patches yet.

What helps in developing this is that I finally own a notebook
which supports ACPI P-States....

	Dominik

[*] or almost the same infrastructure. The first two core patches assure=20
that
_PPC and passive cooling work.

[1] http://marc.theaimsgroup.com/?l=3Dacpi4linux&m=3D107398569012495&w=3D2
[2] http://marc.theaimsgroup.com/?l=3Dacpi4linux&m=3D107398568612489&w=3D2
[3] http://marc.theaimsgroup.com/?l=3Dacpi4linux&m=3D107407671712989&w=3D2

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFABVtWZ8MDCHJbN8YRAkM/AJ47tbig09FYxsmGPJeGoZNaZP0zCACfUH6l
kSr94kLj65/nm9+YA3dIzDY=
=4Wls
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--


--===============70023051996840779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============70023051996840779==--

