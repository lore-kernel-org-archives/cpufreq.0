From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 1 Aug 2011 07:35:10 GMT
Message-ID: <201108010735.p717ZAtL001654@demeter2.kernel.org>
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





--- Comment #52 from Thomas Renninger <trenn@suse.de>  2011-08-01 07:35:05 ---
There already seem to go something wrong with TSC at early boot:
Fast TSC calibration failed
TSC: PIT calibration matches HPET. 1 loops

Most interesting are comments 33, 34 and 35.
cpufreq-aperf (measuring the average freq using aperf/mperf) shows frequencies
around 500 MHz which is wrong (afaik the cpu only supports 800 and higher
freqs). That is the reason why the cpufreq subsystem, taking aperf values to
calculate the next frequency into account never raises the frequency.

Removing the cpufreq code to look at aperf/mperf values to calculate the next
desired frequency fixed the problem for Peter and the machine starts switching
frequencies as expected.

Be aware that vyncere's problem is something totally different, but that came
out later in the bug.

Just a guess: Could it be that the BIOS misconfigured some clock multiplier and
tsc and mperf are running to slow?
I didn't look at the rate tsc/mperf/aperf are really running at.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
