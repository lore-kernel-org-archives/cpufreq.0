From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo cpufreq-info param
Date: Wed, 13 Oct 2010 23:17:18 +0200
Message-ID: <201010132317.19037.trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de> <201010051718.07081.trenn@suse.de> <20101005155624.GD20505@aftab>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101005155624.GD20505@aftab>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Borislav Petkov <bp@amd64.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux@dominikbrodowski.net" <linux@dominikbrodowski.net>, Len Brown <len.brown@intel.com>

Hi,

and sorry for the late response...

On Tuesday 05 October 2010 05:56:24 pm Borislav Petkov wrote:
> From: Thomas Renninger <trenn@suse.de>
> Date: Tue, Oct 05, 2010 at 11:18:06AM -0400
> 
> > > yes. But we keep it consistent so that all cores show either off or on.
> > I am still not sure whether cpufreq-info should access this through
> > /sys/devices/system/cpu/cpu0/cpufreq/cpb
> > or directly via msr.
> > 
> > Hm, if it's accessed via /sys/..cpufreq/cpb it should be enough to only touch
> > CPU0, right? The rest is done by powernow-k8.
> > 
> > I don't like cpb much. It's the only file that has no info in it's name.
> > There should have been a general interface:
> > boost_mode
> > supporting AMD and Intel...
> > Possibly this can still be done and cpb can get marked deprecated
> > (it shows up in 2.6.36 the first time? Which is not released yet?
> > Theoretically this is not part of the ABI yet...).
> 
> No, cpb got introduced in .35.
> 
> And no, we don't want to remove it because we need to be able to toggle
> CPB without the need for installing a special tool for that.
Maybe not removing, but having a sysfs file for each cpu even you can
only enable/disable boost for the whole machine looks wrong.
Ok, there may be future machines where you could disable it per CPU socket?,
but what for...
Also the dependency to powernow-k8/cpufreq looks wrong.
After looking closer at this, better would have been:
/sys/devices/system/cpu/boost_mode
if capable. I also didn't think about it, even I looked at the cpb
patch(es) rather close.
Anyway, this is not cpupowerutils most important feature...

> > > > to enable/disable turbo/boost mode.
> > > > 
> > > > For AMD there already is:
> > > > /sys/devices/system/cpu/cpu0/cpufreq/cpb
> > > > but this could all get handled in userspace and this recently introduced
> > > > interface could get removed again.
> > > 
> > > I don't think it will be removed soon. Rather, if you use the /sysfs
> > > interface you need kernel support for it and cpufrequtils might run on
> > > older kernels which don't have the feature yet. So you want to do all
> > > the detection/control in userspace, independent from the kernel version.
> > Hmm, I'd prefer cleaner code (and only differing Intel/AMD once, either in
> > the kernel or in userspace), but the "you need kernel support for it and
> > cpufrequtils might run on older kernel" arguement is interesting.
> > Not sure what is more important. Need to think a bit more about this.
> > Comments are very welcome.
> 
> Ok, look at it this way: On the one hand, you need to be able to toggle
> boosting without having to install a tool for that. On the other, it is
> also important that cpufrequtils runs on as many kernels as possible. So
> you want to implement the toggling in userspace too. And I don't see an
> issue with code duplication because you already have most of it - you
> only need to iterate over the num_online_cpus and toggle the bit on each
> MSR. 10 additional lines tops.
I thought a bit about this and I do not see a way to implement this in
userspace. The reason is CPU onlining/offlining.
If userspace could lock CPUs to not get offlined, then set cpb enable
or disable bits on all cores or break out if not all CPUs are online is
what you need.
But you cannot do: "lock CPUs to not get offlined" in userspace and if
you could you would certainly run into quite some other issues.

So for now that param may get implemented through:
/sys/devices/system/cpu/cpu0/cpufreq/cpb
at some time, but there is no urgent need.
I better test a bit more the cpuidle stuff, possibly start writing on a
manpage, announce the latest changes, etc., etc..

Thanks,

       Thomas
