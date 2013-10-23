From: Melanie Kambadur <melanie@cs.columbia.edu>
Subject: powersave governor runs programs faster and uses more power than
 performance governor
Date: Wed, 23 Oct 2013 19:17:25 -0400
Message-ID: <CAMeUXYuuM4LS2qAhhvQi8VG1bK4eiZjjTikchgHzeqi2EX6=bw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=X495fTBhp62Ucfn/Wjt8hwTPB3U87BTszmrxJDRlZ2Q=;
        b=MWtldtemOD8pix1CFJlnnn3C3jO+42OoS/eSmpxxqAarQKiz68oSL0I3ZbYQIzhZLT
         UxRhfA4LLC/b+IfwzUO3jFWMtFZomdqtPRUQPVbAlSh8n3djzY9AQkDxDaAVw9sNED8x
         1NkYeSb0Qvu/ZNvdWp+337Tz1JirkWWkb71/OwSXQGtR5qhPyHpdWpRs+h5MBYeetbBW
         Q9K9cAKg/qts2brwq4KadEF2EasDLMeqLin/NhtXiB+hnpfEA/McIirQj+//znPk6bI5
         Pl2DhV59X9mJmP4oPAY9meEjGsPQDO5ZU5TRS5yo8AmZPoUKlx50BlSVawa9O7ATseQv
         2z/g==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi all,

I am trying to understand some strange results I've observed using the
3.9.11 kernel version of the powersave cpufreq governor on a Intel
Xeon machine, and hoping you all can help.

More specifically, I am using a 24 core Intel Xeon 2430 machine
running Ubuntu 12.04 and v 3.9.11 of the kernel. As I understand it,
this configuration affords me two cpufreq scaling governors, powersave
and performance. At least these are the options I get by running:
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors

Here's the issue. When I turn on the powersave governor, I have
measured the power consumed to INCREASE relative to the performance
governor. More surprisingly, I consistently see BETTER performance
(i.e., shorter runtimes) with the powersave governor than with the
performance governor for many applications out of a few sets of
commonly used benchmark applications.  I repeated my experiments
several times, even trying different cpuidle governors, and observed
the same trends. To toggle between governors, I have been using the
cpufreq-set -g command and confirming the updates by checking
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor.

From what I've read (e.g., here:
www.kernel.org/doc/Documentation/cpu-freq/governors.txt), the
powersave governor's policy is to statically set the cpu frequency at
the system minimum, whereas the performance governor aims to set the
cpu frequency higher (or, depending on the documentation, at maximum).
However, the fact that applications sped up for the powersave vs. the
performance governor with these policies seemed incorrect to me, so I
investigated further...

I profiled the current system frequency by periodically polling
/sys/devices/system/cpu/cpu${N}/cpufreq/cpuinfo_cur_freq
for all the available "N" values (0-23) on my machine.  I found that
not only does the powersave governor not seem to be running at the
system minimum, it actually seems to be running at a frequency higher
than the performance governor. This would explain why I am seeing
better performance and higher power for the powersave governor, but it
certainly doesn't fit the policy descriptions in the documentation.
Here are the results of my mini experiment:

-Minimum system frequency=1.20 * 10^6
-Maximum system frequency=2.70 * 10^6

Avg. cpu frequency across all CPUs for 30 seconds of...
-Powersave governor with no applications running = 1.77 * 10^6
-Powersave governor with a benchmark app running = 2.23 * 10^6
-Performance governor with no apps running = 1.23 * 10^6
-Performance governor with a benchmark app running = 1.34 * 10^6

Am I misunderstanding the policies of the powersave vs. performance
governor, or is this possibly a system bug?

Thanks for your help.

Sincerely,
Melanie Kambadur
