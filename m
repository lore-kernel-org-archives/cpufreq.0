From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: cpufreq longhaul locks up
Date: Fri, 4 May 2007 12:16:21 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1423592AbXEDKRL@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

Hi,


I found that setting the cpufreq governor to ondemand making the box 
lock up solid in 2.6.20.2 and 2.6.21 after a few seconds. Sysrq 
does not work anymore, and the last messages are:

May  3 19:16:58 cn kernel: longhaul: VIA C3 'Nehemiah C' [C5P] CPU 
detected.  Powersaver supported.
May  3 19:16:58 cn kernel: longhaul: Using northbridge support.
May  3 19:17:22 cn kernel: Time: acpi_pm clocksource has been installed.
May  3 19:17:22 cn kernel: Clocksource tsc unstable (delta = -136422685 
ns)

I have also tried 2.6.20.2 in single-user mode (so that I can have 
the disk readonly), and it take a little longer (magnitude: minutes) 
to lock up; not sure if it's 20.2 or the single-user mode but I suspect 
the latter since nothing is running then that could potentially 
contribute to quickly changing workloads/frequencies.

If you need more info, please let me know.


Thanks,
Jan
-- 
