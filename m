From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: Only do governor start after successful stop
Date: Wed, 14 Aug 2013 10:53:48 +0530
Message-ID: <CAKohponW5GwnrL8EktnWb-U5V=eOFQQkbZrx=QgUpfuci3v-0w@mail.gmail.com>
References: <1376377766-2594-1-git-send-email-chenxg@marvell.com>
	<1376377766-2594-2-git-send-email-chenxg@marvell.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1376377766-2594-2-git-send-email-chenxg@marvell.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiaoguang Chen <chenxg@marvell.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Xiaoguang Chen <chenxg.marvell@gmail.com>

On 13 August 2013 12:39, Xiaoguang Chen <chenxg@marvell.com> wrote:
> cpufreq_add_policy_cpu, __cpufreq_remove_dev and __cpufreq_set_policy
> have operations for governor stop and start.
> Only do the start operation when the previous stop operation succeeds.
>
> Signed-off-by: Xiaoguang Chen <chenxg@marvell.com>
> ---
>  drivers/cpufreq/cpufreq.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)

I hope you have seen this patch, which is already in Rafael's tree?

https://lkml.org/lkml/2013/8/6/357
