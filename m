From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Shell script to select the right cpufreq module?
Date: Wed, 31 Mar 2004 17:44:00 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040331154400.GA32308@dominikbrodowski.de>
References: <4069CA25.2080806@free.fr>
	<20040330203109.GA7141@dominikbrodowski.de>
	<20040331073455.q797owk8kwogcccw@carlthompson.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0919406910=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040331073455.q797owk8kwogcccw@carlthompson.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Carl Thompson <cet@carlthompson.net>, davej@redhat.com
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============0919406910==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2004 at 07:34:55AM -0800, Carl Thompson wrote:
> Does Vendor/Family/Model/Stepping give you enough information to
> determine the appropriate cpufreq driver?=20

Well, checking for the acpi flag is easier than compiling the
vendor/family/model/stepping check for _any_ such CPU...

> I notice that you are also looking for the acpi processor flag which
> will override everything else and using the p4-clockmod driver.

No -- it p4-clockmod is loaded [almost] last, so all other drivers are tried
first, if the CPU supports them. And that's the sane thing to do, as
p4-clockmod hardly ever saves any power.

>  Otherwise, it looks like my Dell
> laptop would have used speedstep-ich according to your script.  Is
> p4-clockmod better than speedstep-ich?  Is it true that any processor
> that has the 'acpi' flag set will use the p4-clockmod driver as your
> script assumes?=20

speedstep-ich is better as it also scales voltage in addition to frequency,
and if your system executes the "hlt" instruction properly, or even has ACPI
C2-support, p4-clockmod will not save you _anything_.

> Fedora Core 2 does not seem to even include the
> speedstep-ich driver.

OOOOPS. Dave?=20

>  Is it obsolete?  (Sorry, most of my experience
> is with AMD mobile processors).

No, it's not obsolete, it is _recommended_ for many systems.

> Where can I find more complete info on possible values for the fields of
> /proc/cpuinfo and the different cpufreq drivers they represent?  It
> doesn't have to be a working script; with the info I'll write my own to
> include with cpuspeed.

For Intel-based CPUs, the info I provided should be enough, for AMD, well,
you asked a lot of people for it a few minutes ago...=20

	Dominik
--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAaudAZ8MDCHJbN8YRAufiAJ9xD1zray9L49eh5DfYEXmTuKFwmACfVJdb
evTN1j7R1FEwNcKtCODiWFI=
=ARvW
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--


--===============0919406910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0919406910==--

