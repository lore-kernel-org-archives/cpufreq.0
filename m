From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Speedstep on centrino
Date: Thu, 22 Apr 2004 16:35:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040422143515.GA21208@dominikbrodowski.de>
References: <87n05aoxpa.fsf@dorker.boxed.no>
	<1082629118.5672.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1636104903=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1082629118.5672.15.camel@localhost.localdomain>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>, Alexander Hoogerhuis <alexh@boxed.no>, linux-kernel <linux-kernel@vger.kernel.org>


--===============1636104903==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2004 at 08:18:38PM +1000, Jeremy Fitzhardinge wrote:
> On Sun, 2004-04-18 at 11:56, Alexander Hoogerhuis wrote:
> > Using SpeedStep for Centrino with decoding the speeds and voltages
> > (CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI) will not yield any output during
> > boot regarding cpufreq at all

This is normal; dmesg is kept clean if no error occurs -- in theory. Maybe
some errors do not result in printk()s yet, let's see...

> > and the battery useage is heavy. ACPI is enabled.=20

What does /proc/acpi/processor/./performance say, if it exists? and are
there files and proper values in /sys/devices/system/cpu/cpu0/cpufreq/ ?

	Dominik

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAh9gjZ8MDCHJbN8YRAiUYAJ9z5Wvqh2e2xa+3iwIxGJe+vu3ELwCeOg/z
ksgZusGnK9Fd2+U4ZNesKMg=
=6bTW
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--


--===============1636104903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1636104903==--

