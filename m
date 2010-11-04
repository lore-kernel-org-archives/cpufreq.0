From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Thu, 4 Nov 2010 08:15:18 GMT
Message-ID: <201011040815.oA48FIcm006175@demeter1.kernel.org>
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





--- Comment #44 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-11-04 08:15:11 ---
> Also the fact that only one CPU is affected very much points to defect HW.

I got only one CPU, but two CPU cores - by CPU you meant "CPU core", right?

> remove the aperfmperf capabilties line from
arch/x86/kernel/include/asm/cpufeatures.h

I'll try that with a vanilla kernel to see if I run into other problems with
that. (That will remove the capability system-wide, not only for the cpufreq
subsystem, right?)

If it helps: I installed Windows XP on another partition on my affected laptop,
frequency scaling works just fine there...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
