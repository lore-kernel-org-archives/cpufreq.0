From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: add new p3m model
Date: Sun, 14 Mar 2004 15:34:07 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040314143407.GA21991@dominikbrodowski.de>
References: <20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308133135.GU2869@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2119703748=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308133135.GU2869@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>, Arjan van de Ven <arjanv@redhat.com>
Cc: cpufreq@www.linux.org.uk


--===============2119703748==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2004 at 12:15:31PM +0100, Arjan van de Ven wrote:
> Hi,
>=20
> the patch below adds support for my laptop (Dell Inspiron 2600) which has
> ebx return 7 for the p3 mobile in it....

Can you send a /proc/cpuinfo, please?

> --- linux-2.6.3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c~	2004-03-07 =
15:31:51.305251000 +0100
> +++ linux-2.6.3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-07 1=
5:31:51.305251000 +0100
> @@ -265,10 +265,10 @@
>  	case 0x0B: /* Intel PIII [Tualatin] */
>  		/* cpuid_ebx(1) is 0x04 for desktop PIII,=20
> -		                   0x06 for mobile PIII-M */
> +		                   0x06 and 0x07 for mobile PIII-M */

According to the latest Intel m-PIII-M doc I can find (24530643 of December
2003), 0x06 is the only valid ebx value. Might this be an engineering
sample?=20

If we indeed add 0x07 as supported value here, we should at least make sure
we're "contrary to specification" here.

	Dominik

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVG1fZ8MDCHJbN8YRArAnAJ93I86HAu6j8DiOHxdNThYev+Uf+wCdETi6
Sl2LNvWPzWTdYifyctAweCE=
=5r6v
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--


--===============2119703748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============2119703748==--

