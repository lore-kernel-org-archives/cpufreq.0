From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Sun, 24 Mar 2013 09:10:54 +0000 (UTC)
Message-ID: <20130324091054.E4D5D11FB35@bugzilla.kernel.org>
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





--- Comment #30 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-24 09:10:54 ---
On 24 March 2013 14:35, Thomas Renninger <trenn@suse.de> wrote:
> I take that back.
> CPU hot-add (even if CPU is not present at boot time) works.
> I looked at C-states for that some time ago and it should only work if
> the hot-add event came in via ACPI events for CPUs which were not
> initialized at boot time. Better would be to initialize the first time it
> gets switched online.

I removed it from my TODO list, thanks :)

> Anyway, making such stuff (cpufreq/cpuidle/...) more robust,
> is certainly a good idea.

Yes, that was the basic intent of my earlier patches that went into 3.9.
It was all about simplifying it and making it robust.

> And powernow-k8 does not exist anymore..., fortunately I didn't have to
> look at this stuff for some time.

Sure? Driver is still present in mainline.

BTW, i have given an initial fix for acpi-cpufreq (which should work)
and waiting
for Duncan to reply back. All other drivers don't set affected/related
cpus directly,
so they should be alright.

--
viresh

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
