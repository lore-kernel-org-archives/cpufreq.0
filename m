From: Hugo Mills <hugo-lkml@carfax.org.uk>
Subject: Re: 2.6.11 cpufreq: Device or resource busy
Date: Thu, 10 Mar 2005 12:10:15 +0000
Message-ID: <20050310121015.GA31010@carfax.org.uk>
References: <20050308222516.GA20370@carfax.org.uk>
	<20050308222836.GA19920@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1955163675=="
In-Reply-To: <20050308222836.GA19920@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk


--===============1955163675==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

   Thanks for the reply, and apologies for leaving this reply for so
long.

On Tue, Mar 08, 2005 at 11:28:36PM +0100, Dominik Brodowski wrote:
> On Tue, Mar 08, 2005 at 10:25:16PM +0000, Hugo Mills wrote:
> >    I've just upgraded my laptop (ASUS M3000 -- see below) from 2.6.10
> > to 2.6.11. It now seems to be unable to load the acpi_cpufreq module:
> > 
> > hrm@joshua:hrm $ sudo modprobe acpi-cpufreq
> > FATAL: Error inserting acpi_cpufreq (/lib/modules/2.6.11-plain/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): Device or resource busy
> 
> Possibly there is already speedstep-centrino up and running? Is there a
> /sys/devices/system/cpu/cpu0/cpufreq/ directory?

   Yes, there is such a directory. On investigation with Andrew's
patch, I _do_ appear to be running speedstep-centrino.

   My next question was to have been "if that's loaded, why doesn't my
frequency scale any more?", but I think I've tracked that down to a
problem with the userspace daemon I was using.

   Hugo.

-- 
=== Hugo Mills: hugo@... carfax.org.uk | darksatanic.net | lug.org.uk ===
  PGP key: 1C335860 from wwwkeys.eu.pgp.net or http://www.carfax.org.uk
   --- Do not meddle in the affairs of system administrators,  for ---   
                  they are subtle,  and quick to anger.                  

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCMDknssJ7whwzWGARAn2DAJ9Cw9cTLAmUXyBk+nIwRz6DLgnxOACgmiuf
wDKwv+8fi4SZod9oGgF3QGA=
=2311
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--


--===============1955163675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1955163675==--

