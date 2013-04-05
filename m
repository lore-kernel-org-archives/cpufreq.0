From: Petr =?utf-8?Q?=C5=A0abata?= <contyk@redhat.com>
Subject: Re: Fehler bei cpufreq-info
Date: Fri, 5 Apr 2013 16:31:09 +0200
Message-ID: <20130405143109.GA1451@noon.brq.redhat.com>
References: <51558EDC.2040503@gmx.de>
 <515B4DB3.9040507@gmx.de>
 <20130403075303.GA24986@rincewind.usersys.redhat.com>
 <2017362.3fkGx2zPkK@skinner.arch.suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2017362.3fkGx2zPkK@skinner.arch.suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: Rainer Maier <RaMaier@gmx.de>, cpufreq@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2013 at 04:01:20PM +0200, Thomas Renninger wrote:
> On Wednesday, April 03, 2013 09:53:04 AM Petr =C5=A0abata wrote:
> > On Tue, Apr 02, 2013 at 11:29:23PM +0200, Rainer Maier wrote:
> > > Hi Thomas,
> > > thanks for your info.
> > > I removed cpufrequtils, but when I tried to install cpupower by aptit=
ude
> > > it didn't know the package. I searched for it, but couldn't find one.
> > > Would you perhaps know which packet to install ?
> > >=20
> > > Thanks
> > > Rainer
> >=20
> > The cpupower utilities are part of the kernel tree now and
> > included in the kernel-tools package on Fedora.  I suppose it
> > will be something similar in your distribution.
>=20
> Sigh.
> I guess you have a separate perf package at least?

Yes, but technically it's a kernel subpackage.

> It would be great if cpupower gets packaged separately for two
> reasons:
> 1) cpuidle and cpufreq are used by a lot archs nowadays:
>     ppc, arm, afaik S390 at least they tried,...  =20
>     I expect the kernel-tools package will only compile on X86?

They used to be a separate package before the code moved
to kernel.  I see the package is build for ppc[64] but not
on s390[x].  I have no information on arm[64] at the moment
but if there are issues, I'll let you know :)

> 2) To avoid confusion like above, so that this tool can easily
>     be found by people searching for it.

This is handled by package manager.  Besides the list of of
binaries the tools package should also act as a replacement
for former cpufrequtils and cpupowerutils packages.

> Petr: Would you mind forward this to the maintainer.
> I once made sure cpupower compiles on ppc iirc, if someone
> runs into arch specific compile (or runtime) issues, please let
> me know, this should get fixed then.

See above.

I'll forward this to kernel owners in Fedora.

Regards,
Petr

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iF4EAREIAAYFAlFe4CwACgkQT+hZYwG3Kb66eAD9Ey9Cm0vO+K2H2yLBMt0PZhnC
Viw7scLbFxGFLYRDxHMA/0J+pYoFemY5FTuP0RHrGzu2H3fOlbG48aMzCWQnT7r6
=9y5a
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
