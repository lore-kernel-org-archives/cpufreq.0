From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][try 2] architectural pstate driver for powernow-k8
Date: Tue, 9 Oct 2007 19:41:25 -0400
Message-ID: <20071009234125.GB6879@redhat.com>
References: <200710091446.38432.mark.langsdorf@amd.com> <p73fy0k3ve8.fsf@bingen.suse.de> <200710091543.21350.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754650AbXJIXlp@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200710091543.21350.mark.langsdorf@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: Andi Kleen <andi@firstfloor.org>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Tue, Oct 09, 2007 at 03:43:20PM -0500, Mark Langsdorf wrote:
 > This patch should apply cleanly to the 2.6.23-rc8-mm2 kernel. =A0It =
changes=20
 > the powernow-k8 driver code that deals with 3rd generation Opteron, =
Phenom,
 > and later processors to match the architectual pstate driver describ=
ed
 > in the AMD64 Architecture Programmer's Manual Volume 2 Chapter 18. =A0=
The
 > initial implementation of the hardware pstate driver for PowerNow!
 > used some processor-version specific features, and would not be
 > maintainable in the long term as the processor features changed.
 > This architectural driver should work on all future AMD processors.
=20
Has this been tested on older implementations of powernow yet?
I'm happy to merge this and give it some time in -mm, before it
goes to mainline, but if no-one is testing on those older
opterons/turions etc then we're not going to know we regressed
until its too late.   If it hasn't been tested yet, any chance
you can scrounge some up at AMD and give it a spin just to be sure?

Thanks,

	Dave

--=20
http://www.codemonkey.org.uk
