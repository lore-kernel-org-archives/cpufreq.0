From: Stephan Diestelhorst <langer_mann@web.de>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Thu, 6 Mar 2008 09:38:19 +0100
Message-ID: <200803060938.20944.langer_mann@web.de>
References: <200803051559.09962.langer_mann@web.de> <20080305153520.GB19300@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762832AbYCFIih@vger.kernel.org>
In-Reply-To: <20080305153520.GB19300@elte.hu>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo@elte.hu>
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On, March 5th 2008 16:35:20 Ingo Molnar wrote:
> * Stephan Diestelhorst <langer_mann@web.de> wrote:
> > @@ -184,7 +184,7 @@ static void speedstep_set_state (unsigne
> >  		__asm__ __volatile__(
> >  			"movl $0, %%edi\n"
> >  			"out %%al, (%%dx)\n"
> > -			: "=b" (new_state), "=D" (result)
> > +			: "=b" (new_state), "=D" (result), "=c" (ecx_clobber)
> >
> >  			: "a" (command), "b" (function), "c" (state), "d" (smi_port),
> >  			: "S" (0)
> >
> >  			);
>
> stupid suggestion: why not do a pusha/popa around those
> instructions, to make sure everything is restored? This isnt a
> fastpath and being conservative about SMI side-effects cannot hurt

That sounds like a sane thing to do to me. Should I provide a 'patch'? 
Or leave that (and the decision about it) to the maintainer?

Regards,
  Stephan
