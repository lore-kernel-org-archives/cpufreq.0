From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Mon, 2 Aug 2010 18:57:56 GMT
Message-ID: <201008021857.o72IvuIQ020125@demeter.kernel.org>
References: <bug-16072-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16072-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16072


Kostya Stopani <hatta@depni.sinp.msu.ru> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hatta@depni.sinp.msu.ru




--- Comment #12 from Kostya Stopani <hatta@depni.sinp.msu.ru>  2010-08-02 18:56:35 ---
Hi,

I am experiencing a similar problem with a Thinkpad X200s laptop (CPU is the
same -- SU2300, kernel version 2.6.34.1) with the latest BIOS version.
Acpi-thinkpad module produces exactly the same output in dmesg as in comment
#3. The CPU has est flag in /proc/cpuinfo indeed.

And there is also an _OSI condition is DSDT, kernel writes in dmesg:

        ACPI: BIOS _OSI(Linux) query ignored

during boot.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
