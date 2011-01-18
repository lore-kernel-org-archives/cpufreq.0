From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12482] Change cpufreq_ondemand to tread SCHED_IDLE time as idle
 time
Date: Tue, 18 Jan 2011 08:20:49 GMT
Message-ID: <201101180820.p0I8KnsW014586@demeter1.kernel.org>
References: <bug-12482-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12482-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12482


Robert Bradbury <robert.bradbury@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |robert.bradbury@gmail.com

Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
                 CC|                            |lenb@kernel.org
         Resolution|                            |DOCUMENTED
         Regression|---                         |No




--- Comment #10 from Robert Bradbury <robert.bradbury@gmail.com>  2010-06-25 07:15:41 ---
Comments on Gentoo Bug #287463 and Kernel Bugs #14066,  #14771 and #16072 may
be related to this.  It is clear from my experience with cpufreq_ondemand and
acpi-cpufreq since Linux 2.6.30 is that there are very few people who really
understand the issues involved here.  The general tone from the "kernel"
developers seems to be that cpufreq_ondemand (and indirectly p4-clockmod.c) are
"deprecated" in favor of using acpi-cpufreq.  This is without taking into
account that for acpi-cpufreq to work correctly it needs an Enhanced Intel
Speedstep processor *and* a compatible ACPI BIOS with _PCT code(*) -- and there
are a *lot* (presumably millions) of machines in the world for which this is
not the case.

* This only applies to machines with Intel Pentium class processors presumably.

--- Comment #11 from Len Brown <lenb@kernel.org>  2011-01-18 08:20:48 ---
re: comment #10
cpufreq has two parts, the policy governor, and the platform driver.
It needs one of each to function.

available governors include ondemand, performance, powersave, userspace
available drivers include acpi-cpufreq, p4-clockmod, and some amd-specific ones

ondemand is a fully supported governor
acpi-cpufreq is a fully supported driver

p4-clockmod is generally used by mistake when it is used,
and it generally does more harm than it does good.
The only reason that it hasn't been deleted from the source tree
is that some people use it to lower the temperature on celeron processors.

re: comment #9

proposals for enhancing the algorithms used in the ondemand
should be done on the list, rather than filed as bugs in bugzilla,
particularly proposals that involve scheduling classes etc.
that may have a variety of uses and require vetting from
a variety of experts (who will not see bugzilla entries).

So I'm going to close this sighting as DOCUMENTED.
Please submit your cool ideas to the cpufreq list.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
