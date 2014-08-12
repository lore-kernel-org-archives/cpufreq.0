From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81701] OOPS in cpufreq driver with AMD Kaveri CPU
Date: Tue, 12 Aug 2014 19:01:32 +0000
Message-ID: <bug-81701-12968-t4Khl71IZO@https.bugzilla.kernel.org/>
References: <bug-81701-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-81701-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=81701

--- Comment #17 from Oleksandr Natalenko <oleksandr@natalenko.name> ---
@Ayan: I've put pr_info to cpufreq transition notifiers, and what I can see is
that frequency changes often enough (several times per second), so there's no
need to do extra CPU load/relax cycles.

Also, machine could hang after 2 hours of successful uptime, or after 25 hours,
and there's no obvious reason for hang.

To answer your question, I've tried your script (stress-testing for several
hours), and got nohing as well, but that is not significant result.

You may follow linux-pm thread where Viresh tells me how to debug this issue:

http://marc.info/?l=linux-pm&m=140786965520720&w=2

-- 
You are receiving this mail because:
You are the assignee for the bug.
