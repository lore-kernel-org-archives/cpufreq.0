From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 13:54:27 +0000 (UTC)
Message-ID: <20130322135427.F25B911FB81@bugzilla.kernel.org>
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





--- Comment #20 from Borislav Petkov <bp@alien8.de>  2013-03-22 13:54:27 ---
On Fri, Mar 22, 2013 at 07:13:33PM +0530, Viresh Kumar wrote:
> I have never gone into coding for any non-ARM platform and am
> really not aware of acpi-cpufreq driver and its users. That's why
> i told everybody where the issue is, and they just need to fix
> acpi-cpufreq driver with right values of policy->cpus (affected_cpus)
> and everything else would work after that.

No, you're breaking existing drivers with your changes - nobody will fix
stuff *you're* breaking.

You need to get the hardware and test your changes on *that* hardware
too. Otherwise, the offending patches should be reverted until you can
provide a patchset which works on everything.

Geez, the fact that I even need to explain this...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
