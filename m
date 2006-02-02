From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: powernow-k8: out of sync on Athlon64 x2 3800+
Date: Thu, 2 Feb 2006 11:36:05 -0600
Message-ID: <B3870AD84389624BAF87A3C7B831499302935525@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750811AbWBBRhe@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, "Langsdorf, Mark" <mark.langsdorf@amd.com>, Niklas Edmundsson <Niklas.Edmundsson@hpc2n.umu.se>, Andreas.Burghart@fujitsu-siemens.com

On Thursday, February 02, 2006 12:38 AM Andi Kleen wrote:
> It's in 2.6.16-rc1. If you think it's critical I can propose it for 2.6.15
> stable too.

Yes, please do propose it for 2.6.15 as well.

It is critical in my opinion.  It affects all i386 kernel running AMD Dual-Core processors.  It affects any code that relies on cpu_core_id and phys_proc_id data.

I believe the bug has been around since 2.6.13.  I am surprised no one raised red flags until now.  Maybe everyone using dual core processors migrated to x86_64.  ;-)

Thanks Andi,

-Jacob Shin
AMD, Inc.
