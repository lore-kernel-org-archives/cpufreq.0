From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Sat, 03 May 2014 00:11:03 +0000
Message-ID: <bug-75121-12968-iZgSotQjPE@https.bugzilla.kernel.org/>
References: <bug-75121-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75121-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75121

--- Comment #10 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 134811
  --> https://bugzilla.kernel.org/attachment.cgi?id=134811&action=edit
Perf data for Kernel 3.15RC3 CPU at 0.5% load at 200 Hertz load / noload
frequency.

The purpose of this data is to show: Math seems to have underflowed or
something a couple of times; Where is all the data, there should be more
samples.

-- 
You are receiving this mail because:
You are the assignee for the bug.
