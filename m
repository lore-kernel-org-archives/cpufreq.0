From: Alexander Clouter <alex-kernel@digriz.org.uk>
Subject: Re: ondemand as default governor
Date: Wed, 7 Mar 2007 09:25:06 +0000
Message-ID: <20070307092506.GA20722@inskipp.digriz.org.uk>
References: <1172770914.10619.587.camel@d36.suse.de>
	<200703070124.29058.lenb@kernel.org>
	<20070307070208.GB15453@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0445617162=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070307070208.GB15453@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk


--===============0445617162==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Dave Jones <davej@redhat.com> [20070307 02:02:08 -0500]:
>
> On Wed, Mar 07, 2007 at 01:24:28AM -0500, Len Brown wrote:
>  > On Thursday 01 March 2007 12:41, Thomas Renninger wrote:
>  > > I just read in drivers/cpufreq/Kconfig:
>  > >=20
>  > > # Note that it is not currently possible to set the other governors
>  > > (such as ondemand)
>  > > # as the default, since if they fail to initialise, cpufreq will be
>  > > # left in an undefined state.
>  > >=20
>  > > Is this a bigger problem to solve?
>  > > Is there already someone working/thinking on/about a solution?
>  > >=20
>  > > Allowing this would be convenient...
>  >=20
>  > Yes, it would, then we could delete the other governors,
>  > and then delete the concept of multiple governors alltogether.
>=20
> It's not feasible unless you have a way of making various
> older CPUs transition faster.  Ondemand on longhaul,powernow-k6,longrun,
> elanfreq, as well as lots of non-x86 implementations is just not
> a feasible option.
>=20
As a compromise I guess someone could make a patch that 'forces'=20
ondemand/conservative by default with a few '#ifdef's.  Slap a huge "we wil=
l=20
simply laugh at you if you complain this does not work" in the Kconfig help=
=20
section and everyones happy.  It should be a rather un-intrusive patch.

> However.. conservative might be.  I'd still like to see conservative
> folded into ondemand sometime, and just be a module param.
>=20
This was originally touted as this but Dominik[1] suggested it would be a f=
ar=20
better use of the modular governor system if I forked a different governor=
=20
instead.  Also if you look at the current userland tools out there that twe=
ak=20
the /sys/.../cpufreq/ settings you will find they really are all kitted out=
=20
to flip between completely different governors on system events rather than=
=20
sit on a particular one and tweak a few parameters when someone yanks the=
=20
power lead[2].

I would admit it looks and feel the kind of thing that should be run into a=
=20
single governor[3] but this would really muck around the userland tools as=
=20
they would have to be re-written to actually know the workings of each=20
particular governor rather than just being told "use this one when on AC an=
d=20
this one when not".  It would clean up the kernel land forking, but the cos=
t=20
to the userland side would be horrible.

Cheers

Alex

[1] http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=3D109808470906084&w=3D2
[2] this seems to be the main use for my governor, laptop users use ondemen=
d=20
	when on AC power and use something like the Debian laptop-mode-tools=20
	package to flip to conservative when they unplug; I know I do
[3] as the conservative maintainer I just try to minimise the size of the=
=20
	diff file produced between ondemand and conservative :)

> 	Dave
>=20
> --=20
> http://www.codemonkey.org.uk
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>=20

--=20
 ____________________________________
/ May you live in interesting times. \
|                                    |
\ -- Chinese proverb                 /
 ------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF7oTyNv5Ugh/sRBYRAn2nAJ9egp5ieUk3+8yCfZmRJzwbbal7+gCgmIc2
/fizBndRLIg3ZHqzvUHUkQs=
=60fB
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--


--===============0445617162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0445617162==--

