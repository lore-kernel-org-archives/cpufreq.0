From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq & dual core CPUs.
Date: Tue, 30 May 2006 22:02:28 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB60085E064C@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, cpufreq@www.linux.org.uk

=20

>-----Original Message-----
>From: Dave Jones [mailto:davej@redhat.com]=20
>Sent: Tuesday, May 30, 2006 9:54 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@www.linux.org.uk; Andrew Morton
>Subject: Re: cpufreq & dual core CPUs.
>
>
>Looking at that file on my core duo laptop, I see ..
>
>(00:47:47:davej@exile:~)$ cat=20
>/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus
>0
>(00:47:54:davej@exile:~)$ cat=20
>/sys/devices/system/cpu/cpu1/cpufreq/affected_cpus
>1
>
>That implies to me that they're separate cores no?

This implies software coordination is not happening here.
But, that is OK, as hardware or BIOS coordination can be happening.

> > 2) More easier way is to do this coordination in hardware.=20
>Each Cpu will
> > write to their own MSR. Hardware will pick the maximum=20
>frequency of the
> > two MSR and controls the package at that frequency. This is=20
>the default
> > mode on most of Core Duo based platforms and we have found=20
>that this is
> > more effient in the sense that each CPU can indepently control the
> > frequency, with no set_cpu_allowed() and friends in the path.
> >=20
> > Basically, with hardware coordination, you should not see this
> > particular issue. I feel, there is something broken in this=20
>particular
> > case and I will look into it closer tomorrow. My guess at=20
>this point is,
> > this is due to userlevel governor, which looks at utilization over a
> > period of time (few seconds) and then decides on the=20
>frequency. This can
> > be checked with ondemand governor, which should handle this=20
>case much
> > better.
>
>ondemand does behave better than userspace does, but something is
>still amiss given that they can both still be set to individual
>values.
>This..
>
>(00:52:15:davej@exile:~)$ grep MHz /proc/cpuinfo
>cpu MHz         : 1000.000
>cpu MHz         : 2167.000
>

Yes. Actually, both the cores will be running at 2GHz at this particular
instance.
It is just that OS does not know about this fact, as OS request to lower
frequency
has been recorded in hardware (through MSR) on CPU 0 and this change
will come=20
into affect asynchronously in future, once CPU 1 also requests for lower
frequency.

>Should never happen on a dual core system that has synchronised cores.
>Either they're both running at 1GHz, or they're both running at 2.1GHz.
>
>(That was with both cpu0 & cpu1 set to use ondemand governor).
>

The problem is that currently there is no way to get the actual current
frequency=20
and we depend on last requested frequency that went through without any
error.
Hence CPU 0 shows lower frequency even when we are actually at a higher
frequency.

Thanks,
Venki
