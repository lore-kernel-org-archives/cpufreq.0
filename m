From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Mon, 6 Sep 2010 01:47:28 GMT
Message-ID: <201009060147.o861lSxL030435@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001


Gerhard Killesreiter <gerhard@killesreiter.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gerhard@killesreiter.de




--- Comment #9 from Gerhard Killesreiter <gerhard@killesreiter.de>  2010-09-06 01:47:25 ---
I have a HP Compaq 6910p laptop with the same type processor as the original
submitter.

I've built myself a 2.6.35 kernel from Debian sources. Everytime I boot using
this kernel the processor speed is stuck at 800 MHz (the lowest speed available
for this processor). I can change the governor (standard governor is
"ondemand") but it doesn't allow the processor speed to increase.

The reason is probably that the bios_limit at e.g.

/sys/devices/system/cpu/cpu0/cpufreq/bios_limit

is stuck at 800 MHz and cannot be changed.

Earlier Debian kernels (2.6.32) did not exhibit this problem.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
