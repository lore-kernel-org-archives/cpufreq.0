From: Andreas Herrmann <andreas.herrmann3@amd.com>
Subject: Re: Disable cpufreq on modern X86 processors
Date: Tue, 24 Jul 2012 15:22:08 +0200
Message-ID: <20120724132208.GB4609@alberich>
References: <201207241515.15324.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201207241515.15324.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org, arjan@linux.intel.com, Len Brown <lenb@kernel.org>, Borislav Petkov <borislav.petkov@amd.com>, Michael Galbraith <mgalbraith@suse.de>, Andre Przywara <andre.przywara@amd.com>

CC-ing Andre

On Tue, Jul 24, 2012 at 03:15:14PM +0200, Thomas Renninger wrote:
> Hi,
> 
> I recently got pointed to performance losses measured
> with and without cpufreq enabled when people worked on
> scheduler tunables/improvements.
> 
> Depending on whether processes are bound to cores, tunables
> inside the cpufreq subsystem, etc. there can be rather big
> differences.
> 
> While there have been improvements (for example do not poll
> that often if constantly running at highest frequency and
> others), dynamic cpufreq adjusting as it currently is
> implemented via ondemand/conservative governors always
> will cost performance.
> 
> Arjan mentioned quite some time ago, that for modern X86
> processors it does not make much sense to control the
> frequency of the CPU via OS, because idle states are
> much more efficient and should get entered asap.
> 
> Especially on bigger X86 systems with dozens or even hundreds
> of cores, cpufreq polling sounds like a bad idea.
> Especially if the CPUs do achieve the same or even
> better performance/power results via entering C-states quickly.
> 
> I would like to come up with a init_default_governor()
> or similar function which choses the performance governor
> for such CPUs.
> Hm, maybe it could get a driver callback, then this one could
> be picked up by acpi-cpufreq (and powernow-k8 if applicable)
> and those drivers could choose the right governor for the
> platform/cpu.
> 
> Ideally identifying the CPUs where performance governor should get
> used is a one liner checking for a cpu flag.
> But this might not get that easy? CPU family/model would need
> maintenance if there is no cpu flag/feature to test for.
> 
> Just some ideas..., if it's doable with some lines of code without
> the need of maintaining/adding new cpu families, I'd like to have
> a better default behavior.
> 
> One main problem I am facing is: Measuring power consumption
> in different workloads.
> 
> I can measure the power consumption in idle (deeper sleep
> states entered) when CPU frequency is set to lowest and highest
> and compare. If both are the same, the CPU is a good candidate
> to not do OS controlled CPU frequency scaling.
> 
> What do you think?
> 
> Thanks,
> 
>    Thomas
> 

