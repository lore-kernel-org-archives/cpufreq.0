From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 29 Mar 2013 14:14:37 +0000 (UTC)
Message-ID: <20130329141437.A91BF11FB3C@bugzilla.kernel.org>
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





--- Comment #40 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-29 14:14:36 ---
On 25 March 2013 16:53, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> There is no other user of relatead_cpus earlier in cpufreq core and that's why
> i wonder why it was added earlier.
>
> But a grep of relatead_cpus for 3.8 showed some interesting users in:
> tools/power/cpupower/
>
> I will try to check what they are doing with it, but for the kernel it
> was almost unused.

I checked tools and they aren't doing anything tricky with it. Just reading
groups of cpus from sysfs.

Now i believe even tools should be patched a bit to give correct meanings
of affected or related cpus. Let me try it.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
