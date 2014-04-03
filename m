From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73421] intel/p_state Does not increase into Turbo Boost states
 and does not display all governors. i5-3201M
Date: Thu, 03 Apr 2014 01:52:09 +0000
Message-ID: <bug-73421-12968-qVhHH9UNou@https.bugzilla.kernel.org/>
References: <bug-73421-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73421-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73421

--- Comment #3 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
The msr-tools package from https://01.org/msr-tools/downloads makes it easy to
see what P state is being requested for each core with the command:
   sudo rdmsr -a   0x199

The requested P state is in the upper eight bits.

The P state intel_pstate requests is just that a request in the turbo range,
the CPU itself decides what frequency will be used while keeping the processor
in it thermal envelop.

-- 
You are receiving this mail because:
You are the assignee for the bug.
