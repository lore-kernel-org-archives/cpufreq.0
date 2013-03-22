From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 14:10:46 +0000 (UTC)
Message-ID: <20130322141046.A32F011FB81@bugzilla.kernel.org>
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





--- Comment #25 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-22 14:10:46 ---
On 22 March 2013 19:34, Thomas Renninger <trenn@suse.de> wrote:
> I am pretty sure cpuidle states won't initialize and in best case you never
> get them working on the offlined cpus.
> Local APICs won't be set up, ...
>
> Such a parameter will never exist for x86.

I will see if i can find what i was referring to here.

> They were hugely simplified and things are not working anymore and you
> do not know why...

I know why, but don't know (for now) how to fix it for acpi-cpufreq.

> And powernow-k8 driver is broken.
> The others are not tested that often, I expect they broke as well, right?

acpi-cpufreq is broken and so all others who are using it. Sorry for asking
the stupid question now but what's the hierarchy of cpufreq drivers for intel
(I will try to go through it now), some drivers use acpi-cpufreq driver?

> Sorry, I cannot look into this due to lack of time, but I remember that
> there were reasons why cpufreq_add_dev() was complicated.
> Or that it's really easy to mess it up and it's not easy to fix it again.

Its not cpufreq_add_dev() that is broken but some changes that were part
of the same patch, i.e. part that tried to sort out affected and related cpus.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
