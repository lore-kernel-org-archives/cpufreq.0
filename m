From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59781] intel_pstate synchronizes frequencies on wake from
 suspend
Date: Tue, 18 Jun 2013 01:19:43 +0000 (UTC)
Message-ID: <20130618011943.1A3F611FB35@bugzilla.kernel.org>
References: <bug-59781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59781





--- Comment #6 from pqwoerituytrueiwoq@gmail.com  2013-06-18 01:19:42 ---
Strange when using acpi-cpufreq's ondemand setting cpuinfo_cur_freq is
synchronized, but scaling_cur_freq is not
That is under the 3.9.0 kernel

~$ turbostat 
turbostat_3.9.0-030900 not found
You may need to install linux-tools-3.9.0-030900

there is no such package...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
