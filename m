From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] Cores stuck at max frequency after resume from suspend
 (Haswell)
Date: Mon, 25 Nov 2013 22:15:04 +0000
Message-ID: <bug-65301-12968-gPjBHLRRLn@https.bugzilla.kernel.org/>
References: <bug-65301-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65301-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65301

Marcin Konarski <marcin.konarski@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |marcin.konarski@gmail.com

--- Comment #7 from Marcin Konarski <marcin.konarski@gmail.com> ---
I can confirm on Lenovo T420i with Intel(R) Core(TM) i3-2370M CPU @ 2.40GHz,
after resume from hibernation CPU is stuck at 2.4GHz although top show that
system has 0% load.

When system is stuck at maximum frequency I can unstuck it by performing
suspend to RAM and waking up.

Linux ubiquitous 3.11-2-amd64 #1 SMP Debian 3.11.8-1 (2013-11-13) x86_64
GNU/Linux

Regards.

-- 
You are receiving this mail because:
You are the assignee for the bug.
