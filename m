From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8 updates
Date: Fri, 26 Mar 2004 14:02:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040326130254.GA9284@dominikbrodowski.de>
References: <20040326120151.GA3102@elf.ucw.cz>
	<20040326121915.GA207@elf.ucw.cz>
	<20040326122742.GA8871@dominikbrodowski.de>
	<20040326123216.GB321@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2135971828=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040326123216.GB321@elf.ucw.cz>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Pavel Machek <pavel@ucw.cz>
Cc: paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============2135971828==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2004 at 01:32:16PM +0100, Pavel Machek wrote:
> On P=E1 26-03-04 13:27:42, Dominik Brodowski wrote:
> > On Fri, Mar 26, 2004 at 01:19:15PM +0100, Pavel Machek wrote:
> > > Hi!
> > >=20
> > > > Few updates, enable ACPI, add common printing function, fix typo, m=
ove
> > > > "pst out of sequence" where it belongs, fix formating in
> > > > powernow-k8.h. I'm not quite sure what this is against, so this is
> > > > "eyes only".
> > >=20
> > > Its strange, ACPI code does not seem to mention batps at all, still
> > > cpu goes to 800MHz when I unplug the cord... Perhaps it should at
> > > least say something into the syslog?
> >=20
> > ... again our differences about verbosity... :-)
>=20
> Actually, I do not understand how it works. How does cpufreq know how
> many states are there on battery? It does something, but I'd like to
> understand it...

The BIOS notifies the acpi processor module of a platform limit change
(acpi_processor_notify). The acpi processor module then reads out the _PDC
value of the ACPI table, which contains the maximum current supported
P-State [P0 is highest freq, Px is lowest].=20

Then the cpufreq_update_policy() function is called: the last cpufreq policy
set is send to the cpufreq notifiers, among them is
acpi_processor_ppc_notifier(), which limits the max allowed frequency, see

        cpufreq_verify_within_limits(policy, 0,
                pr->performance->states[ppc].core_frequency * 1000);

Then the policy (min/max frequency) is passed to a cpufreq governor [in mos=
t=20
cases the userspace governor], which selects one speed between min and max=
=20
frequency and tells the driver via ->target() of the frequency to set.

Hope this clarifies,

	Dominik
--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAZCn+Z8MDCHJbN8YRAtIGAJ97gVf/AnjF5l0XCx9BfvrLtNS2VgCffR1u
2TcOhVYUzbD64L1G0chZAN4=
=JkKK
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--


--===============2135971828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============2135971828==--

