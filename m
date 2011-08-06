From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: 'cpufreq-set -g performance -r' does not set all CPUs (AMD
	only?)
Date: Sat, 6 Aug 2011 16:31:18 +0200
Message-ID: <20110806143118.GA5717@isilmar-3.linta.de>
References: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com> <20110731085706.GB19629@comet.dominikbrodowski.net> <CAEdQ38FCJS1aT4Um2qbw-shHFWjg28QfrfXYvdnzFo2YzaAczw@mail.gmail.com> <20110806142414.GA1440@isilmar-3.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110806142414.GA1440@isilmar-3.linta.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Turner <mattst88@gentoo.org>
Cc: cpufreq@vger.kernel.org, Juergen Rose <rose@rz.uni-potsdam.de>

On Sat, Aug 06, 2011 at 04:24:14PM +0200, Dominik Brodowski wrote:
> Hey,
>=20
> On Fri, Aug 05, 2011 at 06:01:47PM -0400, Matt Turner wrote:
> > On Sun, Jul 31, 2011 at 4:57 AM, Dominik Brodowski
> > <linux@dominikbrodowski.net> wrote:
> > > Hey,
> > >
> > > On Sun, Jul 31, 2011 at 12:46:31AM -0400, Matt Turner wrote:
> > >> I've got a bug report about cpufreq-set -r not setting all relat=
ed
> > >> CPUs. It appears to be a problem with AMD CPUs only.
> > >>
> > >> https://bugs.gentoo.org/show_bug.cgi?id=3D376565
> > >>
> > >> Any ideas what's going on?
> > >
> > > What's the output of cpufreq-info on these systems? Might it be t=
hat the
> > > CPUs on this AMD system may be set to different frequencies? "-r"=
 only sets
> > > the governor on all _related_ CPUs, not on all CPUs found on the =
system.
> > >
> > > Best,
> > > =A0 =A0 =A0 =A0Dominik
> >=20
> > Hi Dominik,
> >=20
> > Juergen posted some output in
> > https://bugs.gentoo.org/show_bug.cgi?id=3D376565 and I think also s=
ent
> > it to you.
> >=20
> > It looks to me like either the CPU isn't required to use the same
> > frequency for all cores, or it's a kernel bug reporting incorrect
> > information to cpufrequtils. What do you think?
>=20
> cpufreq assumes the former. If
>=20
> /sys/devices/system/cpu/cpu0/cpufreq/affected_cpus and
> /sys/devices/system/cpu/cpu0/cpufreq/related_cpus
>=20
> do report something else than "0", though, then there's a bug in
> cpufrequtils. If more than one CPU is required to use the same freque=
ncy,
> it's a kernel bug/regression...
>=20
> I tend to add an "-a" option to set all CPUs, though (cpupowerutils o=
nly).

*doh* It is already available:

$ cpupower -c all frequency-set -g powersave

Best,
	Dominik
