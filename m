From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: Porting cpufreq module for memory frequency scaling 'memfreq'
Date: Thu, 27 Jun 2013 10:11:06 +0200
Message-ID: <CAKfTPtDtVsVFAZu0XjMrDQXemGOYD24qyVr9JiC6vQga-7nKHQ@mail.gmail.com>
References: <CAMefCkCXyM4EV92Q==zScae7FzgD2VjmyGx2nTf_u2LK6b6hvQ@mail.gmail.com>
	<CAMefCkAwdGGeOrJWnkTdbFH8L453LC1Cvo7mh_Ntx0LBSwQv+g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAMefCkAwdGGeOrJWnkTdbFH8L453LC1Cvo7mh_Ntx0LBSwQv+g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 26 June 2013 17:58, Guru Prasad <gurupras@buffalo.edu> wrote:
> Hi,
>
> I'm working with a hardware simulator - Gem5 (http://gem5.org). I have
> added some functionality to this simulator to modify memory frequency.
>
> I would like to add kernel support to manage memory frequency similar
> to how cpu frequency is currently maintained so that I can study the
> cost-benefit of memory frequency scaling.

Have you looked at devfreq framework ? It should match with what you
are looking for.

devfreq is used to manage the frequency scaling of devices other than
cpu like the gpu or the memory

Vincent


>
> I copied all the generic cpufreq sources to a separate folder
> kernel_source/drivers/memfreq and setup the drivers/Makefile. I have
> also done the preliminary Kconfig modifications.
>
> A few things I don't follow are
>
> Where does the kernel actually implement the delay resulting from
> cpuinfo.transition_latency?
> Does the kernel stall for the duration of the delay?
>
> the per_cpu macro        - I don't understand what this does..How can
> I implement the same for memory - which I'm considering as a shared
> resource rather than per_cpu.
>
> the subsys interface      - What does it do and how do I reproduce
> this for memory? Can I use the existing bus_type memory_subsys?
> (drivers/base/memory.c)
>
> callback                       - This seems to be specific for
> CONFIG_HOTPLUG_CPU..do I need to implement this at all for memfreq?
>
> sysfs interface              - Is there any place I can look to
> implement a nice sysfs interface similar to cpufreq?
>
>
> Please let me know if there is anything I've missed out that might
> complicate the process.
>
>
> Regards
> Guru
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
