From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Tue, 16 Oct 2012 23:26:52 -0700
Message-ID: <1350455212.3072.27.camel@joe-AO722>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
	 <1350452374.3072.19.camel@joe-AO722>
	 <CAKohpo=LL+wPcb97KNQvHbX0fzhnRBZjPsHXTj1PdYObuVVTgw@mail.gmail.com>
	 <1350453876.3072.23.camel@joe-AO722>
	 <CAKohpom6xHUmu2uYijdNVJHj6sFwJhYUYvXy+dN1a+WqzqTjZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpom6xHUmu2uYijdNVJHj6sFwJhYUYvXy+dN1a+WqzqTjZA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, pdsw-power-team@arm.com

On Wed, 2012-10-17 at 11:47 +0530, Viresh Kumar wrote:
> On 17 October 2012 11:34, Joe Perches <joe@perches.com> wrote:
> > I believe you are quoting KBUILD_MODNAME
> 
> Yes. :(
> Far better output with this. Thanks.

Oh good, but please use a space between KBUILD_MODNAME
and the quoted ": ".

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

look at:
$ git grep -E -h "pr_fmt.*KBUILD_MODNAME" *|sort|uniq -c|sort -rn


