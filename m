From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 15:05:19 +0000 (UTC)
Message-ID: <20130530150519.F225A11FACF@bugzilla.kernel.org>
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





--- Comment #6 from Viresh Kumar <viresh.kumar@linaro.org>  2013-05-30 15:05:19 ---
(In reply to comment #5)
> I am not entirely understand why the change was made (not required :-) but is
> more accurate from my point of view.

I didn't understood what was the use of related_cpus in kernel at all earlier..
Sent many mails across lists and didn't got a satisfactory answer.. Searched
kernel source and nobody seemed to be using it (including cpufreq core)..

And when I cleaned up the core finally it made more sense to use it in a
separate way: i.e. have both online and offline cpus in it.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
