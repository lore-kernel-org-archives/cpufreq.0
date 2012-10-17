From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Wed, 17 Oct 2012 15:09:58 +0530
Message-ID: <CAKohpom0Jk+DqAKXz_KWJhpdVAmmXWA2Tr97OpK6=Ke8+KrW8g@mail.gmail.com>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
	<507E797C.1010204@arm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <507E797C.1010204@arm.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: "rjw@sisk.pl" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, PDSW-power-team <PDSW-power-team@arm.com>

On 17 October 2012 14:55, Sudeep KarkadaNagesha
<Sudeep.KarkadaNagesha@arm.com> wrote:
> With CONFIG_DYNAMIC_DEBUG, you can control(enable/disable) debug
> prints at different levels (file, module, line, function)

Quickly went through this :)
http://www.kernel.org/doc/ols/2009/ols2009-pages-39-46.pdf

My usecase is a bit different. I want to see all bootprints with
cpufreq pr_debug
prints. So, this prefixing will help there.

Also, i am not sure if dynamic debug will help in boot prints too?

--
viresh
