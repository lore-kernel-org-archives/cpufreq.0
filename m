From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Thu, 14 Oct 2010 15:20:44 GMT
Message-ID: <201010141520.o9EFKiEs027855@demeter1.kernel.org>
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





--- Comment #11 from Heinz Diehl <htd@fancy-poultry.org>  2010-10-14 15:20:38 ---
Hi Thomas,
lowering up_threshold helps. Standard after booting without having the kernel
patched is 95, after your patch it is set to 40. I didn't install a lot of
different kernels yet, because the machine is brand new, but I noticed to my
surprise at 2.6.36-rc7-git3 seems to have cured the problem. There's no cpufreq
related patch in there, as far as I could see, so I wonder what the f*ck is
going on here :-)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
