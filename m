From: Ronald van der Meer <revdmeer@conceptsfa.nl>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Thu, 12 Feb 2004 19:30:12 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1076610612.4491.42.camel@laptop>
References: <1076542663.4323.17.camel@laptop> <402B6516.1030408@basmevissen.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <402B6516.1030408@basmevissen.nl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi,

> The p4-clockmod driver only modulates the CPU-clock. That means that the 
> clock is running like this: 1111000000001111000000001111 (1=on, 0=off).
> 
> Because the clock is running at max CPU speed when on, the voltage 
> cannot be lowered. In theory, the voltage could be dropped when the 
> clock is off. But because it takes some time before the voltage 
> stabilises again, that would mean that the modulation frequency should 
> become so slow that it would be very noticable (e.g. jerky mouse movement).

Thanx for the info on the p4-clockmod driver. It seems like a pretty
much useless cpu-feature to me since it doesn't save any power. It just
slows stuff down, which maybe even costs more battery-power per task
simply because the task will take longer to finish. If this is true
isn't it even misleading for this driver to be in the power-management
part of the kernel because this implies it saves power? A warning at
least seems very appropriate to me.

> So what you need is speedstep-ich. That driver can both change CPU 
> frequency and CPU voltage. But you say it does not support ICH5. Did you 
> try it already or did you only read the documentation?

I tried a rather old patch (20031203) which didn't work. I checked the
current source of the speedstep-ich driver. The function
speedstep_detect_chipset in line 186 of speedstep-ich.c doesn't seem to
check for my southbridge. This matches what is in the documentation. So
trying again seems pretty useless.

So does anybody have any clue about speedstep support with the ICH5 ?

> BTW. What labtop do you have?

It's a Medion MD40100, for more info on it's internals check
http://home.conceptsfa.nl/~revdmeer/md40100/

Ronald
