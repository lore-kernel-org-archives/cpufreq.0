From: Thomas Renninger <trenn@suse.de>
Subject: Re: cpufrequtils error with Core i7 "Haswell" 4771 on Funtoo Linux
Date: Tue, 01 Apr 2014 16:23 +0200
Message-ID: <2804357.TW6KgcJonJ@skinner>
References: <533854CE.7070206@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <533854CE.7070206@libero.it>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Sandro <alcerb1972@libero.it>
Cc: cpufreq@vger.kernel.org

On Sunday, March 30, 2014 07:30:54 PM Sandro wrote:
> Hello, I am a member of Funtoo Linux OS.
> I've written about the problems relating to bugs.funtoo.org cpufrequtils
> with the cpu of my system.
> I read of addressing this email address .......
> I hope I did not disturb you.
> 
> Actually i use kernel:
> 
> ci7ht ~ # uname -a
> Linux ci7ht 3.12.13-gentoo #1 SMP PREEMPT Fri Mar 28 23:54:21 CET 2014
> x86_64 Intel(R) Core(TM) i7-4771 CPU @ 3.50GHz GenuineIntel GNU/Linux
> 
> There are suggestions for this trouble ?

cpufrequtils is outdated for quite some time.
cpupower is the successor (afaik some package it as cpupowerutils).

If you still have problems, best use the original sources:
tools/power/cpupower
from the kernel sources and report problems here and add me to CC.

  Thomas
