From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Tue, 11 Jul 2006 08:31:44 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218EA4@SAUSEXMB1.amd.com>
References: <200607111507.39079.ak@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750761AbWGKNbx@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <200607111507.39079.ak@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>, "Deguara, Joachim" <joachim.deguara@amd.com>
Cc: discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> > Jul 11 21:23:35 gradient kernel: CPU 2: Syncing TSC to CPU 0.
> > Jul 11 21:23:35 gradient kernel: CPU 2: synchronized TSC with CPU 0 
> > (last diff -91 cycles, maxerr 621 cycles)
> 
> > Jul 11 21:23:35 gradient kernel: CPU 3: Syncing TSC to CPU 0.
> > Jul 11 21:23:35 gradient kernel: CPU 3: synchronized TSC with CPU 0 
> > (last diff -122 cycles, maxerr 1129 cycles)
> 
> This means the CPUs diverged between 500 and 1100 cycles in the night.
> This can already cause severe timing problems with the clock 
> going backwards if a task switches CPUs - and there are many 
> programs that don't like that. If the system is up longer it 
> will be worse.

Joachim -

Can you run Andi's test without changing PN! frequency?
I'd like to see a baseline for how bad TSC is by itself,
and whether the TSCnow! code is making the problem worse
or better.

Customers in the field seem to want to use TSC for gtod,
so I want to know how awful an idea that is.

> The only way to possibly make the concept work would be 
> regular TSC resyncs during runtime, but I think I would 
> prefer using per CPU TSC offsets using RDTSCP instead because 
> they should be able to tolerate arbitary shifts.

I would prefer that, too, but I don't have the resources
to code that solution in the timeframe I have available.

-Mark Langsdorf
AMD, Inc.

