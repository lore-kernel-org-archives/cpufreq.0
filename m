From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 21082] Machine Check Exception on Athlon X2
Date: Sun, 24 Oct 2010 23:29:19 GMT
Message-ID: <201010242329.o9ONTJZP006302@demeter1.kernel.org>
References: <bug-21082-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-21082-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=21082


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de
          Component|cpufreq                     |x86-64
         AssignedTo|cpufreq@vger.kernel.org     |platform_x86_64@kernel-bugs
                   |                            |.osdl.org
            Product|Power Management            |Platform Specific/Hardware




--- Comment #1 from Thomas Renninger <trenn@suse.de>  2010-10-24 23:29:12 ---
This is most probably unrelated to CPU freq and powernow-k8 driver.
I expect the backtrace does not always point to powernow-k8 driver?

> As far as I can tell, this only happens when X is running as i build gentoo
> with out problems.
I saw something similar, also related to the X driver.
It was very hard to reproduce (run two different 3D X applications in parallel,
then it would throw such an MCE after 2-30 minutes...) and hang up.
The fix was about missing TLB flushes related to ioremap.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
