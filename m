From: Guru Prasad <gurupras@buffalo.edu>
Subject: Re: Changing CPU frequency in atomic (schedule / scheduler_tick)
Date: Tue, 18 Aug 2015 09:57:35 -0400
Message-ID: <CAMefCkCDXwphVUHAMceDDS7Ct36ZSnJd_1-fje52TGjwgoNrMQ@mail.gmail.com>
References: <CAMefCkCm10Rz3Ou_4gWhXhBzF44mS7K19WQrQF+aF+WC3-mceQ@mail.gmail.com>
	<CAOh2x=nYXetX5251oJ+RLEsMMtis=MazU+ZHzmfsY=XgvnJhXw@mail.gmail.com>
	<CAMefCkDiudnfS2rWWf2Bfev3mOdWiSifO195amsAyLJ7Y4bQqQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=zvtg40/UNjNp6hQv7OZf9HfqqpNjPSA1supNY7lQ5Bc=;
        b=kB0sm96sTW5yZ/yymkymgDGHUHgr7KXq6AuCERU0WS+1Zo6ONgWQ+gLortaBJTobca
         3/k3eHqMA2XJ+P/A/PLrgXS5I3AvneKjXyMjRhPEAip5yxKNbPE6rU4nXDIM+HldOO9s
         v77CCZ4WfZ0KLSsgjTr6ujEok+bkMApeV1EJkllRi5q3rnbngaxXKBbkZ7GZ6qDu+BaU
         Xy0Zk4ATvMc/Ywp+JxmucErifWdKJ9/qIPfycRfz/IOH1CoQZzT/k5NPAyYgfPVfiw8s
         dH+b5H8qVbh/ZB7rxS3vcNlqhJSnpLPPA2jLX/GXLMtyXRxTFl0xqtoNf4P0yJlLtFND
         3WIQ==
In-Reply-To: <CAMefCkDiudnfS2rWWf2Bfev3mOdWiSifO195amsAyLJ7Y4bQqQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Just to elaborate on why I don't think this is possible:
By adding something like

Lets assume 2 processes are currently running with PIDs 1000, 2000.
I'm using '->' to signal a context switch and 500 to denote the workqueue work.

We could very well end up with something like:
1000 -> 2000 -> 500 (to set for PID 2000) -> 1000 -> 500 (to set for
PID 1000) -> 2000 -> 500 (to set for PID 2000) ... ... ..


Regards
Guru


On Tue, Aug 18, 2015 at 9:05 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
> I don't think this will allow me to have a per-process frequency setting.
>
> The problem I see with this approach is that, the scheduled work is
> run in its own context, which means there will be a context switch.
> When this happens, another instance of the work will be scheduled
> (from schedule() ). I imagine I would need a conditional call to
> schedule_work(). Something like:
> if(!is_kthread(next))
>     schedule_work(...);
>
> Regards
> Guru
>
>
> On Tue, Aug 18, 2015 at 6:27 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> On Tue, Aug 18, 2015 at 9:16 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
>>> We're working on a research system where we're trying to achieve
>>> optimal frequency selection on a per-process basis. To do so, I added
>>> additional fields to struct task_struct to store the (computed)
>>> optimal frequency and set it. The code that computes the optimal
>>> frequency is calculated on every scheduler_tick().
>>>
>>> I'm having trouble calling cpufreq_set_rate() from both a)
>>> scheduler_tick() and b) schedule().
>>
>> Its not just about mutex-lock. The two scheduler functions mentioned above
>> are called from atomic context, but they can't call anything which can
>> potentially
>> sleep.
>>
>> cpufreq_set_rate() or any clk_rate_set() can potentially sleep, and so must
>> not be called from there. Best do it from a workqueue.
>>
>> --
>> viresh
