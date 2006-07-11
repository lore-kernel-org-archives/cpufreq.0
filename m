From: Andi Kleen <ak@suse.de>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change pstate at same time
Date: Tue, 11 Jul 2006 15:51:01 +0200
Message-ID: <200607111551.01444.ak@suse.de>
References: <84EA05E2CA77634C82730353CBE3A84303218EA4@SAUSEXMB1.amd.com> <1152624850.3128.45.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750788AbWGKNws@vger.kernel.org>
In-Reply-To: <1152624850.3128.45.camel@laptopd505.fenrus.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@infradead.org>
Cc: "Langsdorf, Mark" <mark.langsdorf@amd.com>, "Deguara, Joachim" <joachim.deguara@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Tuesday 11 July 2006 15:34, Arjan van de Ven wrote:
> 
> > Customers in the field seem to want to use TSC for gtod,
> > so I want to know how awful an idea that is.
> 
> in userspace or in the kernel?

It has to be in kernel. User space is hopeless.

> And do you happen to know why they don't want to use hpet?

HPET is slow (although not as bad as PM) too and most BIOS don't 
enable it.

-Andi
