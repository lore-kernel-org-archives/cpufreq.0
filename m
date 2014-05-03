From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Sat, 03 May 2014 00:03:21 +0000
Message-ID: <bug-75121-12968-SioTOSBIHz@https.bugzilla.kernel.org/>
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

--- Comment #8 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 134791
  --> https://bugzilla.kernel.org/attachment.cgi?id=134791&action=edit
Perf data for Kernel 3.15RC3 CPU at 10% load at 200 Hertz load / noload
frequency.

Under these conditions, the CPU used to have started to ramp up in frequency.

-- 
You are receiving this mail because:
You are the assignee for the bug.
