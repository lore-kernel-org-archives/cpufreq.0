From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq & dual core CPUs.
Date: Tue, 30 May 2006 21:40:37 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB60085E063E@scsmsx403.amr.corp.intel.com>
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
To: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk
Cc: Andrew Morton <akpm@osdl.org>


I am assuming speedstep-centrino is being used here. This one core
reducing the frequency of the other core is not supposed to happen. The
way it is handled in Core Duo or later CPUs is:
1) We can either use software coordination when BIOS and OS supports it.
In which case, OS will know that these two CPUs are tied together and
controls both of them using one interface. However, the users of this
one common interface, cpuspeed or ondemand governor should be aware of
this fact that one interface controls two CPUs (by looking at the
affected_cpus in cpufreq directory). Ondemand handles this today. But,
cpuspeed. I am not sure.

2) More easier way is to do this coordination in hardware. Each Cpu will
write to their own MSR. Hardware will pick the maximum frequency of the
two MSR and controls the package at that frequency. This is the default
mode on most of Core Duo based platforms and we have found that this is
more effient in the sense that each CPU can indepently control the
frequency, with no set_cpu_allowed() and friends in the path.

Basically, with hardware coordination, you should not see this
particular issue. I feel, there is something broken in this particular
case and I will look into it closer tomorrow. My guess at this point is,
this is due to userlevel governor, which looks at utilization over a
period of time (few seconds) and then decides on the frequency. This can
be checked with ondemand governor, which should handle this case much
better.

Thanks,
Venki=20

>-----Original Message-----
>From: Dave Jones [mailto:davej@redhat.com]=20
>Sent: Tuesday, May 30, 2006 9:27 PM
>To: cpufreq@www.linux.org.uk
>Cc: Pallipadi, Venkatesh
>Subject: cpufreq & dual core CPUs.
>
>After being prompted by akpm to look into this (he noted his builds
>were taking twice as long when cpuspeed was active on his core=20
>duo laptop),
>I did some tests on a similar spec laptop myself, and it seems that
>we have a number of shortcomings in cpufreq right now when presented
>with a multi-core CPU.
>
>This CPU has two cores in a single package, yet cpufreq doesn't
>realise this, and presents them as two separately independant scalable
>CPUs, as if they were regular SMP.
>
>The problems this causes are twofold.
>
>- We get into situations where strange things happen like
>  CPU0 being at 1GHz whilst CPU1 is at 2GHz, and a foodfight
>  ensues as both cores continually readjust themselves to
>  match what the other is doing.
>  (This is actually quite amusing to watch if you configure two
>   of the gnome cpufreq applets)
>  This seems to affect both userspace daemons like cpuspeed,
>  and also (to a lesser extent) the ondemand/conservative governors.
>
>  By adding dual-core awareness to the drivers, we can make sure
>  that all cores in a single package stay in sync.
>
>- We allow the possibility for different governors on each core.
>  Ie, you can set core0 to ondemand and core1 to userspace.
>  I'm not convinced this is a good idea even on SMP, but on
>  multi-core it for sure makes no sense.
>
>  One way to fix this would be to ensure that updating the
>  governor on one core automatically updates the governor
>  on all other cores.  It does mean that the CPU agnostic=20
>drivers/cpufreq/
>  core will have to start caring about architecture specific things
>  like the core maps however.
>
>Before looking any further into why Andrews performance suffered
>so much (it aparently never shifted up from 1GHz unless he ran
>two intensive tasks, keeping both cores busy), I think getting
>the above in order makes sense.
>
>Comments?
>
>		Dave
>
>--=20
>http://www.codemonkey.org.uk
>
