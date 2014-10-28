From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71841] cpufreq ondemand ignore_nice_load doesn't work
Date: Tue, 28 Oct 2014 04:12:47 +0000
Message-ID: <bug-71841-12968-VZelOmEiMj@https.bugzilla.kernel.org/>
References: <bug-71841-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-71841-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71841

Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lenb@kernel.org
           Hardware|x86-64                      |All
            Summary|AMD64:ignore_nice_load      |cpufreq ondemand
                   |ignores real load           |ignore_nice_load doesn't
                   |                            |work

--- Comment #1 from Len Brown <lenb@kernel.org> ---
/sys/devices/system/cpufreq/ondemand/ignore_nice_load
doesn't work on my Intel box either -- marking this bug as HW = "all".

For me, it fails in the opposite way.
When set, my system goes up to 3.8 GHz no matter
if a cycle soaker is invoked normally, or via nice(1).

I happen to be running Linux 3.13, as shipped by Ubuntu 14.04.1

-- 
You are receiving this mail because:
You are the assignee for the bug.
