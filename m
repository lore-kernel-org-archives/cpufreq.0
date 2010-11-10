From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Wed, 10 Nov 2010 11:18:00 GMT
Message-ID: <201011101118.oAABI0ie000967@demeter1.kernel.org>
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





--- Comment #49 from vyncere <vyncere@gmail.com>  2010-11-10 11:17:50 ---
Hi all,

Thank you very much Thomas for your hint. As you suggested me to check the BIOS
limit (which was 1.20 GHz in my case), this morning I set in my BIOS for all
modes (AC/DC Power + Battery) the "Performance" profile, instead of
"Power-saving" one.

Now the BIOS limit is 2.40GHz, and cpufreq manage to do his job, without any
patches (2.6.36).

Thank you very much again, tracking this bug was very instructive. ^^

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
