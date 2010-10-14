From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo
 cpufreq-info param
Date: Thu, 14 Oct 2010 06:44:10 +0200
Message-ID: <20101014044410.GC29342@aftab>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
 <201010051718.07081.trenn@suse.de>
 <20101005155624.GD20505@aftab>
 <201010132317.19037.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201010132317.19037.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux@dominikbrodowski.net" <linux@dominikbrodowski.net>, Len Brown <len.brown@intel.com>, Andreas Herrmann <andreas.herrmann3@amd.com>

From: Thomas Renninger <trenn@suse.de>
Date: Wed, Oct 13, 2010 at 05:17:18PM -0400

(adding Andreas, I'm sure he'd like to pitch in here too)

Hi Thomas,

> > > Possibly this can still be done and cpb can get marked deprecated
> > > (it shows up in 2.6.36 the first time? Which is not released yet?
> > > Theoretically this is not part of the ABI yet...).
> > 
> > No, cpb got introduced in .35.
> > 
> > And no, we don't want to remove it because we need to be able to toggle
> > CPB without the need for installing a special tool for that.
> Maybe not removing, but having a sysfs file for each cpu even you can
> only enable/disable boost for the whole machine looks wrong.
> Ok, there may be future machines where you could disable it per CPU socket?,
> but what for...

I see your point, having this file per-cpu is redundant since we do the
boosting per system. And yes, I really don't have a sensible usecase
where you might want to have a finer granularity with boost control,
i.e. disable single cores only.

> Also the dependency to powernow-k8/cpufreq looks wrong.
> After looking closer at this, better would have been:
> /sys/devices/system/cpu/boost_mode
> if capable.

Are you saying the boosting code should go somewhere else? We put it in
powernow-k8 since it has mostly to do with Pstates and all...


> > > Hmm, I'd prefer cleaner code (and only differing Intel/AMD once, either in
> > > the kernel or in userspace), but the "you need kernel support for it and
> > > cpufrequtils might run on older kernel" arguement is interesting.
> > > Not sure what is more important. Need to think a bit more about this.
> > > Comments are very welcome.
> > 
> > Ok, look at it this way: On the one hand, you need to be able to toggle
> > boosting without having to install a tool for that. On the other, it is
> > also important that cpufrequtils runs on as many kernels as possible. So
> > you want to implement the toggling in userspace too. And I don't see an
> > issue with code duplication because you already have most of it - you
> > only need to iterate over the num_online_cpus and toggle the bit on each
> > MSR. 10 additional lines tops.
> I thought a bit about this and I do not see a way to implement this in
> userspace. The reason is CPU onlining/offlining.
> If userspace could lock CPUs to not get offlined, then set cpb enable
> or disable bits on all cores or break out if not all CPUs are online is
> what you need.
> But you cannot do: "lock CPUs to not get offlined" in userspace and if
> you could you would certainly run into quite some other issues.

I think you're referring to the maybe-possible case when cores
disappear from under you while you're toggling boosting, right? Hmm,
we could maybe do get/put_cpu() in <arch/x86/kernel/msr.c> to have it
hotplug-safe to a certain degree but there might be cases where this
might not fly...

> So for now that param may get implemented through:
> /sys/devices/system/cpu/cpu0/cpufreq/cpb
> at some time, but there is no urgent need.

On the other hand, having a single system-wide sysfs knob is simpler for
userspace. Hmm, let me dream a bit more on this. However, if we do it
this way, cpufreq will depend on a kernel version. Implementing boosting
in it would be trivial, though :)

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
