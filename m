From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Tue, 20 Nov 2012 02:56:40 +0000 (UTC)
Message-ID: <20121120025640.977F911FB4C@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |lenb@kernel.org
            Summary|CPU freqs stay stuck at max |CPU freqs stay stuck at max
                   |after reboot with on-demand |after reboot with on-demand
                   |governor set                |governor set - i7-2630QM




--- Comment #2 from Len Brown <lenb@kernel.org>  2012-11-20 02:56:40 ---
please show the output from turbostat
when this problem is happening.
you can find turbostat in the kernel source tree under
tools/power/x86/turbostat

also, please verify with top that nothing is running
when the system is idle.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
