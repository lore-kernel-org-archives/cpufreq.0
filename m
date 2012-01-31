From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42671] cpufreq userspace governor doesn't work on Intel Core 2
 Gen 2 CPUs
Date: Tue, 31 Jan 2012 02:58:30 GMT
Message-ID: <201201310258.q0V2wUuj022892@bugzilla.kernel.org>
References: <bug-42671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-42671-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42671


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |lenb@kernel.org




--- Comment #1 from Len Brown <lenb@kernel.org>  2012-01-31 02:58:30 ---
are you sure that you are using the userspace governor?
few people do, as it is generally obsolted by ondemand.

When ondemand is running, scaling_setspeed does nothing,
and you can "manually" control what ondemand does by
setting its maximum and minimum frequencies.

Please show the output from
grep .  /sys/devices/system/cpu/cpu0/cpufreq/*

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
