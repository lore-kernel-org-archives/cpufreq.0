From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Wed, 12 Jul 2006 11:11:38 -0500
Message-ID: <B3870AD84389624BAF87A3C7B831499302935A76@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751449AbWGLQL7@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Deguara, Joachim" <joachim.deguara@amd.com>, Andi Kleen <ak@suse.de>
Cc: "Langsdorf, Mark" <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Wednesday, July 12, 2006 9:06 AM Joachim Deguara wrote:

> Here are the further findings after letting the machine toggle between
> 1GHz and 2.2Ghz every two seconds for roughly 24 hours.  Unfortunately
> there is an oops after bringing CPU2 online and CPU3 will not come
> online.  Still the differences in TSC are not bad:

Can I get more information on how to reproduce the Oops? Kernel version?
.config? your hardware?

I have run basic set of CPU Hotplug on/offline tests, and I could not
reproduce it..

-Jacob Shin
AMD, Inc.

