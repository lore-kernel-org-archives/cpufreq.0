From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Fri, 02 May 2014 23:58:00 +0000
Message-ID: <bug-75121-12968-gW9QyPBgnH@https.bugzilla.kernel.org/>
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

--- Comment #7 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 134781
  --> https://bugzilla.kernel.org/attachment.cgi?id=134781&action=edit
Perf data for Kernel 3.15RC3 CPU at 85% load at 200 Hertz load / noload
frequency.

Under these conditions, the CPU is never in the C0 state for an entire
intel_pstate sample time. In my opinion the C0 inclusion unduly biases the
target p-state downwards.

-- 
You are receiving this mail because:
You are the assignee for the bug.
