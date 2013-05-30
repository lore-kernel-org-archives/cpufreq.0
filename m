From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 15:44:20 +0000 (UTC)
Message-ID: <20130530154420.E943211F976@bugzilla.kernel.org>
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





--- Comment #9 from Jean-Philippe Halimi <jean-philippe.halimi@exascale-computing.eu>  2013-05-30 15:44:20 ---
> It doesn't make any sense what so ever to keep only one cpu in affected_cpus
> and all cpus 0-7 in related_cpus as that information isn't used by core.
> related cpus comes same as affected cpus in your case because you only have one
> core per domain (virtual domain :) ).. But in case you have more cores in a
> cluster and few of them are offlined, these two will have different values.

I am not arguing for or against the difference between affected_cpus and
related_cpus. For me so far, the difference between the two was:
- affected_cpus was a "list of CPUs that require software coordination of
frequency"
- related_cpus was a "List of CPUs that need some sort of frequency
coordination, whether software or hardware."

This is at least what the official cpufreq Kernel documentation states (see
https://www.kernel.org/doc/Documentation/cpu-freq/user-guide.txt)

There definitely is hardware coordination between the 8 cores of my machine.
Plus we can easily think about future architectures where a single processor
can have distinct frequency domains. So the "frequency domain" notion is not a
trivial question (all the cores of a single processor, or some cores of the
processor), and has been an information Linux has been giving in previous
releases of the kernel (before 3.9). If I get it right, your point is that
losing this information is "more logical", and I am saying that losing this
information is a loss of information. :)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
