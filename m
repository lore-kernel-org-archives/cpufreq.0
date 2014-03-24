From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72211] intel_pstate Haswell CPU is not entering hardware
 package idle state
Date: Mon, 24 Mar 2014 21:14:19 +0000
Message-ID: <bug-72211-12968-fbBidg7uKT@https.bugzilla.kernel.org/>
References: <bug-72211-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-72211-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72211

--- Comment #2 from opensource@macht-blau.org ---
the onboard network device (realtek r8168) was the issue. I replaced the
vanilla kernel module (r8169) with realteks r8168. Once the monitor is switched
off via dpms i reach 97% package c state pc6. 

I assume the r8169 does not support aspm. 

Should this bug be closed or moved to drivers?

-- 
You are receiving this mail because:
You are the assignee for the bug.
