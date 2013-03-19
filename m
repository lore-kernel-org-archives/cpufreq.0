From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Tue, 19 Mar 2013 07:49:53 +0000 (UTC)
Message-ID: <20130319074953.B88F211F94A@bugzilla.kernel.org>
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
You are the assignee for the bug.
