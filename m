From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 09 Jun 2014 23:15:24 +0000
Message-ID: <bug-77201-12968-ttC864M65y@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #14 from registosites@hotmail.com ---
I have tested v3.15-7257-g963649d and applied the patch you attached and it
still hangs when trying to bring the cpu online.

The earliest 3.14 I could quickly test right now was 3.14.1 (provided by the
distro I'm using) and it also fails when trying to bring the cpu online. If it
helps, 3.13.8 worked fine (suspend and hibernate, didn't actually test cpu
offline/online).

Here is the other information you requested:
cat /sys/devices/system/cpu/cpu0/cpufreq/related_cpus 
0 1
cat /sys/devices/system/cpu/cpu0/cpufreq/affected_cpus 
0 1

cat /sys/devices/system/cpu/cpu1/cpufreq/related_cpus 
0 1
cat /sys/devices/system/cpu/cpu1/cpufreq/affected_cpus 
0 1

-- 
You are receiving this mail because:
You are the assignee for the bug.
