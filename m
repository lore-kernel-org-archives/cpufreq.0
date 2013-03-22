From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 12:15:31 +0000 (UTC)
Message-ID: <20130322121531.1E40711FB81@bugzilla.kernel.org>
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





--- Comment #15 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-22 12:15:30 ---
On 22 March 2013 17:47, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> OK, so what exactly do you need to now?

s/now/know ??

We just need to set policy->cpus with all cpus (online or offline) that
share clock line with cpu for which init() is called.

cpufreq core with then set all those cpus onto related cpus and will
keep only online cpus in policy->cpus..

Sorry if i haven't answered it well :(

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
