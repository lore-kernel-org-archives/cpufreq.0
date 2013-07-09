From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/6] cpufreq: Add 'load_table' debugfs file to show
 colleced CPUs load
Date: Tue, 9 Jul 2013 12:20:02 +0530
Message-ID: <CAKohpokzn4jrO3rr8pjzwd4Xn+0umOK-sMANV2Fj5xn6UhBHVg@mail.gmail.com>
References: <1373014001-17746-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1373014001-17746-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: rjw@sisk.pl, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, kyungmin.park@samsung.com, myungjoo.ham@samsung.com

On 5 July 2013 14:16, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> Second, previous performance/powersave governor haven't calculated CPUs load
> becuase these governor didn't change CPU frequency according to CPUs load. But,
> load_table debugfs file always should indicate the collected CPUs data regardless
> of the kind of cpufreq governor. So, the patch3/4/5 implement that performance/
> powersave governor will check periodically CPUs load by calling dbs_check_cpu()
> with timer.

I raised a query on how can we call dbs_check_cpu() from
performance/powersave? Also, calling this routine will degrade
performance without any sense. So, I vote not for doing it.
