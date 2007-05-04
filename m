From: john stultz <johnstul@us.ibm.com>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 04 May 2007 13:37:32 -0700
Message-ID: <1178311052.6094.0.camel@localhost.localdomain>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1423054AbXEDUhh@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

On Fri, 2007-05-04 at 12:16 +0200, Jan Engelhardt wrote:
> Hi,
> 
> 
> I found that setting the cpufreq governor to ondemand making the box 
> lock up solid in 2.6.20.2 and 2.6.21 after a few seconds. Sysrq 
> does not work anymore, and the last messages are:
> 
> May  3 19:16:58 cn kernel: longhaul: VIA C3 'Nehemiah C' [C5P] CPU 
> detected.  Powersaver supported.
> May  3 19:16:58 cn kernel: longhaul: Using northbridge support.
> May  3 19:17:22 cn kernel: Time: acpi_pm clocksource has been installed.
> May  3 19:17:22 cn kernel: Clocksource tsc unstable (delta = -136422685 
> ns)

What happens if you boot wihtout the ondemand governor but w/ clocksource=acpi_pm ? 


thanks
-john

