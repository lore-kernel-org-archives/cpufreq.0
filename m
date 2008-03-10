From: Stephan Diestelhorst <langer_mann@web.de>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Mon, 10 Mar 2008 22:26:38 +0100
Message-ID: <200803102226.39044.langer_mann@web.de>
References: <200803051559.09962.langer_mann@web.de> <200803101605.42251.langer_mann@web.de> <87iqzu8r2q.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756941AbYCJV0x@vger.kernel.org>
In-Reply-To: <87iqzu8r2q.fsf@basil.nowhere.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <andi@firstfloor.org>
Cc: Ingo Molnar <mingo@elte.hu>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

Andi Kleen wrote:
> Stephan Diestelhorst <langer_mann@web.de> writes:
> > 
> > New attempt with full clobbers, note that I deliberatly did not change
> > the order of the output registers. Real output operands still preceede
> > outputs used for potential clobbering.
> > 
> > I'm not too sure about the EBP push/pop frame, but as folks pointed
> > out already, we should not trust the SMI code too much.
> 
> Be careful -- older gcc versions tend to abort for inline asm
> that clobbers too many registers. Especially when the register
> is already used (like ebp in a frame pointer enabled kernel) 

AFAIK clobbering ebp is silently ignored on the GCCs I've tried it
on (regardles of frame-pointer ommission). Hence there is a hard-coded
push & pop for that register.

Please also note that these are not clobbers in the strict inline asm
syntax, but rather dummy output values that correspond to actual
input parameters. I'd consider this a serious compiler flaw, if not
bug, if these would not work. But let's not get into GCC vs.
Fancy-inline-asm-hacker flames, like the mplayer folks do ;-)

> Make sure it at least works on the oldest supported gcc version 
> (gcc 3.2) and with frame pointer on.

As I've said, I do not expect this to be problematic, but will test,
just to be sure! 

> For asms with so many clobbers explicit push/pop is usually safer.

Yes, but it is unneccessary overhead as the compiler can (should!)
find more elegant ways to get those registers back if needed.

Regards,
  Stephan
