From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Fri, 13 Feb 2004 10:30:22 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040213093022.GB5230@dominikbrodowski.de>
References: <1076542663.4323.17.camel@laptop> <402B6516.1030408@basmevissen.nl>
	<1076610612.4491.42.camel@laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============22460475117767409=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1076610612.4491.42.camel@laptop>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Ronald van der Meer <revdmeer@conceptsfa.nl>
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============22460475117767409==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2004 at 07:30:12PM +0100, Ronald van der Meer wrote:
> Thanx for the info on the p4-clockmod driver. It seems like a pretty
> much useless cpu-feature to me since it doesn't save any power. It just
> slows stuff down, which maybe even costs more battery-power per task
> simply because the task will take longer to finish. If this is true
> isn't it even misleading for this driver to be in the power-management
> part of the kernel because this implies it saves power? A warning at
> least seems very appropriate to me.

On systems where no "idle" states C2 or C3 are offered, the p4-clockmod
driver can save (some, not much) power, AFAIK. However, for P4-M or other
advanced mobile processors, it is more or less useless. Because of this, a
warning was added a couple of days ago to the 2.6. p4-clockmod driver
stating:

                printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The s=
peedstep-ich or acpi cpufreq \n");
                printk(KERN_DEBUG PFX "modules offers voltage scaling in ad=
dition of frequency scaling. You\n");
                printk(KERN_DEBUG PFX "should use either one instead of p4-=
clockmod, if possible.\n");
=20
or
                printk(KERN_DEBUG PFX "Warning: Pentium M detected. The spe=
edstep_centrino module\n");
                printk(KERN_DEBUG PFX "offers voltage scaling in addition o=
f frequency scaling. You\n");
                printk(KERN_DEBUG PFX "should use that instead of p4-clockm=
od, if possible.\n");
=20

	Dominik

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFALJkuZ8MDCHJbN8YRAugrAJ9R3DJtfZVzRBJsY+by6Cpw/B7S5QCeOu8b
unT4eC0gR9jMpzasCpPFGp0=
=MbM2
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--


--===============22460475117767409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============22460475117767409==--

