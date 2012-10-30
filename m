From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 48341] BUG: using smp_processor_id in preemptible powernow_k8
Date: Tue, 30 Oct 2012 16:53:31 +0000 (UTC)
Message-ID: <20121030165331.9AA0511FB6C@bugzilla.kernel.org>
References: <bug-48341-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-48341-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=48341


Andy Furniss <lists@andyfurniss.entadsl.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |OBSOLETE




--- Comment #1 from Andy Furniss <lists@andyfurniss.entadsl.com>  2012-10-30 16:53:31 ---
With drm-fixes -
3.7.0-rc2-70305-g96fb1a2

I see -

powernow-k8: this CPU is not supported anymore, using acpi-cpufreq instead.

Which seems to be working Ok, so closing.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
