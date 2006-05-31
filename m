From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq & dual core CPUs.
Date: Wed, 31 May 2006 00:54:17 -0400
Message-ID: <20060531045417.GA9439@redhat.com>
References: <88056F38E9E48644A0F562A38C64FB60085E063E@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60085E063E@scsmsx403.amr.corp.intel.com>
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
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Andrew Morton <akpm@osdl.org>, cpufreq@www.linux.org.uk

On Tue, May 30, 2006 at 09:40:37PM -0700, Pallipadi, Venkatesh wrote:
 
 > I am assuming speedstep-centrino is being used here.

yes, sorry for omitting that, though I'm not sure this problem
is unique to Intel CPUs, though powernow-k8 does seem to have
some awareness of the cpu_core_map

 > This one core
 > reducing the frequency of the other core is not supposed to happen. The
 > way it is handled in Core Duo or later CPUs is:
 > 1) We can either use software coordination when BIOS and OS supports it.
 > In which case, OS will know that these two CPUs are tied together and
 > controls both of them using one interface. However, the users of this
 > one common interface, cpuspeed or ondemand governor should be aware of
 > this fact that one interface controls two CPUs (by looking at the
 > affected_cpus in cpufreq directory). Ondemand handles this today. But,
 > cpuspeed. I am not sure.

Looking at that file on my core duo laptop, I see ..

(00:47:47:davej@exile:~)$ cat /sys/devices/system/cpu/cpu0/cpufreq/affected_cpus
0
(00:47:54:davej@exile:~)$ cat /sys/devices/system/cpu/cpu1/cpufreq/affected_cpus
1

That implies to me that they're separate cores no?

 > 2) More easier way is to do this coordination in hardware. Each Cpu will
 > write to their own MSR. Hardware will pick the maximum frequency of the
 > two MSR and controls the package at that frequency. This is the default
 > mode on most of Core Duo based platforms and we have found that this is
 > more effient in the sense that each CPU can indepently control the
 > frequency, with no set_cpu_allowed() and friends in the path.
 > 
 > Basically, with hardware coordination, you should not see this
 > particular issue. I feel, there is something broken in this particular
 > case and I will look into it closer tomorrow. My guess at this point is,
 > this is due to userlevel governor, which looks at utilization over a
 > period of time (few seconds) and then decides on the frequency. This can
 > be checked with ondemand governor, which should handle this case much
 > better.

ondemand does behave better than userspace does, but something is
still amiss given that they can both still be set to individual
values.
This..

(00:52:15:davej@exile:~)$ grep MHz /proc/cpuinfo
cpu MHz         : 1000.000
cpu MHz         : 2167.000

Should never happen on a dual core system that has synchronised cores.
Either they're both running at 1GHz, or they're both running at 2.1GHz.

(That was with both cpu0 & cpu1 set to use ondemand governor).

		Dave

-- 
http://www.codemonkey.org.uk
