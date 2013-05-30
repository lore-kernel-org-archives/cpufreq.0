From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 16:28:26 +0000 (UTC)
Message-ID: <20130530162826.A4C6F11FB5D@bugzilla.kernel.org>
References: <bug-58761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58761-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58761





--- Comment #13 from Dirk Brandewie <dirk.brandewie@gmail.com>  2013-05-30 16:28:26 ---
Finding the correlation between cores is a LOT more complex than looking at the
information that was presented by related_cpus.  The correlation is workload
dependant idle cores lose their vote for what the package p-state should be.

IMHO the information presented by related_cpus has not been useful since
Nehalem came out.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
