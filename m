From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64251] Intel Pstate driver minimum percent does not change with
 turbo off
Date: Thu, 07 Nov 2013 05:28:49 +0000
Message-ID: <bug-64251-12968-kaFKm6JJf7@https.bugzilla.kernel.org/>
References: <bug-64251-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64251-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64251

--- Comment #4 from Doug Smythies <dsmythies@telus.net> ---
(In reply to Dirk Brandewie from comment #3)
> I was trying to provide some useful information by setting min_perf_pct to a
> value.
Which I totally agree with, and do find the information very useful.
I am just suggesting that it would be equally useful to provide that same
information for the other cases.

I see 4 scenarios, maybe there are more (using my computer as the example):

1.) BIOS allows Turbo mode and Turbo on enabled in driver:
min = 42 percent, which represents 1.6 GHz and is accurate
max = 100 percent, which represents 3.8 GHz and is accurate

2.) BIOS allows Turbo mode and Turbo is disabled in driver:
min = 42 percent, which doesn't represent anything.
max = 100 percent, which represents 3.4 GHz and is accurate.

3.) BIOS disabled Turbo mode and Turbo on enabled in driver:
min = 42 percent, which represents 1.6 GHz and is accurate.
max = 100 percent, which represents 3.8 GHz, but can not be achieved.
(a supporting graph will be attached in a minute)

4.) BIOS disabled Turbo mode and Turbo is disabled in driver:
This does not work at all on my computer. The CPU frequency just locks at
whatever it was when the driver Turbo disable transition command is issued.
(a supporting graph will be attached in a minute)

-- 
You are receiving this mail because:
You are the assignee for the bug.
