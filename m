From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 12:10:00 +0000 (UTC)
Message-ID: <20130322121000.C818E11FB81@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #14 from Rafael J. Wysocki <rjw@sisk.pl>  2013-03-22 12:10:00 ---
[Adding Boris and Thomas to the CC.]

On Tuesday, March 19, 2013 02:20:06 PM Viresh Kumar wrote:
> Hi Guys,
> 
> We are talking here about a bug reported by Duncan here. His cpu/cpu*/cpufreq
> directory are getting corrupted with 3.9-rc3 and was working well with 3.8
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=55411
> 
> On his AMD bulldozer tri-cluster/6-core system he doesn't see affected
> and related
> cpus set correctly after off-lining 1-5 and bringing them back with:
> 
> for i in 1 2 3 4 5; do echo 0 > /sys/devices/system/cpu/cpu$i/online ; done
> for i in 1 2 3 4 5; do echo 1 > /sys/devices/system/cpu/cpu$i/online ; done
> 
> Before running above two, cpufreq-info gave:
> https://bugzilla.kernel.org/attachment.cgi?id=95701
> 
> And after running above it gave:
> https://bugzilla.kernel.org/attachment.cgi?id=95711
> 
> Clearly it got corrupted. Somehow cpu 3 showed up in related cpus field of
> cpu 5.
> 
> I suspect following patches behind this:
> 
> commit fcf8058296edbc3de43adf095824fc32b067b9f8
> Author: Viresh Kumar <viresh.kumar@linaro.org>
> Date:   Tue Jan 29 14:39:08 2013 +0000
> 
>     cpufreq: Simplify cpufreq_add_dev()
> 
>     Currently cpufreq_add_dev() firsts allocates policy, calls
>     driver->init() and then checks if this CPU is already managed or not.
>     And if it is already managed, its policy is freed.
> 
>     We can save all this if we somehow know that CPU is managed or not in
>     advance.  policy->related_cpus contains the list of all valid sibling
>     CPUs of policy->cpu. We can check this to see if the current CPU is
>     already managed.
> 
>     From now on, platforms don't really need to set related_cpus from
>     their init() routines, as the same work is done by core too.
> 
>     If a platform driver needs to set the related_cpus mask with some
>     additional CPUs, other than CPUs present in policy->cpus, they are
>     free to do it, though, as we don't override anything.
> 
>     [rjw: Changelog]
>     Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>     Tested-by: Shawn Guo <shawn.guo@linaro.org>
>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> 
> AND
> 
> commit 643ae6e81dd65b333a13259852405fc9f764ac76
> Author: Viresh Kumar <viresh.kumar@linaro.org>
> Date:   Sat Jan 12 05:14:38 2013 +0000
> 
>     cpufreq: Manage only online cpus
> 
>     cpufreq core doesn't manage offline cpus and if driver->init() has returned
>     mask including offline cpus, it may result in unwanted behavior by
> cpufreq core
>     or governors.
> 
>     We need to get only online cpus in this mask. There are two places
> to fix this
>     mask, cpufreq core and cpufreq driver. It makes sense to do this
> at common place
>     and hence is done in core.
> 
>     Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> 
> And this is the latest piece of documentation available:
> 
> SMP systems normally have same clock source for a group of cpus. For these the
> .init() would be called only once for the first online cpu. Here the .init()
> routine must initialize policy->cpus with mask of all possible cpus (Online +
> Offline) that share the clock. Then the core would copy this mask onto
> policy->related_cpus and will reset policy->cpus to carry only online cpus.
> 
> 
> I saw acpi-cpufreq drivers driver->init() code and found it is not yet
> aligned to this
> theory and probably that is causing these failures.
> 
> I don't have enough knowledge about this driver and how is it used for all x86
> systems and so want somebody else (who has some prior experience with it)
> to check how policy->cpus and policy->related_cpus must be set from
> driver->init().

OK, so what exactly do you need to now?

This has to be addressed before final 3.9 this way or another - and the sooner
the better.

Thanks,
Rafael

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
