From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] drivers: cpufreq: Mark function as static in cpufreq.c
Date: Mon, 3 Mar 2014 05:59:13 +0530
Message-ID: <CAKohpont=VTHJdUz4UFtrZtRnkFfUGRrnq3zgvm5sW6ukTRLiQ@mail.gmail.com>
References: <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com>
	<20140226164142.GA18079@thin>
	<CAMpEsFFjR2e_kDn9-QuKcS3RjsSmru9XGjXqXXdO7sYeWdh9dw@mail.gmail.com>
	<20140226170847.GA18427@thin>
	<CAKohpomqu22Pt5_wYV3u2uC36AgfmrkvxLtJCGakdodEQFE-jQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpomqu22Pt5_wYV3u2uC36AgfmrkvxLtJCGakdodEQFE-jQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rashika Kheria <rashika.kheria@gmail.com>
Cc: josh@joshtriplett.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 27 February 2014 10:55, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Hi Rashika,
>
> On 26 February 2014 22:08, Rashika Kheria <rashika.kheria@gmail.com> wrote:
>> Mark function as static in cpufreq.c because it is not
>> used outside this file.
>>
>> This eliminates the following warning in cpufreq.c:
>> drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for 'show_boost' [-Wmissing-prototypes]
>
> Can you please elaborate how this warning is related to
> the non-static definition of this function?

Ping!!
