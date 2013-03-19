From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Tue, 19 Mar 2013 08:23:43 +0000 (UTC)
Message-ID: <20130319082343.6994411FB5D@bugzilla.kernel.org>
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





--- Comment #11 from Duncan <1i5t5.duncan@cox.net>  2013-03-19 08:23:43 ---
(In reply to comment #6)

> BTW, it will be good if you can provide me suspend/resume log with all debug
> prints enabled.

I take it that shouldn't be necessary with the new reproducer?  But a debug log
from the offline/online cycle would be useful?

You meant dmesg, correct?  I take it the originally attached dmesg didn't have
the kernel config debug options enabled that you need?  Which specific options
enabled, anything I need to echo into an appropriate sysfs file, etc?  There's
a LOT of kernel debug options to choose from but I guess most of them wouldn't
be particularly helpful here, so I think you didn't really mean *ALL* of them.
=;^)

(In reply to comment #10)

> I believe you are using acpi-cpufreq driver, right?

Yes, the acpi p-states driver, X86_ACPI_CPUFREQ.  AFAIK it was previously the
k8 powernow driver, X86_POWERNOW_K8, but a kernel or two ago I noticed
complaints in the kernel log saying to switch to the acpi driver, so I disabled
the powernow driver (acpi p-states was already enabled, monolithic kernel as I
mentioned above) and rebooted, and cpufreq continued to work, so I stayed with
the acpi driver.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
