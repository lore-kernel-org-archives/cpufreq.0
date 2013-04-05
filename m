From: Thomas Renninger <trenn@suse.de>
Subject: Re: Fehler bei cpufreq-info
Date: Fri, 05 Apr 2013 16:01:20 +0200
Message-ID: <2017362.3fkGx2zPkK@skinner.arch.suse.de>
References: <51558EDC.2040503@gmx.de> <515B4DB3.9040507@gmx.de> <20130403075303.GA24986@rincewind.usersys.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130403075303.GA24986@rincewind.usersys.redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Petr =?utf-8?B?xaBhYmF0YQ==?= <contyk@redhat.com>
Cc: Rainer Maier <RaMaier@gmx.de>, cpufreq@vger.kernel.org

On Wednesday, April 03, 2013 09:53:04 AM Petr =C5=A0abata wrote:
> On Tue, Apr 02, 2013 at 11:29:23PM +0200, Rainer Maier wrote:
> > Hi Thomas,
> > thanks for your info.
> > I removed cpufrequtils, but when I tried to install cpupower by apt=
itude
> > it didn't know the package. I searched for it, but couldn't find on=
e.
> > Would you perhaps know which packet to install ?
> >=20
> > Thanks
> > Rainer
>=20
> The cpupower utilities are part of the kernel tree now and
> included in the kernel-tools package on Fedora.  I suppose it
> will be something similar in your distribution.

Sigh.
I guess you have a separate perf package at least?
It would be great if cpupower gets packaged separately for two
reasons:
1) cpuidle and cpufreq are used by a lot archs nowadays:
    ppc, arm, afaik S390 at least they tried,...  =20
    I expect the kernel-tools package will only compile on X86?
2) To avoid confusion like above, so that this tool can easily
    be found by people searching for it.

Petr: Would you mind forward this to the maintainer.
I once made sure cpupower compiles on ppc iirc, if someone
runs into arch specific compile (or runtime) issues, please let
me know, this should get fixed then.

Thanks,

   Thomas

Rainer: Again, if you have any cpufreq related problems it's probably
to p4-clockmod which is not a real cpufreq driver. The technique used
should only be used to avoid critical cpu temperature and does not
save you power, more the other way around (things should be processed
quickly so that CPU sleep states can be entered which are most efficien=
t).
It even can be that p4-clockmode interferes with another interface doin=
g
the same (CPU throttling, T-states) then your system becomes even more
laggy up to unusable.

