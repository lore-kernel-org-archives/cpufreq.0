From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 211/228] cpufreq: tegra: remove calls to cpufreq_notify_transition()
Date: Mon, 16 Sep 2013 09:57:27 +0530
Message-ID: <CAKohponrJerykspkd0b4wtE2YtPRMpphUW_3ZN0Lg9Q6bNdJRg@mail.gmail.com>
References: <cover.1379063063.git.viresh.kumar@linaro.org>
	<52339729.7030309@wwwdotorg.org>
	<CAKohpono-J-Ohzdn=pbNK+HhXhJ2Lf-UBM7OPynTgAwxLd4F4A@mail.gmail.com>
	<32077984.uYNhUh2ogt@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <32077984.uYNhUh2ogt@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Warren <swarren@nvidia.com>

On 15 September 2013 10:35, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> Well, I guess you can assume that everyone has a chance to review the series
> by now and send it as one patch in the next iteration.

Yeah, that's what I thought..

> A patch that adds 192 lines of code isn't shockingly large by any measure.

It was more about removal of things and the number of files it touches..
But yes, its good for review to send them separately but in the end they can
be merged..
