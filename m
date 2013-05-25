From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58801] intel_pstate/powersave - cpu frequency remains at high
 level if if system is idle
Date: Sat, 25 May 2013 09:39:03 +0000 (UTC)
Message-ID: <20130525093903.3768711F965@bugzilla.kernel.org>
References: <bug-58801-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58801-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58801





--- Comment #2 from Christoph Loehr <c.h.l@web.de>  2013-05-25 09:39:02 ---
At first I have to add that also kernel 3.9.2 worked. According to the
changelog of kernel 3.9.3 between 3.9.2 and 3.9.3 three commitments concerning
intel_pstate (b540137a810d0267051c538e68d4348e43a1edf3,
2aa491f8bdcac932006548b1a2b655b29c942e08 and
1abc4b20b85b42e8573957e54b193385cf48b0d6) have been added to the kernel. I
guess that one of them might be the culprit. 

As I am rather a user it's only possible for me to describe the symptoms. 

With kernel 3.9.2, when the system is idle according to cpufreg-info the
frequency of all cpu's is between 775 and 800 MHz, which is the minimum. With
kernel 3.9.3 and 3.9.4 it never goes below 2.85 GHz. In both cases intel_pstate
is the driver and powersave the governor.

Christoph

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
