From: Andi Kleen <ak@suse.de>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change pstate at same time
Date: Tue, 11 Jul 2006 18:04:28 +0200
Message-ID: <200607111804.28741.ak@suse.de>
References: <Pine.LNX.4.64.0607061519040.9066@solonow.amd.com> <1152623675.3128.41.camel@laptopd505.fenrus.org> <1152634538.18028.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751123AbWGKQEw@vger.kernel.org>
In-Reply-To: <1152634538.18028.23.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Arjan van de Ven <arjan@infradead.org>, Joachim Deguara <joachim.deguara@amd.com>, Mark Langsdorf <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk, vojtech@suse.cz

On Tuesday 11 July 2006 18:15, Alan Cox wrote:
> Ar Maw, 2006-07-11 am 15:14 +0200, ysgrifennodd Arjan van de Ven:
> > if you have per cpu offset and speed, then you don't even need to tie
> > all frequencies together... sounds like the best solution to me..
> 
> CPU clocks on some systems are not stable relative to one another. Doing
> the maths only works if you know the divergence isn't cause by
> independant clock sources

You misunderstood the proposal  (actually there is a prototype, so it's
more than that)

The reason the TSCs need to be synchronized is that gettimeofday always
takes the offset against a global variable set by the last timer interrupt.
So your TSC needs to be synchronized to the CPU of the TSC that runs
the timer interrupt.

If instead the per CPU timers set a cpu local variable then you
can do the offset calculation per CPU. 

The scheduler already uses this trick by keeping sched_clock comparisions
always CPU local.

In practice there are a few more complications, but that's it in a nutshell.

-Andi
