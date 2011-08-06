From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: 'cpufreq-set -g performance -r' does not set all CPUs (AMD
	only?)
Date: Sat, 6 Aug 2011 16:24:14 +0200
Message-ID: <20110806142414.GA1440@isilmar-3.linta.de>
References: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com> <20110731085706.GB19629@comet.dominikbrodowski.net> <CAEdQ38FCJS1aT4Um2qbw-shHFWjg28QfrfXYvdnzFo2YzaAczw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38FCJS1aT4Um2qbw-shHFWjg28QfrfXYvdnzFo2YzaAczw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Turner <mattst88@gentoo.org>
Cc: cpufreq@vger.kernel.org, Juergen Rose <rose@rz.uni-potsdam.de>

Hey,

On Fri, Aug 05, 2011 at 06:01:47PM -0400, Matt Turner wrote:
> On Sun, Jul 31, 2011 at 4:57 AM, Dominik Brodowski
> <linux@dominikbrodowski.net> wrote:
> > Hey,
> >
> > On Sun, Jul 31, 2011 at 12:46:31AM -0400, Matt Turner wrote:
> >> I've got a bug report about cpufreq-set -r not setting all related
> >> CPUs. It appears to be a problem with AMD CPUs only.
> >>
> >> https://bugs.gentoo.org/show_bug.cgi?id=3D376565
> >>
> >> Any ideas what's going on?
> >
> > What's the output of cpufreq-info on these systems? Might it be tha=
t the
> > CPUs on this AMD system may be set to different frequencies? "-r" o=
nly sets
> > the governor on all _related_ CPUs, not on all CPUs found on the sy=
stem.
> >
> > Best,
> > =A0 =A0 =A0 =A0Dominik
>=20
> Hi Dominik,
>=20
> Juergen posted some output in
> https://bugs.gentoo.org/show_bug.cgi?id=3D376565 and I think also sen=
t
> it to you.
>=20
> It looks to me like either the CPU isn't required to use the same
> frequency for all cores, or it's a kernel bug reporting incorrect
> information to cpufrequtils. What do you think?

cpufreq assumes the former. If

/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus and
/sys/devices/system/cpu/cpu0/cpufreq/related_cpus

do report something else than "0", though, then there's a bug in
cpufrequtils. If more than one CPU is required to use the same frequenc=
y,
it's a kernel bug/regression...

I tend to add an "-a" option to set all CPUs, though (cpupowerutils onl=
y).

Best,
	Dominik
