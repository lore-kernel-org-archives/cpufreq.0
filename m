From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16436] ath5k (AR5001) does not work after resume and fails with
 "ath5k phy0: gain calibration timeout"
Date: Thu, 23 Jun 2011 18:41:35 GMT
Message-ID: <201106231841.p5NIfZ9h005601@demeter2.kernel.org>
References: <bug-16436-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16436-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16436


Thomas Andersen <phomes@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |phomes@gmail.com




--- Comment #36 from Thomas Andersen <phomes@gmail.com>  2011-06-23 18:41:29 ---
I'm on 2.6.38.8-32.fc15.x86_64 and I can reproduce it pretty consistently. I
just need to compile/distcheck a few modules in gnome and it dies. I'm guessing
either high cpu or high temp does it.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
