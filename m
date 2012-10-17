From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Tue, 16 Oct 2012 23:04:36 -0700
Message-ID: <1350453876.3072.23.camel@joe-AO722>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
	 <1350452374.3072.19.camel@joe-AO722>
	 <CAKohpo=LL+wPcb97KNQvHbX0fzhnRBZjPsHXTj1PdYObuVVTgw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=LL+wPcb97KNQvHbX0fzhnRBZjPsHXTj1PdYObuVVTgw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, pdsw-power-team@arm.com

On Wed, 2012-10-17 at 11:25 +0530, Viresh Kumar wrote:
> On 17 October 2012 11:09, Joe Perches <joe@perches.com> wrote:
> > On Wed, 2012-10-17 at 10:50 +0530, Viresh Kumar wrote:
> >> With debug options on, it is difficult to locate cpufreq core's debug prints.
> > []
> >> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > []
> >> @@ -15,6 +15,8 @@
> >> +#define pr_fmt(fmt) "cpufreq: " fmt
[]
> > #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

> Sorry, i am not sure how KBUILD_MODNAME is compiled by kernel.

KBUILD_MODNAME is a #define that is set by scripts/Makefile.lib.

> So, if i try KBUILD_MODNAME with my patch i get prints as:
> 
> KBUILD_MODNAME: <print - text>

I believe you are quoting KBUILD_MODNAME

try

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

This should create prefixes like
	"cpufreq: "
and
	"cpufreq_performance: "

