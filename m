From: David C Niemi <dniemi@verisign.com>
Subject: Re: powersave governor runs programs faster and uses more power than
 performance governor
Date: Thu, 24 Oct 2013 09:56:11 -0400
Message-ID: <526926FB.7010505@verisign.com>
References: <CAMeUXYuuM4LS2qAhhvQi8VG1bK4eiZjjTikchgHzeqi2EX6=bw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAMeUXYuuM4LS2qAhhvQi8VG1bK4eiZjjTikchgHzeqi2EX6=bw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Melanie Kambadur <melanie@cs.columbia.edu>
Cc: cpufreq@vger.kernel.org

Melanie,

By "Xeon 2430", I take it you mean dual E5-2430 CPUs in a 2-socket server or workstation?  What brand and model of machine is this in?

There is a good chance your machine's BIOS is overriding the intentions of your p-state governor and doing whatever it feels like.  Both Dell and HP default to firmware-based governors vaguely like "ondemand" but less effective.  If the firmware is calling the shots, it could explain what you are seeing.  It would be worth seeing what your power management settings are in the BIOS, looking at what p-state driver you are using (e.g. acpi-cpufreq), and see what frequency your CPUs are really running at (the utility i7z may be able to help you if, like on some Dell BIOS settings, cpufreq cannot see the current frequency reliably).

Your kernel is also rather odd if it has only the "powersave" and "performance" governors, which are not even really governors but rather static clock speed settings.  Ondemand is usually a good choice for servers, and can be configured to match the performance of the "performance" governor while consuming less power at idle.  Note that "performance" is sometimes not a very good way to get max performance, as it forces idle cores to run fast which eats up your power envelope unproductively, giving your busy cores less ability to go into boost.  Preventing the use of C1E is likewise usually a bad idea for the same reason, and typically makes power consumption go through the roof.

DCN

On 10/23/13 19:17, Melanie Kambadur wrote:
> Hi all,
>
> I am trying to understand some strange results I've observed using the
> 3.9.11 kernel version of the powersave cpufreq governor on a Intel
> Xeon machine, and hoping you all can help.
>
> More specifically, I am using a 24 core Intel Xeon 2430 machine
> running Ubuntu 12.04 and v 3.9.11 of the kernel. As I understand it,
> this configuration affords me two cpufreq scaling governors, powersave
> and performance. At least these are the options I get by running:
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
>
> Here's the issue. When I turn on the powersave governor, I have
> measured the power consumed to INCREASE relative to the performance
> governor. More surprisingly, I consistently see BETTER performance
> (i.e., shorter runtimes) with the powersave governor than with the
> performance governor for many applications out of a few sets of
> commonly used benchmark applications.  I repeated my experiments
> several times, even trying different cpuidle governors, and observed
> the same trends. To toggle between governors, I have been using the
> cpufreq-set -g command and confirming the updates by checking
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor.
>
> From what I've read (e.g., here:
> www.kernel.org/doc/Documentation/cpu-freq/governors.txt), the
> powersave governor's policy is to statically set the cpu frequency at
> the system minimum, whereas the performance governor aims to set the
> cpu frequency higher (or, depending on the documentation, at maximum).
> However, the fact that applications sped up for the powersave vs. the
> performance governor with these policies seemed incorrect to me, so I
> investigated further...
>
> I profiled the current system frequency by periodically polling
> /sys/devices/system/cpu/cpu${N}/cpufreq/cpuinfo_cur_freq
> for all the available "N" values (0-23) on my machine.  I found that
> not only does the powersave governor not seem to be running at the
> system minimum, it actually seems to be running at a frequency higher
> than the performance governor. This would explain why I am seeing
> better performance and higher power for the powersave governor, but it
> certainly doesn't fit the policy descriptions in the documentation.
> Here are the results of my mini experiment:
>
> -Minimum system frequency=1.20 * 10^6
> -Maximum system frequency=2.70 * 10^6
>
> Avg. cpu frequency across all CPUs for 30 seconds of...
> -Powersave governor with no applications running = 1.77 * 10^6
> -Powersave governor with a benchmark app running = 2.23 * 10^6
> -Performance governor with no apps running = 1.23 * 10^6
> -Performance governor with a benchmark app running = 1.34 * 10^6
>
> Am I misunderstanding the policies of the powersave vs. performance
> governor, or is this possibly a system bug?
>
> Thanks for your help.
>
> Sincerely,
> Melanie Kambadur

