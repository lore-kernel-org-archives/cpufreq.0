From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] Intel P-State: Constantly changing CPU frequencies on
 idle system.
Date: Thu, 19 Jun 2014 16:25:06 +0000
Message-ID: <bug-77771-12968-tBa3pLQ039@https.bugzilla.kernel.org/>
References: <bug-77771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77771

--- Comment #9 from Michael Long <harn-solo@gmx.de> ---
Created attachment 140441
  --> https://bugzilla.kernel.org/attachment.cgi?id=140441&action=edit
Kernel config 3.15

Sorry for the delay, yes the turbostat results are all from the same Haswell
i5-4200U with 800-1600 MHz (turbo 2.9 GHz) [1].

I've no clue why this ultrabook is so sensitive. Hence I've attached my current
kernel-config maybe I've misconfigured something.

In the meantime I tried to find a better method to reproduce the effect but I
had no real luck when testing on my other quad-core systems. There, the effect
is very less severe.



[1]
http://ark.intel.com/products/75459/Intel-Core-i5-4200U-Processor-3M-Cache-up-to-2_60-GHz?q=i5-4200U

-- 
You are receiving this mail because:
You are the assignee for the bug.
