From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 15:53:55 +0000 (UTC)
Message-ID: <20130530155355.9C4A411FACF@bugzilla.kernel.org>
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





--- Comment #10 from Viresh Kumar <viresh.kumar@linaro.org>  2013-05-30 15:53:55 ---
(In reply to comment #9)
> I am not arguing for or against the difference between affected_cpus and
> related_cpus.

I understand.

> For me so far, the difference between the two was:
> - affected_cpus was a "list of CPUs that require software coordination of
> frequency"
> - related_cpus was a "List of CPUs that need some sort of frequency
> coordination, whether software or hardware."
> 
> This is at least what the official cpufreq Kernel documentation states (see
> https://www.kernel.org/doc/Documentation/cpu-freq/user-guide.txt)

You need to check the latest ones:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/cpu-freq/user-guide.txt?id=refs/tags/v3.9

> There definitely is hardware coordination between the 8 cores of my machine.
> Plus we can easily think about future architectures where a single processor
> can have distinct frequency domains. So the "frequency domain" notion is not a
> trivial question (all the cores of a single processor, or some cores of the
> processor), and has been an information Linux has been giving in previous
> releases of the kernel (before 3.9). If I get it right, your point is that
> losing this information is "more logical", and I am saying that losing this
> information is a loss of information. :)

Why I removed it was: "Nobody is making use of this information and was turning
out to be more misleading".. As "hardware" for kernel is whatever is present
below kernel layer.. So, if the layers below linux don't want to hide that
information, let it be.

But yes, if we have broken something with that change it must be fixed. But
that is not the case. It is just that you saw different values in it with
latest kernels and got worried about if something went wrong.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
