From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Thu, 4 Nov 2010 08:41:40 GMT
Message-ID: <201011040841.oA48fex3030988@demeter2.kernel.org>
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





--- Comment #45 from Thomas Renninger <trenn@suse.de>  2010-11-04 08:41:33 ---
Another possibility that does not require kernel rebuilding is to use the
userspace governor and a cpufreq userspace daemon. I expect they do not use
aperf/mperf.
Here is a nice overview of packages that are out there:
http://www.gentoo.org/doc/en/power-management-guide.xml
Other CPU Speed Utilities

> by CPU you meant "CPU core", right?
Yes.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
