From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 14:13:44 +0000 (UTC)
Message-ID: <20130322141344.3FD4F11FB81@bugzilla.kernel.org>
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





--- Comment #27 from Borislav Petkov <bp@alien8.de>  2013-03-22 14:13:44 ---
On Fri, Mar 22, 2013 at 07:40:45PM +0530, Viresh Kumar wrote:
> acpi-cpufreq is broken and so all others who are using it. Sorry for
> asking the stupid question now but what's the hierarchy of cpufreq
> drivers for intel (I will try to go through it now), some drivers use
> acpi-cpufreq driver?

All relevant x86 out there uses acpi-cpufreq. Which means that breaking
it, breaks cpufreq on x86. Which is absolutely a no-no.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
