From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4] cpufreq: fix governor start/stop race condition
Date: Wed, 12 Jun 2013 15:01:23 +0530
Message-ID: <CAKohponeWuaXPah4s9GjO-fLwQNuyKidUFosN1iE+e7bngDPdQ@mail.gmail.com>
References: <1371028189-15758-1-git-send-email-chenxg@marvell.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1371028189-15758-1-git-send-email-chenxg@marvell.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiaoguang Chen <chenxg@marvell.com>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, njiang1@marvell.com, zjwu@marvell.com, ylmao@marvell.com, chenxg.marvell@gmail.com

On 12 June 2013 14:39, Xiaoguang Chen <chenxg@marvell.com> wrote:

>         ret = policy->governor->governor(policy, event);

We again reached to the same problem. We shouldn't call
this between taking locks, otherwise recursive locks problems
would be seen again.
