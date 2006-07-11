From: Arjan van de Ven <arjan@infradead.org>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to change
	pstate at same time
Date: Tue, 11 Jul 2006 15:34:10 +0200
Message-ID: <1152624850.3128.45.camel@laptopd505.fenrus.org>
References: <84EA05E2CA77634C82730353CBE3A84303218EA4@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750766AbWGKNeP@vger.kernel.org>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218EA4@SAUSEXMB1.amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: Andi Kleen <ak@suse.de>, "Deguara, Joachim" <joachim.deguara@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


> Customers in the field seem to want to use TSC for gtod,
> so I want to know how awful an idea that is.

in userspace or in the kernel? And do you happen to know why they don't
want to use hpet?

Greetings,
    Arjan van de Ven
