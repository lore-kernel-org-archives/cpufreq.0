From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 15295] scaling_max_freq value lost upon suspend
Date: Sun, 26 Feb 2012 04:22:13 GMT
Message-ID: <201202260422.q1Q4MDcg002019@bugzilla.kernel.org>
References: <bug-15295-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-15295-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15295


z_kvn@yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |z_kvn@yahoo.com




--- Comment #3 from z_kvn@yahoo.com  2012-02-26 04:22:13 ---
Hello 

I can confirm this bug persists with below kernal

ThinkPad-X220 3.0.0-16-generic #28-Ubuntu SMP Fri Jan 27 17:44:39 UTC 2012
x86_64 x86_64 x86_64 GNU/Linux

In my /etc/rc.local I have below script to change scaling_max_freq of four
cores 

for i in 0 1 2 3; do echo 2400000 >
/sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; done

However after suspend, only CPU0 stays 2400000, all other three changed to
maximum of 2401000

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
