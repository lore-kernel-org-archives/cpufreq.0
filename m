From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change
	pstate at same time
Date: Tue, 11 Jul 2006 15:14:35 +0200
Message-ID: <1152623675.3128.41.camel@laptopd505.fenrus.org>
References: <Pine.LNX.4.64.0607061519040.9066@solonow.amd.com>
	 <p73fyhdpqe1.fsf@verdi.suse.de> <1152622554.4489.32.camel@lapdog.site>
	 <200607111507.39079.ak@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750980AbWGKNOn@vger.kernel.org>
In-Reply-To: <200607111507.39079.ak@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Joachim Deguara <joachim.deguara@amd.com>, Mark Langsdorf <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


> 
> The only way to possibly make the concept work would be regular TSC resyncs
> during runtime, but I think I would prefer using per CPU TSC offsets
> using RDTSCP instead because they should be able to tolerate arbitary
> shifts.

if you have per cpu offset and speed, then you don't even need to tie
all frequencies together... sounds like the best solution to me..
