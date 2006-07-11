From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change
	pstate at same time
Date: Tue, 11 Jul 2006 17:15:38 +0100
Message-ID: <1152634538.18028.23.camel@localhost.localdomain>
References: <Pine.LNX.4.64.0607061519040.9066@solonow.amd.com>
	 <p73fyhdpqe1.fsf@verdi.suse.de> <1152622554.4489.32.camel@lapdog.site>
	 <200607111507.39079.ak@suse.de>
	 <1152623675.3128.41.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751083AbWGKP6F@vger.kernel.org>
In-Reply-To: <1152623675.3128.41.camel@laptopd505.fenrus.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@infradead.org>
Cc: Andi Kleen <ak@suse.de>, Joachim Deguara <joachim.deguara@amd.com>, Mark Langsdorf <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Ar Maw, 2006-07-11 am 15:14 +0200, ysgrifennodd Arjan van de Ven:
> if you have per cpu offset and speed, then you don't even need to tie
> all frequencies together... sounds like the best solution to me..

CPU clocks on some systems are not stable relative to one another. Doing
the maths only works if you know the divergence isn't cause by
independant clock sources
