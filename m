From: Matthew East <matthew.east@gmail.com>
Subject: Re: celeron *clutches at straws*
Date: Thu, 6 Jan 2005 17:16:34 +0000
Message-ID: <3bd9116050106091631b1282d@mail.gmail.com>
References: <3bd91160501051619632315d0@mail.gmail.com>
	<20050106161312.GC10011@dominikbrodowski.de>
Reply-To: Matthew East <matthew.east@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20050106161312.GC10011@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Matthew East <matthew.east@gmail.com>, cpufreq@www.linux.org.uk, linux@dominikbrodowski.de

Hi Dominik,

> > Whereever I look on the internet a Family 15 Model 2 is reported as a
> > Pentium 4!! I know that the chips are similar. So what is the truth?
> > Is my chip cpufreq capable or not?
> 
> AFAIK no. Even though many parts of the CPU are similar so that they can be
> represented with the same CPUID, Celerons only do have one multiplier so
> SpeedStep is not supported on them.
> 
> > If not, is there anything else I can do to save battery power?
> 
> You can use throttling (/proc/acpi/processor/./throttling or the cpufreq -
> p4-clockmod driver) to avoid the CPU heating so much the fan has to be
> enabled / has to turn at a higher speed which causes an increase in energy
> consumption. It doesn't save any real CPU power, though, as the CPU most
> likely is put into a good idle power state already (check for C2 or higher
> in /proc/acpo/processor/./power )
> 
>         Dominik
> 

That is seriously useful thanks very much. I haven't looked in
/proc/acpi/processor before! I have found that the C2 state is
supported.

mdke@kallisto mdke $ cat /proc/acpi/processor/CPU0/power
active state:            C2
default state:           C1
bus master activity:     00000000
states:
    C1:                  promotion[C2] demotion[--] latency[000]
usage[07824590]   *C2:                  promotion[--] demotion[C1]
latency[002] usage[134432919]
    C3:                  <not supported>

mdke@kallisto mdke $ cat /proc/acpi/processor/CPU0/info
processor id:            0
acpi id:                 0
bus mastering control:   yes
power management:        yes
throttling control:      yes
limit interface:         yes

Most useful of all will be your information on throttling, which i
will experiment with. The last time I tried using throttling (through
some kde gui on a mandrake live disk), it made some strange whining
noises ;) Is it wholly safe? Noises make me uneasy... but of course
cooling down the processor would be nice as my fan is on far too much!
I'd like a bit of reassurance before I start though, so I'll post this
reply back to the list. Any help is appreciated very much!

Thanks again, 

Matt
