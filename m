From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 1 Nov 2010 10:49:16 GMT
Message-ID: <201011011049.oA1AnGLM015691@demeter2.kernel.org>
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





--- Comment #35 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-11-01 10:49:11 ---
# dmesg | grep acpi-cpufreq
acpi-cpufreq: average (aperf/mperf) accounting disabled by user
acpi-cpufreq: average (aperf/mperf) accounting disabled by user

This patch actually *FIXED* the problem for me.

Please give me some instructions on how to use cpufreq-aperf - how do I use the
tool? When running it, it gives me an output like this (with the patched
kernel):

# cpufreq-aperf 
CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    0500250            00 sec 041 ms    00 sec 958 ms    04
001    0460230            00 sec 056 ms    00 sec 943 ms    05

000    0500250            00 sec 045 ms    00 sec 954 ms    04
001    0620310            00 sec 056 ms    00 sec 943 ms    05

000    0480240            00 sec 033 ms    00 sec 966 ms    03
001    0520260            00 sec 054 ms    00 sec 945 ms    05

000    0580290            00 sec 109 ms    00 sec 890 ms    10
001    0580290            00 sec 123 ms    00 sec 876 ms    12

000    0560280            00 sec 179 ms    00 sec 820 ms    17
001    0540270            00 sec 239 ms    00 sec 760 ms    23

Do I have to create load on one or both cpu cores? Do I have to pass particular
options? And if I just have to run it, how long should I run it?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
