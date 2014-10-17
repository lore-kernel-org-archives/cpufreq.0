From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 86461] intel_pstate does not obey min/max frequencies set by
 user
Date: Fri, 17 Oct 2014 17:02:43 +0000
Message-ID: <bug-86461-12968-JnKKwq7sTv@https.bugzilla.kernel.org/>
References: <bug-86461-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-86461-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86461

--- Comment #4 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
I looks like everything is working correctly.  You have to remember that the 
frequencies returned by turbostat and intel_pstate are measured effective
frequency over the time of the sample.  Previously with acpi_cpufreq the value
returned through /proc/cpuinfo and the cupfreq sysfs interface was the
requested
frequency and not the actual frequency.

If you want to see that the floor for P states has actually changed you can see 
the requested P state with:
  rdmsr -a -f15:8 0x199

The actual frequency that all cores on the processor run at is selected by the
processor based on the requests for all cores.

-- 
You are receiving this mail because:
You are the assignee for the bug.
