From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 changepstate at same time
Date: Thu, 13 Jul 2006 09:40:46 -0500
Message-ID: <B3870AD84389624BAF87A3C7B831499302935A88@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964779AbWGMOlH@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Deguara, Joachim" <joachim.deguara@amd.com>, Pavel Machek <pavel@suse.cz>
Cc: Andi Kleen <ak@suse.de>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk, Bhavana Nagendra <bnagendr@redhat.com>

On Thursday, July 13, 2006 9:32 AM Deguara, Joachim wrote:

> parallel sounds fun, but I don't get it.  Two machine or trying to go
> online and offline at the same time?  Firestorming two busy parallel
> while loops, one turning the core offline and the other online, did
> not bring an oops so I guess this kernel is in the clear in that
> regard. 
>
> I can't get it to crash again and I am afraid that it crashed under an
> old devel kernel.  After another ~20 hour test with heavy freq changes
> with the tscsync patch

There were several different issues w/ powernow + cpu hotplug in the
past.  Good to hear that the latest kernel doesn't oops.. I believe 
cpu hotplug is needed for suspend to work..

