From: Dietz Proepper <dietz@rotfl.franken.de>
Subject: Re: "new" (aus of 2.6.20) acpi_cpufreq and thinkpad z61m
Date: Tue, 20 Feb 2007 15:01:53 +0100
Message-ID: <200702201501.53890.dietz@rotfl.franken.de>
References: <200702041157.15234.dietz@rotfl.franken.de>
	<1170631201.4751.24.camel@sublime.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1170631201.4751.24.camel@sublime.site>
Content-Disposition: inline
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
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk

Hi,

Thomas Renninger:
> On Sun, 2007-02-04 at 11:57 +0100, Dietz Proepper wrote:
> > Hi,
> >
> > I've been playing around a lttle with a thikpad z61m (core 2 duo cpu, 
> > 945 chipset) and acpi_cpufreq from 2.6.20-rc6 and found the follwoing
> > strage behaviour:
> >
> > Under "normal" circumstances, if I disconnect the ac power, the laptop
> > pulls about 18W from the battery when idle (which nearly matchs idle
> > consumption under Windows XP and is totally ok for the machine).
> >
> > But, every now and then, idle consumption goes up to about 25W, and
> > goes down again only after a reboot (suspending to disk and resuming
> > does not help). Needlessly to say that max/min frequencies are set to
> > the right value and /sys/.../cpuinfo_cur_freq is at the min freq.
>
> It could also be the processor sleeping states:
> cat /proc/acpi/processor/*/power

They look like they should, as far as I can see, also the state transition 
statistics.

> Try to unload drivers that could poll hardware and/or produce bus master
> activity.
> AFAIK this could be some wlan and USB modules and possibly others.

I see the behaviour even with no (apart from the cpufreq stuff) modules 
loaded and init=/bin/sh.

> If you want to play a bit with power consumption:
> latest -mm kernel should have dyntick patches in, which disables the
> frequent
> timer interrupt for a while in idle to be able to stay in deeper
> sleeping states
> for longer time. This should save you (if bus master activity stays low
> and userspace
> programs do not poll too much) a lot of battery life time.

For 2.6.20-final the beaviour changed a bit.  Now everything is fine, until 
I do a software suspend/resume (by means of swsusp2), then again the 
laptop hangs on high power consumption (and the cpus *are* in fact clocked 
down, run time of a little three liner that does some loops shows it 
clearly).

What leads me to the assumption that something in acpi-cpufreq might smell 
fishy is that if I use another driver (i.e. centrino-speedstep) I can not 
reproduce the above behaviour (reduction of power consumption is not as 
big as with acpi-cpufreq, but it works after a resume too ;-).

regards,
	Dietz
