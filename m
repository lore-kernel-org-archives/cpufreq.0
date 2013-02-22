From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 4/4] cpufreq: Get rid of "struct global_attr"
Date: Fri, 22 Feb 2013 07:47:44 +0530
Message-ID: <CAKohponQ0MVwbTpM-6MasewMQ7MWcL-3nFjf2d7DpAZbWKsNqw@mail.gmail.com>
References: <cover.1360568193.git.viresh.kumar@linaro.org>
	<ef1aad61936c1ceaa7319953563825534daa7a32.1360568193.git.viresh.kumar@linaro.org>
	<31684733.Z4gjoGKC1g@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <31684733.Z4gjoGKC1g@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, linaro-dev@lists.linaro.org, francescolavra.fl@gmail.com, toddpoynor@google.com

On 22 February 2013 05:15, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> Why did you change all of the lines of this macro instead of changing just the
> one line you needed to change?

I didn't like the indentation used within the macro. So did it.

> Please don't do that.

Okay.
