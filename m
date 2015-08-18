From: Guru Prasad <gurupras@buffalo.edu>
Subject: Re: Changing CPU frequency in atomic (schedule / scheduler_tick)
Date: Tue, 18 Aug 2015 09:05:48 -0400
Message-ID: <CAMefCkDiudnfS2rWWf2Bfev3mOdWiSifO195amsAyLJ7Y4bQqQ@mail.gmail.com>
References: <CAMefCkCm10Rz3Ou_4gWhXhBzF44mS7K19WQrQF+aF+WC3-mceQ@mail.gmail.com>
	<CAOh2x=nYXetX5251oJ+RLEsMMtis=MazU+ZHzmfsY=XgvnJhXw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=R5syWl/EW60e2Nr6UbDzXZvf+flugaBnuwi7BdsyvQw=;
        b=OCJfl4hR74WN1AShn6dMaUh3GVuHNUAblfcELX97ivrOMCiBM15WHrvIqWi1XBUuy/
         4f/GJn0PQ0qQi0k7vkZevxA96R2ftsKRW7hbCObbxPQy19ZbNKYouxORUX1ORSkPdhCV
         bSWskmt7wKcPB7uC/DSYZQkdW+YFrMAAlaF9iyi3kLUrghZN6uC5zfWd699IldhHuVb4
         LX7HQ1NPeTelEvDXa5rUaVKKL+6yjNmXFl1TpVmfEYvXYkDkpRoxVp6k8nnNzBidLX1Y
         V8PaEIsymfqb6Gpdx8qpIqdq1A049/7sAMCjHz9RLf4lS0emBN+bFUj3dy4fhSxJ1L+u
         sfFQ==
In-Reply-To: <CAOh2x=nYXetX5251oJ+RLEsMMtis=MazU+ZHzmfsY=XgvnJhXw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

I don't think this will allow me to have a per-process frequency setting.

The problem I see with this approach is that, the scheduled work is
run in its own context, which means there will be a context switch.
When this happens, another instance of the work will be scheduled
(from schedule() ). I imagine I would need a conditional call to
schedule_work(). Something like:
if(!is_kthread(next))
    schedule_work(...);

Regards
Guru


On Tue, Aug 18, 2015 at 6:27 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On Tue, Aug 18, 2015 at 9:16 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
>> We're working on a research system where we're trying to achieve
>> optimal frequency selection on a per-process basis. To do so, I added
>> additional fields to struct task_struct to store the (computed)
>> optimal frequency and set it. The code that computes the optimal
>> frequency is calculated on every scheduler_tick().
>>
>> I'm having trouble calling cpufreq_set_rate() from both a)
>> scheduler_tick() and b) schedule().
>
> Its not just about mutex-lock. The two scheduler functions mentioned above
> are called from atomic context, but they can't call anything which can
> potentially
> sleep.
>
> cpufreq_set_rate() or any clk_rate_set() can potentially sleep, and so must
> not be called from there. Best do it from a workqueue.
>
> --
> viresh
