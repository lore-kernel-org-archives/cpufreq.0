From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 14:06:29 +0000 (UTC)
Message-ID: <20130322140629.1609711FB81@bugzilla.kernel.org>
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





--- Comment #24 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-22 14:06:28 ---
On 22 March 2013 19:33, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Friday, March 22, 2013 01:43:34 PM bugzilla-daemon@bugzilla.kernel.org wrote:
>> I have never gone into coding for any non-ARM platform and am really not
>> aware of acpi-cpufreq driver and its users. That's why i told everybody where
>> the issue is, and they just need to fix acpi-cpufreq driver with right values
>> of policy->cpus (affected_cpus) and everything else would work after that.
>
> Which wasn't the right thing to do.
>
> If your changes break something, *you* (and nobody else) are responsible for
> fixing that.

Yes, i already replied in another mail on what actually happened.

> Asking for help is obviously fine, but even if no one can (or has the time to)
> help at the moment, you are still responsible for fixing the breakage.  If you
> aren't familiar with the code in question, it's the time for a crash course.

yes, i need to do that now.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
