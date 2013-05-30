From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 15:09:05 +0000 (UTC)
Message-ID: <20130530150905.F076911FA52@bugzilla.kernel.org>
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





--- Comment #7 from Jean-Philippe Halimi <jean-philippe.halimi@exascale-computing.eu>  2013-05-30 15:09:05 ---
@Dirk Brandewie Having the physical connection allows to understand how the
underlying hardware works. Having a file in cpuN that contains N only is
useless.

@Viresh Kumar Yes but on my Intel Core i7 processor, all the offline+online
cores are sharing the same frequency domain, which means they should all appear
in the related_cpu files.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
