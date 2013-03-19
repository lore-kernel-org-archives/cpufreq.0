From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Tue, 19 Mar 2013 14:20:06 +0530
Message-ID: <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<20130319074953.C200811FB80@bugzilla.kernel.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130319074953.C200811FB80@bugzilla.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, 1i5t5.duncan@cox.net
Cc: cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

Hi Guys,

We are talking here about a bug reported by Duncan here. His cpu/cpu*/cpufreq
directory are getting corrupted with 3.9-rc3 and was working well with 3.8

https://bugzilla.kernel.org/show_bug.cgi?id=55411

On his AMD bulldozer tri-cluster/6-core system he doesn't see affected
and related
cpus set correctly after off-lining 1-5 and bringing them back with:

for i in 1 2 3 4 5; do echo 0 > /sys/devices/system/cpu/cpu$i/online ; done
for i in 1 2 3 4 5; do echo 1 > /sys/devices/system/cpu/cpu$i/online ; done

Before running above two, cpufreq-info gave:
https://bugzilla.kernel.org/attachment.cgi?id=95701

And after running above it gave:
https://bugzilla.kernel.org/attachment.cgi?id=95711

Clearly it got corrupted. Somehow cpu 3 showed up in related cpus field of
cpu 5.

I suspect following patches behind this:

commit fcf8058296edbc3de43adf095824fc32b067b9f8
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Tue Jan 29 14:39:08 2013 +0000

    cpufreq: Simplify cpufreq_add_dev()

    Currently cpufreq_add_dev() firsts allocates policy, calls
    driver->init() and then checks if this CPU is already managed or not.
    And if it is already managed, its policy is freed.

    We can save all this if we somehow know that CPU is managed or not in
    advance.  policy->related_cpus contains the list of all valid sibling
    CPUs of policy->cpu. We can check this to see if the current CPU is
    already managed.

    From now on, platforms don't really need to set related_cpus from
    their init() routines, as the same work is done by core too.

    If a platform driver needs to set the related_cpus mask with some
    additional CPUs, other than CPUs present in policy->cpus, they are
    free to do it, though, as we don't override anything.

    [rjw: Changelog]
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Tested-by: Shawn Guo <shawn.guo@linaro.org>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>


AND

commit 643ae6e81dd65b333a13259852405fc9f764ac76
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Sat Jan 12 05:14:38 2013 +0000

    cpufreq: Manage only online cpus

    cpufreq core doesn't manage offline cpus and if driver->init() has returned
    mask including offline cpus, it may result in unwanted behavior by
cpufreq core
    or governors.

    We need to get only online cpus in this mask. There are two places
to fix this
    mask, cpufreq core and cpufreq driver. It makes sense to do this
at common place
    and hence is done in core.

    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>


And this is the latest piece of documentation available:

SMP systems normally have same clock source for a group of cpus. For these the
.init() would be called only once for the first online cpu. Here the .init()
routine must initialize policy->cpus with mask of all possible cpus (Online +
Offline) that share the clock. Then the core would copy this mask onto
policy->related_cpus and will reset policy->cpus to carry only online cpus.


I saw acpi-cpufreq drivers driver->init() code and found it is not yet
aligned to this
theory and probably that is causing these failures.

I don't have enough knowledge about this driver and how is it used for all x86
systems and so want somebody else (who has some prior experience with it)
to check how policy->cpus and policy->related_cpus must be set from
driver->init().

--
viresh

---------- Forwarded message ----------
From:  <bugzilla-daemon@bugzilla.kernel.org>
Date: 19 March 2013 13:19
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
after s2ram
To: viresh.kumar@linaro.org


https://bugzilla.kernel.org/show_bug.cgi?id=55411

--- Comment #9 from Duncan <1i5t5.duncan@cox.net>  2013-03-19 07:49:53 ---
(In reply to comment #8)
> (In reply to comment #0)
>> After a s2ram/resume cycle (now bad):
>>
>> /sys/devices/system/cpu/cpu0/cpufreq/
>> /sys/devices/system/cpu/cpu1/cpufreq -> ../cpu0/cpufreq/
>> /sys/devices/system/cpu/cpu3/cpufreq/
>> /sys/devices/system/cpu/cpu5/cpufreq/
>
> Can you try this rather than s2r:
>
> for i in 1 2 3 4 5; do echo 0 > /sys/devices/system/cpu/cpu$i/online ; done
> for i in 1 2 3 4 5; do echo 1 > /sys/devices/system/cpu/cpu$i/online ; done
>
> and check the status if things are still corrupted for you?

> Above doesn't corrupt anything for me Atleast.

That's a nice easy test; no rebuild and reboot needed. =:^)

Tho I had to change the > to >| as I have bash noclobber set and the files
obviously already exist...

Uncorrupted before the test, corrupted after.  So just cycling the cpus off and
then back online *DOES* corrupt cpufreq, thus a much simpler reproducer! =:^)
Exact same ls results as the above.

> And my system doesn't have S2R support for now.

My old system didn't support s2ram reliably; it would work occasionally but
mostly it didn't.  But s2disk was workable for awhile, until the fact that I
was running mdraid and the disks didn't always return in the same sdX slots due
to hardware wakeup issues complicated things, so eventually I didn't use that
much either.  The new system's great with s2ram, sans this bug of course;
s2disk didn't work at all at first, but last time I tried it /almost/ worked so
there has been improvement.  But I don't like to take unnecessary chances with
filesystem log replay and thankfully wall power's good enough around here that
I can s2ram for a day and come back and wiggle the mouse and all's fine (with a
couple pre-suspend syncs thrown into my script just in case), so I tend to use
it a LOT, even more than I'd use s2disk due to the speed. =:^)

But I'd love to have s2both working reliably; for all I know it's actually
working now; it was pretty close.  But I prefer not to test the reiserfs log
replay (even with pre-suspend syncs I worry, tho as I said reiserfs has
actually been very good to me even thru faulty ram, a power supply blowing up
on me, a mobo dying, etc, since 2.6.16 or whenever it was that it got ordered
journaling by default) when it doesn't work, so knowing s2disk didn't work well
when I tested it and with s2ram working SO well, I don't tend to test
s2disk/s2both too often.


Meanwhile, thanks for the cpuinfo_cur_freq explanation.  If that actually
real-time touches the hardware to get the data as you say, that does explain
the root privs.  Maybe that bit of extra info could be added to the
documentation?  I could propose some new wording and open a new bug on
cpu-freq/user-guide.txt for it if appropriate.

--
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
