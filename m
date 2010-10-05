From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo cpufreq-info param
Date: Tue, 5 Oct 2010 17:18:06 +0200
Message-ID: <201010051718.07081.trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de> <1286281394-14699-6-git-send-email-trenn@suse.de> <20101005144717.GA20505@aftab>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101005144717.GA20505@aftab>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Borislav Petkov <bp@amd64.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux@dominikbrodowski.net" <linux@dominikbrodowski.net>, Len Brown <len.brown@intel.com>

On Tuesday 05 October 2010 16:47:17 Borislav Petkov wrote:
> From: Thomas Renninger <trenn@suse.de>
> Date: Tue, Oct 05, 2010 at 08:23:14AM -0400
> 
> > Prints out this by default (also works with --cpu X param):
> >   Analyzing Boost Capabilities on CPU 0:
> >   Supported: yes
> >   Active: yes
> 
> I think it would be simpler if you dump the boosting information in
> cpufreq-info, i.e. without an explicit --boost option or whatever. You
> can then use the "--boost" option to control the boosting like this:
> 
> cpufreq-set --boost (on|off) - toggles boosting
Yep, I like to add this next.

> > With activation one has to be careful...
> > On AMD, it's enough if any of the CPUs shows "Active: no" and boost mode
> > is not active (cmp with powernow-k8 kernel code).
> 
> yes. But we keep it consistent so that all cores show either off or on.
I am still not sure whether cpufreq-info should access this through
/sys/devices/system/cpu/cpu0/cpufreq/cpb
or directly via msr.

Hm, if it's accessed via /sys/..cpufreq/cpb it should be enough to only touch
CPU0, right? The rest is done by powernow-k8.

I don't like cpb much. It's the only file that has no info in it's name.
There should have been a general interface:
boost_mode
supporting AMD and Intel...
Possibly this can still be done and cpb can get marked deprecated
(it shows up in 2.6.36 the first time? Which is not released yet?
Theoretically this is not part of the ABI yet...).

> > to enable/disable turbo/boost mode.
> > 
> > For AMD there already is:
> > /sys/devices/system/cpu/cpu0/cpufreq/cpb
> > but this could all get handled in userspace and this recently introduced
> > interface could get removed again.
> 
> I don't think it will be removed soon. Rather, if you use the /sysfs
> interface you need kernel support for it and cpufrequtils might run on
> older kernels which don't have the feature yet. So you want to do all
> the detection/control in userspace, independent from the kernel version.
Hmm, I'd prefer cleaner code (and only differing Intel/AMD once, either in
the kernel or in userspace), but the "you need kernel support for it and
cpufrequtils might run on older kernel" arguement is interesting.
Not sure what is more important. Need to think a bit more about this.
Comments are very welcome.
 
> > Then enabling/disabling could all be done on CPU 0 which cannot be taken
> > offline.
> >   -> To be discussed.
> 
> You need to enable/disable the boosting on AMD by toggling bit 25 in
> MSR_K7_HWCR on all cpus.
Ok.
> 
> > Potentially dangerous is if cores get offlined while boost mode got
> > disbled, then the userspace tool would not be able to enable it again.
> > But as this stuff is meant for debugging and performance measuring
> > only, it should be enough to document this a bit in a manpage...
> 
> You can issue a warning whenever you detect that a subset of the cores
> has been offlined. Then the tool should fail changing the boosting
> state, IMHO.
Good idea.

...
> > +	} else if (cpu_info.vendor == X86_VENDOR_AMD) {
> > +		if (cpu_info.ext_cpuid_level < 0x80000007)
> > +			return 0;
> > +		if ((cpuid_edx(0x80000007) >> 9) & 0x1)
> > +			*support = 1;
> > +		else
> > +			return 0;
> 
> wrap this in amd_has_boost_support()?
Yep, after splitting out cpuid.c, this could get put into:
cpuid_amd_has_boost_support.
...
> > +int msr_amd_boost_is_active(unsigned int cpu)
> > +{
> > +	uint64_t k7_hwcr;
> > +	int ret;
> > +
> > +	ret = read_msr(cpu, MSR_K7_HWCR, &k7_hwcr);
> > +	if (ret)
> > +		return ret;
> > +	return !((k7_hwcr >> 25) & 0x1);
> > +}
> 
> This should be done differently on AMD: we want to
> iterate over all cores and check this bit and see
> whether its setting is consistent. See how it is done in
> <arch/x86/kernel/cpu/cpufreq/powernow-k8.c::powernowk8_init()> in the
> kernel.
Yep and this is why the whole code should either sit in userspace
or in the kernel, duplicating the code would be stupid.
IMO it should be in userspace, it's just for debugging/monitoring, etc.
and if it's not too late already cpb sysfs file should better vanish...

      Thomas
