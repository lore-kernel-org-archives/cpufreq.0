From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Fri, 11 Apr 2014 12:52:20 +0000
Message-ID: <bug-73781-12968-TOm8ebfrSH@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

--- Comment #7 from KATO Hiroshi <katoh@mikage.ne.jp> ---
(In reply to Viresh Kumar from comment #3)

Thank you for your kindness. I built revert patched drivers/cpufreq, 
and unfortunately the problem has not been solved yet.

I also overwrite drivers/cpufreq with 3.13.8's one, the same problem happens.
So maybe cpufreq does not relate to this.


(In reply to Lukasz Majewski from comment #4)

> Why the "No such device" error show up? This is strange.
>I suppose, that the acpi_cpufreq.ko module was built correctly.

I use an ArchLinux package kernel. And never heard a similar problem
on the bts of archlinux. So I think acpi_cpufreq.ko module was built correctly.

> Also, I've noticed, that the p4-clockmod is also inserted. Could you
> compile it in and left the acpi-cpufreq to be inserted as a standalone module?

When I was searching the solution, I found a tweet of somebody who may be
worrying the same problem.
Though unlike me he uses c2d, he wrote that only p4-clockmod could be used. So
I gave it a try. 

inserted modules 3.13.8
https://bugzilla.kernel.org/attachment.cgi?id=131921
inserted modules 3.14
https://bugzilla.kernel.org/attachment.cgi?id=131931

-- 
You are receiving this mail because:
You are the assignee for the bug.
