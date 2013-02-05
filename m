From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 5/6] cpufreq: balance out cpufreq_cpu_{get,put} for
 scaling drivers using setpolicy
Date: Tue, 5 Feb 2013 12:33:58 +0530
Message-ID: <CAKohpokWOEDS9BeKgH8NapdBDxhxg0f0CMYHsLvACg4woTvmew@mail.gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
	<1359744343-18690-9-git-send-email-dirk.brandewie@gmail.com>
	<CAOh2x=mU8+mJmr=BXjSLaz7Yxg--t2mPpsc_=Xry2ArNroB8Aw@mail.gmail.com>
	<510FFD2C.90902@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <510FFD2C.90902@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On 4 February 2013 23:55, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
> Hi Viresh,
>
> I have rebased onto bleeding-edge when I reboot the system I get a kernel
> panic.
> Any idea what I could have done that would have broken the restructured
> cpufreq_{add/remove}_dev.

Dirk, there are two mail chains for similar issue. Lets discuss these
issues in the
other thread: "BUG in bleeding edge c560f3d".
