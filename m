From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Tue, 11 Mar 2008 10:39:07 +0100
Message-ID: <20080311093903.GS25110@elte.hu>
References: <200803051559.09962.langer_mann@web.de> <200803101605.42251.langer_mann@web.de> <87iqzu8r2q.fsf@basil.nowhere.org> <200803102226.39044.langer_mann@web.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753887AbYCKJjd@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200803102226.39044.langer_mann@web.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Diestelhorst <langer_mann@web.de>
Cc: Andi Kleen <andi@firstfloor.org>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org


* Stephan Diestelhorst <langer_mann@web.de> wrote:

> Please also note that these are not clobbers in the strict inline asm 
> syntax, but rather dummy output values that correspond to actual input 
> parameters. I'd consider this a serious compiler flaw, if not bug, if 
> these would not work. But let's not get into GCC vs. 
> Fancy-inline-asm-hacker flames, like the mplayer folks do ;-)

yep, that's my experience as well - output constraints are pretty robust 
in general, but if one tries the same effect via the clobber list it's 
easy to run into gcc internal errors. I've applied your patch to 
x86.git. Do you think it's 2.6.25 material? I'm inclined to have it in 
the 2.6.26 bucket. We could do your first, minimal fix in 2.6.25 and do 
this second, full fix in 2.6.26.

	Ingo
