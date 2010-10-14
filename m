From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Thu, 14 Oct 2010 05:56:40 GMT
Message-ID: <201010140556.o9E5ueFo025027@demeter2.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702


mobusby@yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mobusby@yahoo.com




--- Comment #7 from mobusby@yahoo.com  2010-10-14 05:56:36 ---
I am having a similar problem, but changing the CPU governor or threshhold
doesn't help.  I wrote a little script to test my CPU, and it appears that the
BIOS is limiting the CPU at high work loads, but not at low work loads.  After
some time at full BIOS limiting ACPI throttling begins.  The temperature never
gets high enough for throttling.

I am using the stock Kernel from Ubuntu 10.10.  This behavior was not present
in Ubuntu 10.04, and is not present when running Windows.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
