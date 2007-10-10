From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH][try 2] architectural pstate driver for powernow-k8
Date: Wed, 10 Oct 2007 12:06:28 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02077087@SAUSEXMB1.amd.com>
References: <200710091446.38432.mark.langsdorf@amd.com>
 <p73fy0k3ve8.fsf@bingen.suse.de>
 <200710091543.21350.mark.langsdorf@amd.com>
 <20071009234125.GB6879@redhat.com>
 <20071010163518.GB6443@alberich.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756432AbXJJRHB@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <20071010163518.GB6443@alberich.amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Herrmann3, Andreas" <Andreas.Herrmann3@amd.com>, Dave Jones <davej@redhat.com>, Andi Kleen <andi@firstfloor.org>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

> > Has this been tested on older implementations of powernow yet?
> > I'm happy to merge this and give it some time in -mm, before it
> > goes to mainline, but if no-one is testing on those older
> > opterons/turions etc then we're not going to know we regressed
> > until its too late.   If it hasn't been tested yet, any chance
> > you can scrounge some up at AMD and give it a spin just to be sure?
> 
> 
> I'd like to see this driver in the next kernel release.

Thanks, Andreas.

> So I have done some tests with this code - based on kernel 
> version 2.6.23. I have tested it on Athlon 64 X2, Athlon 64,
> Turion X2 and some other parts
> (e.g.family 0x10) and with different cpufreq governors.
> I did not observe any problems with this driver update.
> Behaviour is the same as before.

I've also been running it on my Turion X2 laptop for a 
few weeks without issues.  It doesn't touch the legacy
code path at all.  

 
> So please consider to add the attached patch for 2.6.24.
> Patch is against current Linus' git tree. This means the patch
> "[CPUFREQ] Support different families in fid/did to frequency 
> conversion" which is contained in the cpufreq.git should
> be ommitted. The issue fixed with that patch is solved
> with this driver update, too.

Either patch is acceptable; I think they're fundamentally
identical anyway.

-Mark Langsdorf
Operating System Research Center
AMD

