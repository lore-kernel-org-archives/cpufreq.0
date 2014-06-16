From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 16 Jun 2014 05:43:01 +0000
Message-ID: <bug-77201-12968-bV5ODQw31A@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #86 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Mauro from comment #82)
> I have managed to narrow this down to a function, specifically:
> cpufreq_notify_transition(policy, &freqs, CPUFREQ_POSTCHANGE);

I guessed this yesterday, but thought this might not be the problem as there
aren't too many drivers notified for these transitions. And those rarely get
modified.

As Rafael also mentioned, the problem is obviously with some of the recipients
of these notifiers failing for the POSTCHANGE notification.

In case you don't know how this works, this is how:

Some kernel drivers can register for notifiers, so that before and after every
frequency tranistions notifiers would be called and those drivers can act
accordingly. One of them is broken here.

List of all files which are registering for these notifiers.

arch/arm/kernel/smp.c
arch/arm/kernel/smp_twd.c
arch/arm/mach-pxa/viper.c
arch/arm/mach-s3c24xx/mach-osiris-dvs.c
arch/blackfin/mach-common/dpmc.c
arch/cris/arch-v32/kernel/time.c
arch/powerpc/oprofile/op_model_cell.c
arch/sparc/kernel/time_64.c
arch/x86/kernel/tsc.c
arch/x86/kvm/x86.c
drivers/acpi/processor_perflib.c
drivers/acpi/processor_thermal.c
drivers/cpufreq/cpufreq.c
drivers/cpufreq/cpufreq_governor.c
drivers/cpufreq/cpufreq_stats.c
drivers/cpufreq/cris-artpec3-cpufreq.c
drivers/cpufreq/cris-etraxfs-cpufreq.c
drivers/cpufreq/loongson2_cpufreq.c
drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
drivers/gpu/drm/tilcdc/tilcdc_drv.c
drivers/i2c/busses/i2c-davinci.c
drivers/i2c/busses/i2c-s3c2410.c
drivers/macintosh/windfarm_cpufreq_clamp.c
drivers/mmc/host/davinci_mmc.c
drivers/mmc/host/s3cmci.c
drivers/mtd/nand/s3c2410.c
drivers/pcmcia/soc_common.c
drivers/staging/tidspbridge/rmgr/drv_interface.c
drivers/thermal/cpu_cooling.c
drivers/tty/serial/samsung.c
drivers/tty/serial/sh-sci.c
drivers/video/da8xx-fb.c
drivers/video/nuc900fb.c
drivers/video/pxafb.c
drivers/video/s3c2410fb.c
drivers/video/sa1100fb.c
drivers/watchdog/s3c2410_wdt.c
include/linux/cpufreq.h


Those that look relevant to me for your configuration:

arch/x86/kernel/tsc.c
arch/x86/kvm/x86.c
drivers/acpi/processor_perflib.c
drivers/acpi/processor_thermal.c

Only first two had significant changes and there are some big changes in 3.14
around these. I am not good at that code and we need to get few more people
into this discussions. Though Rafael/Srivatsa might have seen these files..

But before that we must narrow down on this.. Believe me, we are very very
close :)

I have created two more branches: powernow-k8-post1 and powernow-k8-post2
(Compile tested only for x86_64_defconfig) ..

All debug messages/stop_transition/etc are dropped as we don't need them
anymore and so drop them from your script as well..

powernow-k8-post1 has reverted all changes between 3.13.8 and 3.14 for
arch/x86/kernel/tsc.c file and powernow-k8-post2 have done it for
arch/x86/kvm/x86.c..

Only one of these two will work for you. Check which one, I would put my 10
cents on *-post1 branch :)

Once, any one of the branches work for you, try doing a git bisect for that
branch and 3.14 (Only few revert patches actually, should be easy).. 

And you can tell me which revert patch has *fixed* the issue for you and that's
the culprit.

Then we can follow on LKML, will put you in CC, on the original commit
threads..

Thanks for your dedication towards fixing this up, it was really a nightmare to
get down to this :)

--
viresh

-- 
You are receiving this mail because:
You are the assignee for the bug.
