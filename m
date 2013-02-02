From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/6] cpufreq: Do not track governor name for scaling
 drivers with internal governors.
Date: Sat, 2 Feb 2013 11:24:33 +0530
Message-ID: <CAKohpom+HXddYC32HYotCsaHGKsH2LXxk0BKNb5kzpqP1UhYGA@mail.gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
	<1359744343-18690-5-git-send-email-dirk.brandewie@gmail.com>
	<CAOh2x=mSFkTCU1WywdJAyuX4+Z_8EWzFt0z-f8nOfdi1A-wY2Q@mail.gmail.com>
	<CANOOhLSSXPuLG5X=TCfThjwcR3GuR=Z-O5qmY4StJZzg+Er5tA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CANOOhLSSXPuLG5X=TCfThjwcR3GuR=Z-O5qmY4StJZzg+Er5tA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 2 February 2013 11:14, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
> Hi viresh,
>
> This is based on 3.8-rc5.  I think this should work against bleeding_edge
> but I have not tested against bleeding_edge

Rafael wouldn't be able to apply these patches. There are a lot of core patches
present in bleeding_edge.
