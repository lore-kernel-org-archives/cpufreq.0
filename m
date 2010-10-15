From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 15 Oct 2010 19:37:05 GMT
Message-ID: <201010151937.o9FJb5o6012615@demeter2.kernel.org>
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





--- Comment #17 from Thomas Renninger <trenn@suse.de>  2010-10-15 19:36:59 ---
If someone wants to test whether this has to do with intel_idle driver you
should be able to check the used driver (new intel_idle vs acpi_idle):
cat /sys/devices/system/cpu/cpuidle/current_driver

The new cpupowerutils (former cpufrequtils) show this via:
cpuidle-info

If intel_idle is used the boot param:
intel_idle.max_cstate=0
should make the machine fall back to acpi_idle...
Just an idea..., idle driver sounds possibly related to wrong idle
accounting... and this is an easy check compared to compiling/bisecting...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
