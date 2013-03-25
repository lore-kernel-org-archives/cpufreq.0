From: Duncan <1i5t5.duncan@cox.net>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Mon, 25 Mar 2013 04:15:41 -0700
Message-ID: <20130325041541.4574f51a@ws>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<1694228.Eg36y3ID9W@skinner.arch.suse.de>
	<2581491.irn18K9zaF@hammer82.arch.suse.de>
	<CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
	<CAKohpoksBOpW59YETR-SMWJSGsJSWKoXktJoVM38SietN9p3Ug@mail.gmail.com>
	<20130324044927.6a2b1588@ws>
	<CAKohpokknnU7jn0UuNsoRoho5MSmzT-Ub3sVwR030uJqMjSH7g@mail.gmail.com>
	<CAKohpomsrafpNii9zqAjqe5kqEGOEdP5mDpSSjTswrY1YNfhBw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpomsrafpNii9zqAjqe5kqEGOEdP5mDpSSjTswrY1YNfhBw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: bugzilla-daemon@bugzilla.kernel.org, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Renninger <trenn@suse.de>, Andre Przywara <andre.przywara@linaro.org>, djwong@us.ibm.com

On Sun, 24 Mar 2013 17:53:41 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 24 March 2013 17:46, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > Fixing Duncan's issues shouldn't be a very big deal now as i was
> > thinking too much about what was broken without my patches too. And
> > now that part is pretty clear.
> 
> Hi Duncan,
> 
> Try attached patch and this should take back your system to where it
> was.
> 
> NOTE: With this patch your related_cpus wouldn't show any groups and
> related cpus must be same as affected cpus. All cpu*/cpufreq must be
> directories now and no symlinks.

FWIW, with this patch, pre-s2ram and post-resume are indeed consistent,
but it's not back to where it was.

With this patch, each core is a cpufreq law unto itself.  Maybe that's
what you meant with the note, maybe not (I know the mapping of sysfs
files to cpufreq-info output was stated up-thread, but I lost track,
and how affected vs related maps to hardware vs software coordinated
and what it all actually means other than what I'm seeing isn't ideal,
is apparently a bit more than I'm able to keep in my head ATM), but it's
what I get. The relevant bits of cpufreq-info output:

analyzing CPU 0:
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
analyzing CPU 1:
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
analyzing CPU 2:
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
analyzing CPU 3:
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
analyzing CPU 4:
  CPUs which run at the same hardware frequency: 4
  CPUs which need to have their frequency coordinated by software: 4
analyzing CPU 5:
  CPUs which run at the same hardware frequency: 5
  CPUs which need to have their frequency coordinated by software: 5

But at least it's consistent:  The same results both before and after a
suspend/resume cycle.

And given that 3.8 wasn't ideal either, maybe that's good enough for
this cycle, and a real fix will have to wait until the next commit
window and stable-tree.  That'd give us more leeway to fix it right, as
well as a full cycle for testing anything else the "correct" fix might
dredge up.

-- 
Duncan - No HTML messages please, as they are filtered as spam.
"Every nonfree program has a lord, a master --
and if you use the program, he is your master."  Richard Stallman
