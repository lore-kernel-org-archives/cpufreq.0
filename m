From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V3 Resend] cpufreq: create cpufreq_generic_get() routine
Date: Thu, 9 Jan 2014 20:15:55 +0530
Message-ID: <CAKohpokTfpQFZM-QzLVBKZGRe66NxXpHmGwBzQKD+O3_pS_nsg@mail.gmail.com>
References: <d9239e0a5df99392647ff8343673342f89d09476.1389059568.git.viresh.kumar@linaro.org>
	<CAOesGMgfFVoVJpOMXWtzVWj_F4pD-L9Osyv4u6=c8RUWOoLHFw@mail.gmail.com>
	<CAKohpo=EsaBPdF3wYsa2rEdjcpPagbhPcxWw1_PA=yVLDnjRiA@mail.gmail.com>
	<1645387.93uAkEaqro@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1645387.93uAkEaqro@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Olof Johansson <olof@lixom.net>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fengguang Wu <fengguang.wu@intel.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 9 January 2014 17:41, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> Well, if build is broken, it *always* is the fault of the commit that
> introduced the breakage, even if that is a result of someone else doing
> things incorrectly.  Why?  Because it potentially breaks bisection for
> people and *that* is a big deal.

Agree :)

> So yes, I'm going to revert it.  Please resubmit after you've addressed the
> build breakage.

Will do that shortly.
