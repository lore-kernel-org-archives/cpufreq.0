From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Sun, 24 Mar 2013 11:49:31 +0000 (UTC)
Message-ID: <20130324114931.F01C911FB35@bugzilla.kernel.org>
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





--- Comment #34 from Duncan <1i5t5.duncan@cox.net>  2013-03-24 11:49:30 ---
On Sun, 24 Mar 2013 15:32:39 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> Hi Duncan,
> 
> Please reply to this mail rather than using bugzilla as all others
> might not be following bugzilla rerport.

Thanks.  I'm used to it being the other way 'round.

> >> [PATCH] cpufreq: acpi-cpufreq: Set policy->cpus correctly
> >> from .init()
> >
> > You appear to be on the right path as all the dirs and symlinks are
> > there now, but it looks like you'll need a v2 as the order/pairing
> > is now very strange, both as booted and after a s2ram/resume (which
> > changes the order but it's still strange):

> Hmm.. Can you try one thing? Run 3.8 over your machine and give
> output of cpufreq-info and ls -ld after boot and resume..
> 
> I would like to see what's the original behavior.

Good idea! =:^)  It now appears that your bug simply cascaded on a
previously unreported bug in earlier kernels.

The 3.8 ls -dl isn't too interesting as they were all dirs not symlinks
then, and if they hadn't stuck around after a suspend/resume I'd have
definitely noticed and reported the bug back then, but it's still
useful to confirm.

The 3.8 pre-suspend and post resume ls -dl are identical -- no missing
dirs (and no symlinks):

/sys/devices/system/cpu/cpu0/cpufreq/
/sys/devices/system/cpu/cpu1/cpufreq/
/sys/devices/system/cpu/cpu2/cpufreq/
/sys/devices/system/cpu/cpu3/cpufreq/
/sys/devices/system/cpu/cpu4/cpufreq/
/sys/devices/system/cpu/cpu5/cpufreq/

The interesting results are the 3.8 cpufreq-info.  I'll attach the full
output, but here's the interesting bit:

3.8 pre-suspend cpufreq-info excerpts (nicely paired, as are the
pre-patch pre-suspend results for 3.9-rc):

analyzing CPU 0:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0
analyzing CPU 1:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 1
analyzing CPU 2:
  CPUs which run at the same hardware frequency: 2 3
  CPUs which need to have their frequency coordinated by software: 2
analyzing CPU 3:
  CPUs which run at the same hardware frequency: 2 3
  CPUs which need to have their frequency coordinated by software: 3
analyzing CPU 4:
  CPUs which run at the same hardware frequency: 4 5
  CPUs which need to have their frequency coordinated by software: 4
analyzing CPU 5:
  CPUs which run at the same hardware frequency: 4 5
  CPUs which need to have their frequency coordinated by software: 5

3.8 post-resume (screwed up pairing, so that bit's not a 3.9 thing, I
just noticed it in 3.9 due to the now missing symlinks/dirs):

analyzing CPU 0:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0
analyzing CPU 1:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 1
analyzing CPU 2:
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
analyzing CPU 3:
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
analyzing CPU 4:
  CPUs which run at the same hardware frequency: 2 4
  CPUs which need to have their frequency coordinated by software: 4
analyzing CPU 5:
  CPUs which run at the same hardware frequency: 3 5
  CPUs which need to have their frequency coordinated by software: 5

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
