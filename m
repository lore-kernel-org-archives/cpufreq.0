From: Stephan Diestelhorst <langer_mann@web.de>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Wed, 12 Mar 2008 16:04:04 +0100
Message-ID: <200803121604.05065.langer_mann@web.de>
References: <200803051559.09962.langer_mann@web.de> <200803102226.39044.langer_mann@web.de> <20080311093903.GS25110@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753910AbYCLPFa@vger.kernel.org>
In-Reply-To: <20080311093903.GS25110@elte.hu>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo@elte.hu>
Cc: Andi Kleen <andi@firstfloor.org>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

Ingo Molnar wrote:
> 
> I've applied your patch to  x86.git. 

Many thanks!

> Do you think it's 2.6.25 material? I'm inclined to have it in  
> the 2.6.26 bucket. We could do your first, minimal fix in 2.6.25 and do 
> this second, full fix in 2.6.26.

I am not familiar with the policies regarding the time-frame for
inclusion. So I guess the decision is up to you. I feel that the
changes are fairly small (at least for the first patch) so perhaps
splitting the release as you suggested allows people to get more
confidence in the larger patches with the clobbers and manual ebp
push/pop.

Doing this one step after the other has the additional benefit of
havinga fix for the core problem in fairly soon, so I can continue
using prebuilt distro kernels again, soon. :-) ( I know. I'm just lazy
sometimes. )

Apart from that: Feel free to do as you like, after all this code is
GPL.

Kind regards,
  Stephan
