From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Wed, 26 Jul 2006 13:34:14 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218F09@SAUSEXMB1.amd.com>
References: <200607261854.20670.ak@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161028AbWGZSe0@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <200607261854.20670.ak@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: "Gulam, Nagib" <nagib.gulam@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> > AMD Opteron(tm) Processor 838 stepping 01 CPU 3: Syncing 
> TSC to CPU 0.
> > CPU 3: synchronized TSC with CPU 0 (last diff -109 cycles, 
> maxerr 1024
> 
> Hmm, indeed  - i would have expected higher max errors too.
> It should have worked in theory. No explanation currently.

THat's unfortunate.
 
> > cycles)
> > powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x6
> > powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x8
> > powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa
> > powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12
> > 
> > Is there a better test we can be using?
> 
> I don't know of any. Ok I guess it would be possible to write 
> something in user space, but it would likely look similar to 
> the algorithm the kernel uses.

I ran the following simple test on the 4P system with TSC
gtod for a week:
while true; do date; sleep 3600; done
the first entry went in at July 13 15:39:48, the last entry
at  July 25 15:39:50.  A drift of 2 seconds over 12 days is 
within specification, I believe.

In contrast, the same machine running with TSC and standard
PN! sees massive drift, upwards of an hour, within an hour.

If the TSCnow! patch reduces measured drift down to a second 
a week, would you consider that acceptable?

-Mark Langsdorf
AMD, Inc.



