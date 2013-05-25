From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58801] intel_pstate/powersave - cpu frequency remains at high
 level if if system is idle
Date: Sat, 25 May 2013 14:57:22 +0000 (UTC)
Message-ID: <20130525145722.39D3E11F976@bugzilla.kernel.org>
References: <bug-58801-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58801-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58801





--- Comment #3 from Christoph Loehr <c.h.l@web.de>  2013-05-25 14:57:21 ---
In the meantime I have made a git bisect between kernel 3.9.2 and 3.9.3 with
the following result:

5aacc8bcf0b23e20cbb205ac6fdc3ce797e1cae2 is the first bad commit
commit 5aacc8bcf0b23e20cbb205ac6fdc3ce797e1cae2
Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
Date:   Tue May 7 08:20:25 2013 -0700

cpufreq / intel_pstate: remove idle time and duration from sample and
calculations

commit 1abc4b20b85b42e8573957e54b193385cf48b0d6 upstream.


In order to confirm this is the relevant commit I have compiled a 3.9.3 kernel
where I had reverted the changes provided by this commit. With this kernel
booted the frequency switching works again. 

I hope that helps.

Christoph

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
