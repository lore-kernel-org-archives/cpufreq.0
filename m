From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Wed, 29 May 2013 06:07:46 +0000 (UTC)
Message-ID: <20130529060746.15B9E11FADB@bugzilla.kernel.org>
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


Viresh Kumar <viresh.kumar@linaro.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |viresh.kumar@linaro.org




--- Comment #1 from Viresh Kumar <viresh.kumar@linaro.org>  2013-05-29 06:07:45 ---
(In reply to comment #0)
> Since then, the related_cpus file in
> /sys/devices/system/cpu/cpu*/cpufreq/related_cpus just returns the id of the
> current core:
> 
> /sys/devices/system/cpu/cpu0/cpufreq/related_cpus contains 0
> /sys/devices/system/cpu/cpu6/cpufreq/related_cpus contains 6 etc

Yes this is changed recently in kernel...
Now, affected cpus contain: All online cpus that share clock line
related_cpus contain: All online+offline cpus that share clock line

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
