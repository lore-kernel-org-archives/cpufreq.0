From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Fri, 7 Jul 2006 12:36:20 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218E99@SAUSEXMB1.amd.com>
References: <p73fyhdpqe1.fsf@verdi.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932162AbWGGSdt@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <p73fyhdpqe1.fsf@verdi.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ak@suse.de
Cc: discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> > the "powernow-k8.tscsync=1" options enables simeltameous 
> transitions.  
> > Other options are necessary to force the use of TSC as a 
> gtod source.
> > 
> > This patch should apply cleanly to the 2.6.18-rc1 kernel.
> 
> Your patch seems to be ^M damaged.

I'll smack my mailer around again.  Sorry about that.
 
> I'm still dubious if the result is really correct if the 
> hardware wasn't designed to guarantee synchronous TSC operation.
> 
> Can you do the following test please? 

We'll try to have the results back by Monday evening.

-Mark Langsdorf
AMD, Inc.

