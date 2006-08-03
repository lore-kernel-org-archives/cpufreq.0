From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Thu, 03 Aug 2006 19:33:59 +0400
Message-ID: <44D21767.7020806@linux.intel.com>
References: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
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
To: tobias.bocanegra@day.com
Cc: cpufreq@lists.linux.org.uk

Tobias Bocanegra wrote:
> hi,
> i don't know if this is the correct list to ask this question, if not
> just bash me :-)
> 
> i have a intel dual core t2600 with 2.16ghz, running 2.6.17-1.2157_FC5smp
> 
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 14
> model name      : Genuine Intel(R) CPU           T2600  @ 2.16GHz
> stepping        : 8
> 
> the files in /sys/devices/system/cpu/cpu0/cpufreq say:
> affected_cpus:0
> cpuinfo_cur_freq:1667000
> cpuinfo_max_freq:2167000
> cpuinfo_min_freq:1000000
> scaling_available_frequencies:2167000 1667000 1333000 1000000
> scaling_available_governors:userspace performance
> scaling_cur_freq:1667000
> scaling_driver:centrino
> scaling_governor:userspace
> scaling_max_freq:1667000
> scaling_min_freq:1667000
> scaling_setspeed:1667000
> 
> now, i try to set 2.17 ghz, but it always stays at 1.7:
> 
> # echo 2167000 > scaling_setspeed
> # cat cpuinfo_cur_freq
> 1667000
> 
> i tried every possible combination, and also cpu frequency tools like
> cpufreqd and cpufreq-set. and it does not matter which cpu i try to
> modify.
you should check for a daemon like cpufreqd or powersaved. As you system is not loaded (most probably), it insists on
setting lowest P-state available.
> 
> something other that is funny is that sysfs does not show correct cur_freq
> # echo 1000000 > scaling_setspeed
> # cat cpuinfo_cur_freq
> 1667000
> 
> # cat /proc/cpuinfo | grep MHz
> cpu MHz         : 1000.000
> 
> and:
> # cpufreq-info
> cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
> Report errors and bugs to linux@brodo.de, please.
> analyzing CPU 0:
> [...]
>  current CPU frequency is 1.67 GHz (asserted by call to hardware).
> 
> # cpufreq-info -f
> 1000000
> 
> funny enough, it worked once 2 days ago until i rebooted...but i can't
> figure
> out what was different. i guess, it's either some chipset-internal
> regulation
It does not exist.
> or some cpu daemon running.
Yes, see above.
> 
> has anyone some advice?
> regards, toby
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
