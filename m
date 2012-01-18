From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13489] us2e_cpufreq does not work on Netra t1 200
Date: Wed, 18 Jan 2012 22:41:08 GMT
Message-ID: <201201182241.q0IMf8pH017240@bugzilla.kernel.org>
References: <bug-13489-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-13489-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=13489





--- Comment #5 from Jos van der Ende <seraph@xs4all.nl>  2012-01-18 22:41:07 ---
Wow, been a while since I reported this one.

I've just tested with a 3.1.6 kernel with Gentoo patches. Yes, the problem
still exists; loading the us2e-cpufreq mod caused an immediate hard reset.

I'll try with vanilla 3.2.1 as soon as I have some more time, but I have no
reason to assume the result will be any different.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
