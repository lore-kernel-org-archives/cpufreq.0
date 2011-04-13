From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 33202] cpufreq-info 008 only reports maximum "current
 frequency", contradicts cpufreq stats and /proc/cpuinfo
Date: Wed, 13 Apr 2011 10:54:59 GMT
Message-ID: <201104131054.p3DAsxa4020161@demeter1.kernel.org>
References: <bug-33202-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-33202-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=33202


Dominik Brodowski <linux@brodo.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux@brodo.de




--- Comment #1 from Dominik Brodowski <linux@brodo.de>  2011-04-13 10:54:58 ---
Well, all cpufreq-info does is read out

  /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq

or

  /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq

and then print the value being reported there. Do the values in those files
change at all?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
