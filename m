From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8 updates
Date: Sun, 14 Mar 2004 17:33:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040314163310.GB24433@dominikbrodowski.de>
References: <20040309214830.GA1240@elf.ucw.cz>
	<20040310110941.GC28592@poupinou.org>
	<20040310113246.GA4775@atrey.karlin.mff.cuni.cz>
	<20040310134811.GD28592@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1064813239=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040310134811.GD28592@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: paul.devriendt@amd.com
Cc: Pavel Machek <pavel@suse.cz>, ducrot@poupinou.org, Cpufreq mailing list <cpufreq@www.linux.org.uk>, patches@x86-64.org, davej@redhat.com, kernel list <linux-kernel@vger.kernel.org>


--===============1064813239==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2004 at 02:48:11PM +0100, Bruno Ducrot wrote:
> ducrot@poupon:~/kernel/linux-2.6.4-bk-acpi> grep EXPORT drivers/acpi/proc=
essor.c
> EXPORT_SYMBOL(acpi_processor_register_performance);
> EXPORT_SYMBOL(acpi_processor_unregister_performance);
> EXPORT_SYMBOL(acpi_processor_set_thermal_limit);
>=20
> So all you need are acpi_processor_register_performance() and
> acpi_processor_unregister_performance().  I'm pretty sure that those
> functions are in 2.6.4-rc2.

These functions are indeed in 2.6.3 and 2.6.4 -- and they work fine. If you
have any questions related to them, please ask me.
=20
> If you want to play with those functions, you have to include
> <acpi/processor.h>, and then you have to register a driver via:
> acpi_processor_register_performance(&pr, cpu) where:
> - cpu is the cpu id (point-of-view of Linux, not the acpi cpu id),
> - pr is a struct acpi_processor_performance (defined in
>   acpi/processor.h).
>=20
> You will have then for free:
> - configurations via the acpi_processor_performance structure,
> - handling of the _PPC object, so that you don't have to care about
>   changes for that in the driver.  That will be done via classic
>   ACPI event notifications to the processor, via the limit interface
>   writen in drivers/acpi/processor.c, and cpufreq notion of notifiers.

Minor correction: only the first and last steps are indeed used to handle
_PPC, IIRC.

Also, you'll have
- support for _PDC, if needed
- proper embedding into ACPI core
- the /proc/acpi/processor/./performance interface which some still tend to
   like...

	Dominik

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVIlGZ8MDCHJbN8YRAktuAJ9zTn9OfnOElU+tFH24TxnRaI/1zACgjpM7
iILO3EKJWkjSuI4ovL6rMv0=
=0m0y
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--


--===============1064813239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1064813239==--

