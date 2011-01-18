From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16168] BUG: using smp_processor_id() in preemptible [00000000]
 code:
Date: Tue, 18 Jan 2011 06:16:22 GMT
Message-ID: <201101180616.p0I6GMZu011238@demeter1.kernel.org>
References: <bug-16168-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16168-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16168


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |lenb@kernel.org




--- Comment #1 from Len Brown <lenb@kernel.org>  2011-01-18 06:16:21 ---
I assume this was not an issue with 2.6.34.
did it go away before 2.6.35, or is it still a problem?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
