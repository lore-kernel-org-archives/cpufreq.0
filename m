From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 62861] Maximum CPU voltage level never reached on AMD A8-5500
 if radeon.dpm=1 is used
Date: Mon, 21 Oct 2013 03:39:06 +0000
Message-ID: <bug-62861-12968-Cm939CvOj3@https.bugzilla.kernel.org/>
References: <bug-62861-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-62861-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=62861

--- Comment #5 from Kertesz Laszlo <laszlo.kertesz@gmail.com> ---
I reverted commit 4076a65544e2de310cbf4eaadb13ee15bbfaaf4f. Reverting this
commit changed back the CPU voltage handling as it was before.

It seems that the CPU power management is best for APUs in its latest form - if
dpm is not used or with 4076a65544e2de310cbf4eaadb13ee15bbfaaf4f reverted and
dpm activated, the CPU is scaled with voltages between 0.9 and 1.34, using all
frequencies, but if all cores are used, after a while (sometimes after a few
seconds) the CPU becomes throttled (no obvious reasons) and the effective
frequencies go down to around ~3 GHz or even lower, in some cases even ~ 2GHz
or lower (temps go as high as 60C withut dpm and ~56C with dpm).

With the new code we have ~0.65 - 1.22 volts, the frequencies are maxed out at
3.168GHz (rarely 3.2) coupled with a lower max temperature(max 51C, mostly 49),
but the frequencies are stable, i can compile a whole kernel with 4 threads and
there is absolutely no throttling. Only thing is missing its the highest
voltage level (1.34) which enables turbo mode.

-- 
You are receiving this mail because:
You are the assignee for the bug.
