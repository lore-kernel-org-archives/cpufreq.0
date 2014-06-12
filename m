From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 10:18:47 +0000
Message-ID: <bug-77201-12968-OlmyecOVcs@https.bugzilla.kernel.org/>
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

--- Comment #57 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Mauro from comment #56)

Hi Mauro, we finally know your name :)

> I have finished testing the following:
> 
> 6f1e4efd882 (cpufreq: Fix timer/workqueue corruption by protecting reading
> governor_enabled)
> 87ae97f10c0 (cpufreq: s3c24xx: Staticize local variable)
> result: both ok

So you tested your stuff on these two commits (i.e. no reverts hacks)?

> 1c0ca90207 (cpufreq: don't call cpufreq_update_policy() on CPU addition)
> d9a789c7a0 (cpufreq: Refactor cpufreq_set_policy())
> result: both bad
> 
> 
> 4e97b631f24 (cpufreq: Initialize governor for a new policy under
> policy->rwsem)
> 5a7e56a5d29 (cpufreq: Initialize policy before making it available for
> others to use)
> result: both bad

I don't know what we can make out of these tests :(..

@Srivatsa: ?

> I have also tested setting the governor to userspace, setting the cpu to the
> minimum speed, cpu offline/online, set an intermediate cpu speed and then
> maximum speed.
> 
> The machine becomes unresponsive only when trying to set the cpu to the
> maximum speed.

Great. I am more convinced now that it is not a cpufreq problem. It can still
be something about your driver though.

> If I understand correctly, the suggestion to try next is to keep the patch
> from 
> comment 32, keep the changes I've done to powernow-k8 (remove all
> pr_debug()), keep the extra compile flags in drivers/cpufreq/Makefile and
> also add plenty of pr_debug() to drivers/cpufreq/cpufreq.c.

Correct!! But wait, continue reading ...

> I assume it is here I should add more debug output since target_index() can
> be found only here.

I couldn't understand that, sorry :(

> If I'm correct, in which places would it make more sense
> to add debug output and which info should I try to output?

I wouldn't be interested in any data here in prints. Just want to know what's
the last thing executed before hang..

> I'm ok with doing this as long as it doesn't get too complicated, the reason
> is my programming skills are not that good and I have zero knowledge of the
> kernel's internals.

It doesn't look like, you have managed very well :)

Okay, lets simplify things a bit.. I have updated my branch again with all
changes you need.. Don't add any other change and just test it.

I have added this at many locations:

+       pr_info("%s: %d\n", __func__, __LINE__);

Will print function name and line number in file.

You *will* get lots of prints now for every frequency transition.. To control
these, enable only *userspace* governor from menuconfig and leave all other
governors disabled. That way there wouldn't be any transition happening..

Now, repeat your earlier test with userspace governor and see which
line/routine is the last one... 

You will come to know broadly about where you have reached.. Now to go to the
exact statement, remove all prints I have added in powernow-k8 and add them
only in your hotpath, and add more of them to the last set of functions
executed.

Lets see if we can get to the last instruction which crashed :)

Probably it will be the one changing freq/voltage..

-- 
You are receiving this mail because:
You are the assignee for the bug.
