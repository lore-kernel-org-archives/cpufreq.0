From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Thu, 24 Dec 2015 23:53:21 +0000
Message-ID: <bug-65501-12968-gOFYBcsepo@https.bugzilla.kernel.org/>
References: <bug-65501-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65501-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65501

--- Comment #21 from sworddragon2@aol.com ---
sworddragon@ubuntu:~$ cat /boot/config-4.3.0-4-generic | grep
CONFIG_HZ_PERIODIC
# CONFIG_HZ_PERIODIC is not set

Ubuntu seems to not set this option on the desktop version. Also I'm noticing
this performance issue rarely. For example I remember to have seen this issue
some time ago on Loot Heroes and some other games I don't remember well
anymore. They worked much better from changing all 6 cores to the performance
governor (was ondemand with up_threshold on 11 before). And a short time ago I
have noticed this performance drop on Bullet Heaven 2 but it was only a short
test. If I could I would simply set up_threshold to 1 to be sure to really
eliminate any race condition here as much as possible.

-- 
You are receiving this mail because:
You are the assignee for the bug.
