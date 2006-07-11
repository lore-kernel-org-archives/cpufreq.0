From: Andi Kleen <ak@suse.de>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change pstate at same time
Date: Tue, 11 Jul 2006 15:07:39 +0200
Message-ID: <200607111507.39079.ak@suse.de>
References: <Pine.LNX.4.64.0607061519040.9066@solonow.amd.com> <p73fyhdpqe1.fsf@verdi.suse.de> <1152622554.4489.32.camel@lapdog.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750749AbWGKNHp@vger.kernel.org>
In-Reply-To: <1152622554.4489.32.camel@lapdog.site>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joachim Deguara <joachim.deguara@amd.com>
Cc: Mark Langsdorf <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


>
> Jul 11 21:23:35 gradient kernel: CPU 2: Syncing TSC to CPU 0.
> Jul 11 21:23:35 gradient kernel: CPU 2: synchronized TSC with CPU 0
> (last diff -91 cycles, maxerr 621 cycles)

> Jul 11 21:23:35 gradient kernel: CPU 3: Syncing TSC to CPU 0.
> Jul 11 21:23:35 gradient kernel: CPU 3: synchronized TSC with CPU 0
> (last diff -122 cycles, maxerr 1129 cycles)

This means the CPUs diverged between 500 and 1100 cycles in the night.
This can already cause severe timing problems with the clock going 
backwards if a task switches CPUs - and there are many programs that 
don't like that. If the system is up longer it will be worse.

The only way to possibly make the concept work would be regular TSC resyncs
during runtime, but I think I would prefer using per CPU TSC offsets
using RDTSCP instead because they should be able to tolerate arbitary
shifts.

-Andi
