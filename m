From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Speedstep on Intel Pentium M
Date: Mon, 31 May 2004 23:35:42 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040531233542.368b9da0.frx@firenze.linux.it>
References: <8012937.1086037545966.SLOX.WebMail.wwwrun@thor.yiti.intern>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0371895121=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <8012937.1086037545966.SLOX.WebMail.wwwrun@thor.yiti.intern>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk

--===============0371895121==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Mon__31_May_2004_23_35_42_+0200_6i0_0F=z.Es5ADYm"

--Signature=_Mon__31_May_2004_23_35_42_+0200_6i0_0F=z.Es5ADYm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Mon, 31 May 2004 23:05:45 +0200 (CEST) Frank Doege wrote:

> i have sucessfully enabled speedfreq using the centrino drivers in the
> kernel 2.6.7. My Laptop steps between 600Mhz and 1.2 Ghz, all runs
> very fine. The Question i have is why can windows step the processor
> to 300Mhz but Linux doesnt ?

As I understand it, Windows throttles the CPU in order to reach that
`virtual' 300 MHz clock frequency.
But throttling is useless, at least from an energy-saving point of view.
It could be useful from a thermal point of view, but, IIRC, ACPI
P-states should be better for that.

Cpufreq gurus and kernel hackers are welcome to correct me and/or
clarify further...  :p


-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Mon__31_May_2004_23_35_42_+0200_6i0_0F=z.Es5ADYm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAu6UyePQnm91t/PQRAt7QAKCiZc8+JFVxCVrUE4bOcCz3C0dRXgCeL5Vu
c6bU7DFoYLRGSVnx1/h3cAg=
=LNAf
-----END PGP SIGNATURE-----

--Signature=_Mon__31_May_2004_23_35_42_+0200_6i0_0F=z.Es5ADYm--


--===============0371895121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0371895121==--

