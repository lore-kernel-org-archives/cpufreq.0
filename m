From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 19 Oct 2010 07:34:24 GMT
Message-ID: <201010190734.o9J7YO7l013739@demeter2.kernel.org>
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





--- Comment #23 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-10-19 07:34:20 ---
Concerning bug 17001, which I filed, I have to report that the issue has not
magically disappeared for me with the 2.6.36-rc kernels.
I finally managed to compile 2.6.36-rc7 and -rc8 (had an error building the
i915 driver before) and Core2 Duo T7300 CPU still is stuck at the lowest
frequency without lowering up_threshold to 53 or lower.

Would it help if I provided you with some ACPI information? What do you need?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
