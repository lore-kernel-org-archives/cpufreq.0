From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8 updates
Date: Sun, 14 Mar 2004 17:32:56 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040314163256.GA24433@dominikbrodowski.de>
References: <20040309214830.GA1240@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0638455869=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040309214830.GA1240@elf.ucw.cz>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Pavel Machek <pavel@suse.cz>
Cc: patches@x86-64.org, davej@redhat.com, kernel list <linux-kernel@vger.kernel.org>, Cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============0638455869==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2004 at 01:07:20PM +0100, Pavel Machek wrote:
> [Is it okay to post it to the lists for more testing and/or
> inclusion?]
                                                                           =
    =20
I prefer patches to files to comment on.
                                                                           =
    =20
> +config X86_POWERNOW_K8_ACPI
> +     tristate "AMD Opteron/Athlon64 PowerNow! using ACPI"
> +     depends on CPU_FREQ && EXPERIMENTAL
depends on ... && ACPI ?
                                                                           =
    =20
See also the other mail discussing how to handle the two methods to detect
speed.
                                                                           =
    =20
Unfortunately, I consider this new ACPI driver to be in an "unmergeable"
state, as the extra "polling" is unneccessary if the ACPI perflib is used,
the extra parsing of ACPI tables can fail much too easily, and the whole
driver is too fragile with regard to ACPI interaction.

	Dominik

--huq684BweRXVnRxX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVIk4Z8MDCHJbN8YRAky1AKCQ6eb8DsX+qb7B4pdIsVTMVrBgXACgjylG
CssNp956xVtZuNtt+UFts1M=
=szQp
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--


--===============0638455869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0638455869==--

