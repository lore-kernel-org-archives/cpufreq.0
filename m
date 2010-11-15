From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14771] "ondemand" never raises frequency on an Intel Core2 Due
 (T9900) in a recent Dell E6500
Date: Mon, 15 Nov 2010 12:04:25 GMT
Message-ID: <201011151204.oAFC4PdZ021659@demeter1.kernel.org>
References: <bug-14771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-14771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=14771


Petr Baudis <pasky@ucw.cz> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pasky@ucw.cz




--- Comment #25 from Petr Baudis <pasky@ucw.cz>  2010-11-15 12:04:18 ---
BTW, for me, the problems with ondemand governor boiled down to software issues
(modulo kernel upgrades throughout 2.6.32.x, this seemed to resolve some most
basic issues). First, a lot of my load was niced and I was not aware of
/sys/devices/system/cpu/cpu$i/cpufreq/ondemand/ignore_nice_load. Setting this
resolved my problems in part. This setting is being reset time by time anyway,
but that is likely to be some evil desktop thing trying to meddle with stuff.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
