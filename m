From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: 10 Mar 2008 17:46:37 +0100
Message-ID: <87iqzu8r2q.fsf@basil.nowhere.org>
References: <200803051559.09962.langer_mann@web.de>
	<200803060951.12002.langer_mann@web.de>
	<20080306105603.GL13391@elte.hu>
	<200803101605.42251.langer_mann@web.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754964AbYCJQqu@vger.kernel.org>
In-Reply-To: <200803101605.42251.langer_mann@web.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Diestelhorst <langer_mann@web.de>
Cc: Ingo Molnar <mingo@elte.hu>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

Stephan Diestelhorst <langer_mann@web.de> writes:
> 
> New attempt with full clobbers, note that I deliberatly did not change
> the order of the output registers. Real output operands still preceede
> outputs used for potential clobbering.
> 
> I'm not too sure about the EBP push/pop frame, but as folks pointed
> out already, we should not trust the SMI code too much.

Be careful -- older gcc versions tend to abort for inline asm
that clobbers too many registers. Especially when the register
is already used (like ebp in a frame pointer enabled kernel) 

Make sure it at least works on the oldest supported gcc version 
(gcc 3.2) and with frame pointer on.

For asms with so many clobbers explicit push/pop is usually safer.

-Andi
