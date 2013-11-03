From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64271] Intel Pstate driver - "kick" code is not needed
Date: Sun, 03 Nov 2013 21:13:50 +0000
Message-ID: <bug-64271-12968-FBZP0oyLkV@https.bugzilla.kernel.org/>
References: <bug-64271-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64271-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64271

--- Comment #1 from Doug Smythies <dsmythies@telus.net> ---
Adding some phoronix ffmpeg test results:

Kernel: 3.12RC7 with No Kick modification.
Linux s15 3.12.0-rc7-nokick #49 SMP Sat Nov 2 21:40:01 PDT 2013 x86_64 x86_64
x86_64 GNU/Linux
Mode: Powersave with default settings.

Sample size 250 tests. (the limit seems to be 256)
Test run 1 is rejected as it includes extra time to load the test file. For
subsequent tests, the file is already cached.

ave    13.475713 seconds
max    13.70577598 seconds
min    13.29449391 seconds
stddev    0.073586378 seconds

Kernel: 3.12RC7
Linux s15 3.12.0-rc7+ #48 SMP Fri Nov 1 21:09:51 PDT 2013 x86_64 x86_64 x86_64
GNU/Linux
Mode: Performance with default settings.

Sample size 250 tests.
Test run 1 is NOT rejected as, due an error on my part, I restarted the test
and the so the test file was already cached.

ave    13.4565717 seconds
max    13.66979098 seconds
min    13.2799778 seconds
stddev    0.070516137 seconds

Kernel: 3.12RC7
Linux s15 3.12.0-rc7+ #48 SMP Fri Nov 1 21:09:51 PDT 2013 x86_64 x86_64 x86_64
GNU/Linux
Mode: Powersave with default settings.

Sample size 250 tests.
Test run 1 is NOT rejected as the test had been just run under different
conditions so the test file was already cached.

ave    13.45689662 seconds
min    13.64681292 seconds
max    13.30776 seconds
stddev    0.067261141 seconds

System Information

Hardware:
Processor: Intel Core i7-2600K @ 3.80GHz (8 Cores), Motherboard: ASUS P8Z68-M
PRO, Chipset: Intel 2nd Generation Core Family DRAM, Memory: 16384MB, Disk:
1000GB Seagate ST1000DM003-9YN1 + 1000GB Seagate ST1000DL002-9TT1 + 120GB INTEL
SSDSA2CW12, Graphics: Intel 2nd Generation Core Family IGP, Audio: Realtek
ALC892, Network: Intel 82574L Gigabit Connection

Software:
OS: Ubuntu 12.04, Kernel: 3.12.0-rc7+ (x86_64), Compiler: GCC 4.6, File-System:
ext4, Screen Resolution: 1680x1050

-- 
You are receiving this mail because:
You are the assignee for the bug.
