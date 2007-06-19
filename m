From: "Lei Yang" <leiyang@google.com>
Subject: Re: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
Date: Tue, 19 Jun 2007 14:34:28 -0700
Message-ID: <c583a31b0706191434r6d4ad0d7h5316d76bf210caa1@mail.gmail.com>
References: <c583a31b0706181102x3c78a544he158c7fad49b29e8@mail.gmail.com>
	<20070618200329.GA13344@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20070618200329.GA13344@redhat.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

OK. I upgraded the system to 2.6.18. I can now load the speedstep-centrino
module and used the 'userspace' govener. In
/sys/devices/system/cpu/cpu0/cpufreq/ there are the following files:

affected_cpus     cpuinfo_max_freq  scaling_available_frequencies
scaling_cur_freq  scaling_governor  scaling_min_freq
cpuinfo_cur_freq  cpuinfo_min_freq  scaling_available_governors
scaling_driver    scaling_max_freq  scaling_setspeed

I have the following questions/problems:

1)  I looked into the value of each file.
     cpuinfo_max_freq : 2331000
     cpuinfo_min_freq: 1998000
     scaling_available_frequencies : 2331000 1998000 1998000 1998000 1998000
1998000

Why the available frequencies have multiple 1998000?

2) Since I'm using the userspace govener, I tried 'echo 1998000 >
scaling_setspeed' , then

scaling_setspeed : 1998000

However, cpuinfo_cur_freq is still 2331000. In contrast, /proc/cpuinfo shows
that the frequency is actually changed to 1998.000 MHz. Why are they
inconsistent?

3) Afterwards, I want to change the frequency back to 2331000 by calling
'echo 2331000 > scaling_setspeed'. However, the 'scaling_setspeed' is not
changed and the frequency is still 1998000. I tried this several times with
no luck. Is this a bug in the govener or in the centrino module?

Thanks a lot!!!

Lei

On 6/18/07, Dave Jones <davej@redhat.com> wrote:
>
> On Mon, Jun 18, 2007 at 11:02:29AM -0700, Lei Yang wrote:
> > Dear list,
> >
> > I'm a newbie on kernel cpu frequency scaling and I'm trying to get this
> work
> > on a Intel(R) Xeon(R) CPU workstation. The kernel version is 2.6.11.
>
> There have been literally hundreds of changes to the cpufreq drivers
> since 2.6.11.  I'll be surprised if anyone really remembers the quirks
> of the various drivers in a > two year old kernel.
>
> > So far, I've looked into
> > /lib/modules/2.6.11/kernel/arch/x86_64/kernel/cpufreq and found four
> kernel
> > modules there: acpi-cpufreq.ko  powernow-k8.ko  speedstep-centrino.ko
> > speedstep-nocona.ko . However, when I tried to install them using
> modprobe,
> > they all reported an error like "FATAL: Module acpi_cpufreq.ko not
> found".
> > So please give me a hint on the right procedure to follow.
>
> if your /proc/cpuinfo flags has 'est', then acpi-cpufreq is the way to
> go, unless your BIOS doesn't have correct ACPI tables, in which case
> speedstep-centrino is the answer.
> In current kernels, speedstep-centrino is deprecated in favour of
> acpi-cpufreq (and will disappear completely soon, possibly in .23)
>
> > Plus, I read from the kernel cpu-freq page on the supported hardware and
> > found that "Intel Pentium4/Xeon clock modulation (p4-clockmod)". Does
> this
> > mean that I need to install p4-clockmod for my workstation?
> Interestingly, I
> > also found on Dave Jones' page the following:
> >
> > - P4 clock modulation. Note, that this driver does NOT save power. It
> > inserts 'waits' between clock cycles, so workloads take longer to
> complete,
> > but generate less heat whilst doing so.
> >
> > I got confused, should I be using p4-clockmod or something else if I
> really
> > need to save power?
>
> As my note reads, you'll be producing less overall heat, but as your
> workload
> runs for a longer period, you're still using the same (possibly more)
> amount of power.
>
>         Dave
>
> --
> http://www.codemonkey.org.uk
>
