From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Tue, 8 Mar 2011 11:26:35 GMT
Message-ID: <201103081126.p28BQZPD003764@demeter1.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #13 from Thomas Renninger <trenn@suse.de>  2011-03-08 11:26:35 ---
More interesting would be:
for x in cat /sys/devices/system/cpu/cpu*/cpuidle/state*/*;do echo $x;cat
$x;done
If your kernel still provides:
cat /proc/acpi/processor/*/power
That would be interesting as well.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
