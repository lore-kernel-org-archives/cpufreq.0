From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 4/4] cpufreq: governor: Implement per policy instances of governors
Date: Mon, 11 Feb 2013 09:46:01 +0530
Message-ID: <CAKohpo=Rk-P_yhvu8WHmpy7UcYqhg4-Y0ragqNMBXgJAB_w4mQ@mail.gmail.com>
References: <cover.1359976493.git.viresh.kumar@linaro.org>
	<b16436f3b3eba648500a287d552efbbf48bcc9bb.1359976493.git.viresh.kumar@linaro.org>
	<51180DA7.8040203@gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <51180DA7.8040203@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Lavra <francescolavra.fl@gmail.com>
Cc: rjw@sisk.pl, Steve.Bannister@arm.com, linaro-dev@lists.linaro.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On 11 February 2013 02:44, Francesco Lavra <francescolavra.fl@gmail.com> wrote:
> dbs_data->tuners is never freed, which means there is a memory leak
> across CPUFREQ_GOV_POLICY_INIT and CPUFREQ_GOV_POLICY_EXIT events.
>
> The same goes for the ondemand governor.

Thanks for pointing out. Would be fixed in next version.
