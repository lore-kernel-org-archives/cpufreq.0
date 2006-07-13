From: "Joachim Deguara" <joachim.deguara@amd.com>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Thu, 13 Jul 2006 16:32:12 +0200
Message-ID: <1152801132.4519.10.camel@lapdog.site>
References: <B3870AD84389624BAF87A3C7B831499302935A76@SAUSEXMB2.amd.com>
 <20060713130604.GC8230@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030193AbWGMOdo@vger.kernel.org>
In-Reply-To: <20060713130604.GC8230@ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@suse.cz>
Cc: "shin, jacob" <jacob.shin@amd.com>, Andi Kleen <ak@suse.de>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Thu, 2006-07-13 at 13:06 +0000, Pavel Machek wrote:
> Can you run two such tests *in parallel*? That seemed to break it
> really quickly.
parallel sounds fun, but I don't get it.  Two machine or trying to go
online and offline at the same time?  Firestorming two busy parallel
while loops, one turning the core offline and the other online, did not
bring an oops so I guess this kernel is in the clear in that regard.

I can't get it to crash again and I am afraid that it crashed under an
old devel kernel.  After another ~20 hour test with heavy freq changes
with the tscsync patch

CPU 1: Syncing TSC to CPU 0.
CPU 1: synchronized TSC with CPU 0 (last diff 4 cycles, maxerr 499
cycles)
...
CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -105 cycles, maxerr 600
cycles)
...
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -122 cycles, maxerr 1126
cycles)


after 5 hours of no PowerNow!

CPU 1: Syncing TSC to CPU 0.
CPU 1: synchronized TSC with CPU 0 (last diff -3 cycles, maxerr 598
cycles)
...
CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -124 cycles, maxerr 1129
cycles)
...
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -124 cycles, maxerr 1127
cycles)


huh?? I don't understand but it does not matter what I do or how long I
do it, the difference looks to always be about the same.  

-joachim


