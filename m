From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 57941] Cpufreq stats are not shown in sysfs
Date: Sun, 12 May 2013 16:16:51 +0000 (UTC)
Message-ID: <20130512161651.9C72211F943@bugzilla.kernel.org>
References: <bug-57941-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-57941-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=57941





--- Comment #2 from Justin <jlec@gentoo.org>  2013-05-12 16:16:51 ---
(In reply to comment #1)
> Only this one is missing or complete stats directory?

You are right. The complete directory is missing.

# ll /sys/devices/system/cpu/cpu0/cpufreq/
total 0
-r--r--r-- 1 root root 4.0K May 12 18:16 affected_cpus
-r-------- 1 root root 4.0K May 12 18:16 cpuinfo_cur_freq
-r--r--r-- 1 root root 4.0K May 12 11:26 cpuinfo_max_freq
-r--r--r-- 1 root root 4.0K May 12 11:26 cpuinfo_min_freq
-r--r--r-- 1 root root 4.0K May 12 18:16 cpuinfo_transition_latency
-r--r--r-- 1 root root 4.0K May 12 18:16 related_cpus
-r--r--r-- 1 root root 4.0K May 12 18:16 scaling_available_governors
-r--r--r-- 1 root root 4.0K May 12 18:16 scaling_driver
-rw-r--r-- 1 root root 4.0K May 12 18:16 scaling_governor
-rw-r--r-- 1 root root 4.0K May 12 11:26 scaling_max_freq
-rw-r--r-- 1 root root 4.0K May 12 18:16 scaling_min_freq
-rw-r--r-- 1 root root 4.0K May 12 18:16 scaling_setspeed

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
