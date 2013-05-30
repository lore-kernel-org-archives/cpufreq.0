From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 15:14:17 +0000 (UTC)
Message-ID: <20130530151417.4131111FACF@bugzilla.kernel.org>
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





--- Comment #8 from Viresh Kumar <viresh.kumar@linaro.org>  2013-05-30 15:14:16 ---
(In reply to comment #7)
> @Viresh Kumar Yes but on my Intel Core i7 processor, all the offline+online
> cores are sharing the same frequency domain, which means they should all appear
> in the related_cpu files.

cpufreq doesn't care how actual hardware clock domains are managed, it just
trusts whatever underlying cpufreq driver has communicated. Because x86 drivers
want cpufreq core to believe that every core has a separate clock, so it is.

It doesn't make any sense what so ever to keep only one cpu in affected_cpus
and all cpus 0-7 in related_cpus as that information isn't used by core.
related cpus comes same as affected cpus in your case because you only have one
core per domain (virtual domain :) ).. But in case you have more cores in a
cluster and few of them are offlined, these two will have different values.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
