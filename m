From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo
 cpufreq-info param
Date: Tue, 5 Oct 2010 17:56:24 +0200
Message-ID: <20101005155624.GD20505@aftab>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
 <1286281394-14699-6-git-send-email-trenn@suse.de>
 <20101005144717.GA20505@aftab>
 <201010051718.07081.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201010051718.07081.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux@dominikbrodowski.net" <linux@dominikbrodowski.net>, Len Brown <len.brown@intel.com>

From: Thomas Renninger <trenn@suse.de>
Date: Tue, Oct 05, 2010 at 11:18:06AM -0400

> > yes. But we keep it consistent so that all cores show either off or on.
> I am still not sure whether cpufreq-info should access this through
> /sys/devices/system/cpu/cpu0/cpufreq/cpb
> or directly via msr.
> 
> Hm, if it's accessed via /sys/..cpufreq/cpb it should be enough to only touch
> CPU0, right? The rest is done by powernow-k8.
> 
> I don't like cpb much. It's the only file that has no info in it's name.
> There should have been a general interface:
> boost_mode
> supporting AMD and Intel...
> Possibly this can still be done and cpb can get marked deprecated
> (it shows up in 2.6.36 the first time? Which is not released yet?
> Theoretically this is not part of the ABI yet...).

No, cpb got introduced in .35.

And no, we don't want to remove it because we need to be able to toggle
CPB without the need for installing a special tool for that.

> > > to enable/disable turbo/boost mode.
> > > 
> > > For AMD there already is:
> > > /sys/devices/system/cpu/cpu0/cpufreq/cpb
> > > but this could all get handled in userspace and this recently introduced
> > > interface could get removed again.
> > 
> > I don't think it will be removed soon. Rather, if you use the /sysfs
> > interface you need kernel support for it and cpufrequtils might run on
> > older kernels which don't have the feature yet. So you want to do all
> > the detection/control in userspace, independent from the kernel version.
> Hmm, I'd prefer cleaner code (and only differing Intel/AMD once, either in
> the kernel or in userspace), but the "you need kernel support for it and
> cpufrequtils might run on older kernel" arguement is interesting.
> Not sure what is more important. Need to think a bit more about this.
> Comments are very welcome.

Ok, look at it this way: On the one hand, you need to be able to toggle
boosting without having to install a tool for that. On the other, it is
also important that cpufrequtils runs on as many kernels as possible. So
you want to implement the toggling in userspace too. And I don't see an
issue with code duplication because you already have most of it - you
only need to iterate over the num_online_cpus and toggle the bit on each
MSR. 10 additional lines tops.

<snip>

> > This should be done differently on AMD: we want to
> > iterate over all cores and check this bit and see
> > whether its setting is consistent. See how it is done in
> > <arch/x86/kernel/cpu/cpufreq/powernow-k8.c::powernowk8_init()> in the
> > kernel.
> Yep and this is why the whole code should either sit in userspace
> or in the kernel, duplicating the code would be stupid.
> IMO it should be in userspace, it's just for debugging/monitoring, etc.
> and if it's not too late already cpb sysfs file should better vanish...

see above.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
