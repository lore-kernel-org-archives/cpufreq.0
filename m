From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 13:22:06 +0000
Message-ID: <bug-77201-12968-CWvAMoLOKe@https.bugzilla.kernel.org/>
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

--- Comment #58 from Mauro <registosites@hotmail.com> ---

> > 6f1e4efd882 (cpufreq: Fix timer/workqueue corruption by protecting reading
> > governor_enabled)
> > 87ae97f10c0 (cpufreq: s3c24xx: Staticize local variable)
> > result: both ok
> 
> So you tested your stuff on these two commits (i.e. no reverts hacks)?


Yes, I have tested with no revert hacks, and as suggested I have tested the
commit preceding the suspect commit and the suspect commit.


> Okay, lets simplify things a bit.. I have updated my branch again with all
> changes you need.. Don't add any other change and just test it.
> 
> I have added this at many locations:
> 
> +       pr_info("%s: %d\n", __func__, __LINE__);
> 
> Will print function name and line number in file.
> 
> You *will* get lots of prints now for every frequency transition.. To
> control these, enable only *userspace* governor from menuconfig and leave
> all other governors disabled. That way there wouldn't be any transition
> happening..
> 
> Now, repeat your earlier test with userspace governor and see which
> line/routine is the last one... 
> 
> You will come to know broadly about where you have reached.. Now to go to
> the exact statement, remove all prints I have added in powernow-k8 and add
> them only in your hotpath, and add more of them to the last set of functions
> executed.
> 
> Lets see if we can get to the last instruction which crashed :)
> 
> Probably it will be the one changing freq/voltage..

Not much luck with this approach I'm afraid. I have compiled your updated
branch with no reverts and changed the config to include only the userspace
governor.

Then proceeded to test as before:
cat /proc/kmsg &
echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
echo 0 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
echo 2200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed

When trying to change the frequency to 2.2GHz the machine becomes unresponsive
and there is no output :(
I have noticed something that may or may not be important, it doesn't matter if
I do
800M - cpu offline/online - 1.8G - 2.2G
or
800M - cpu offline/online - 2.2G - 1.8G

The machine always becomes unresponsive when trying to do the second frequency
change after cpu offline/online. I have pictures of the process, I can attach
them if you think they are important, but like I said when the machine hangs
there is zero output :(

-- 
You are receiving this mail because:
You are the assignee for the bug.
