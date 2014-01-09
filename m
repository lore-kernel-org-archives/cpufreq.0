From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V3 Resend] cpufreq: create cpufreq_generic_get() routine
Date: Thu, 9 Jan 2014 20:14:19 +0530
Message-ID: <CAKohpo=rUjaJ8XapkS6uCONNSTrF2udLPo=H+Q+QGTTTzfLbSw@mail.gmail.com>
References: <d9239e0a5df99392647ff8343673342f89d09476.1389059568.git.viresh.kumar@linaro.org>
	<CAOesGMgfFVoVJpOMXWtzVWj_F4pD-L9Osyv4u6=c8RUWOoLHFw@mail.gmail.com>
	<CAKohpo=EsaBPdF3wYsa2rEdjcpPagbhPcxWw1_PA=yVLDnjRiA@mail.gmail.com>
	<20140109113300.GA27432@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20140109113300.GA27432@n2100.arm.linux.org.uk>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fengguang Wu <fengguang.wu@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 9 January 2014 17:03, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> No, it implements only what it's clk API implementation requires.

I understand that platform specific parts/drivers aren't using anything
outside of the clk API's currently implemented. But then there are
generic parts of kernel which are free to use this routine. They
may or may not call it on that particular platform, which is currently
happening for SA1100. And so I feel that we need to have dummy
APIs like clk.h in there, as they wouldn't harm at all or break any
existing stuff.

> I've no idea at the moment, and I don't have time to look at this.

Okay. I will go ahead with dummy implementations for now. See
if you can give that a short review.

Thanks.
