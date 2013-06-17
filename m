From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59821] Dell M4600 CPU cores locked at 800MHz
Date: Mon, 17 Jun 2013 17:11:13 +0000 (UTC)
Message-ID: <20130617171113.BDF6611FB51@bugzilla.kernel.org>
References: <bug-59821-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59821-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59821





--- Comment #6 from George B. <list1@gir.me.uk>  2013-06-17 17:11:13 ---
Created an attachment (id=105021)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=105021)
grep . /sys/devices/system/cpu/cpu*/cpufreq/* (CONFIG_X86_INTEL_PSTATE)

Seeing similar behaviour after compiling with CONFIG_X86_INTEL_PSTATE enabled,
except when problem occurs CPU speed will go as high as 897000 and when problem
cleared with s2ram as high as 3381000.

Also, many more values are seen in between these, whereas with
CONFIG_X86_ACPI_CPUFREQ the speed is mostly (maybe even always) either 800000
or 3200000.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
