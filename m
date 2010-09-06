From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Mon, 6 Sep 2010 09:20:26 GMT
Message-ID: <201009060920.o869KQar000565@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001





--- Comment #11 from Thomas Renninger <trenn@suse.de>  2010-09-06 09:20:23 ---
Gerhard: You probably have another problem. Peter's problem seem to point to a
real kernel bug, you have to find out why the BIOS is limiting the frequency
(which the kernel is probably doing correct).
You find hints how to find that out here:
https://bugzilla.kernel.org/show_bug.cgi?id=16362
But best would be to open another bug as the reason why BIOS is limiting the
freq is probably another one. Update your BIOS first and double check whether
the problem persists. State HP Compaq 6910p again (in the title?) so that
others also find the issue quickly.

Peter: Could you try another kernel version. Either the latest 2.6.36-rcX or
easier and even better would be something like 2.6.27-32. I can help you to try
that out easily if you use openSUSE, otherwise you have to find out yourself,
but it shouldn't be that hard to additionally install and try out an older
kernel. Also check the "bias" ondemand governor setting (same dir(s) as
up_threshold), this must be zero. If it's not, it's probably that.
Unfortunately the ondemand governor is not very verbose about it's load
statistics, even with cpufreq.debug on.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
