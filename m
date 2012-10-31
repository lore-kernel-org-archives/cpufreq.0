From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 48341] BUG: using smp_processor_id in preemptible powernow_k8
Date: Wed, 31 Oct 2012 22:19:47 +0000 (UTC)
Message-ID: <20121031221948.01C1C11FB82@bugzilla.kernel.org>
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


Hedi Berriche <hedi@sgi.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hedi@sgi.com




--- Comment #2 from Hedi Berriche <hedi@sgi.com>  2012-10-31 22:19:47 ---
Actually this should be solved by the following commit:

  e4df1cb: cpufreq / powernow-k8: Remove usage of smp_processor_id() in
preemptible code

Cheers,
Hedi.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
