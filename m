From: Punit Agrawal <punit.agrawal@arm.com>
Subject: Re: Changing CPU frequency in atomic (schedule / scheduler_tick)
Date: Thu, 10 Dec 2015 10:39:23 +0000
Message-ID: <87r3iur3j8.fsf@e105922-lin.cambridge.arm.com>
References: <CAMefCkCm10Rz3Ou_4gWhXhBzF44mS7K19WQrQF+aF+WC3-mceQ@mail.gmail.com>
	<CAOh2x=nYXetX5251oJ+RLEsMMtis=MazU+ZHzmfsY=XgvnJhXw@mail.gmail.com>
	<CAMefCkDiudnfS2rWWf2Bfev3mOdWiSifO195amsAyLJ7Y4bQqQ@mail.gmail.com>
	<CAMefCkCDXwphVUHAMceDDS7Ct36ZSnJd_1-fje52TGjwgoNrMQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAMefCkCDXwphVUHAMceDDS7Ct36ZSnJd_1-fje52TGjwgoNrMQ@mail.gmail.com>
	(Guru Prasad's message of "Tue, 18 Aug 2015 09:57:35 -0400")
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Guru Prasad <gurupras@buffalo.edu> writes:

> Just to elaborate on why I don't think this is possible:
> By adding something like
>
> Lets assume 2 processes are currently running with PIDs 1000, 2000.
> I'm using '->' to signal a context switch and 500 to denote the workqueue work.
>
> We could very well end up with something like:
> 1000 -> 2000 -> 500 (to set for PID 2000) -> 1000 -> 500 (to set for
> PID 1000) -> 2000 -> 500 (to set for PID 2000) ... ... ..

Changing frequency involves latency which varies across different
platforms. Often times the latencies are of the order of ms (while the
PMICs change voltages and stabilise, the clocks are updated, and all
over slow data rate buses from the cpu). Depending on the platform, the
latency is either visible to the kernel or handled by the firmware.

When the latencies are visible to the kernel, you don't want to block
forward progress of the task while the frequency is changing (imagine
waiting 1ms to change frequency for a task that will run for 1-2ms).

So that is a bit of a hand-wavy reason for why the frequency change is
hard to do from scheduler context without delegating it to a worker of
sorts.

Hope that helps. The thread Viresh pointed to in this thread has a new
posting recently[0] - though it is very likely taking the same approach
- using a high priority task to effect the change where the platform
doesn't hide latency from the kernel.

[0] http://thread.gmane.org/gmane.linux.power-management.general/69176

>
>
> Regards
> Guru
>
>
> On Tue, Aug 18, 2015 at 9:05 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
>> I don't think this will allow me to have a per-process frequency setting.
>>
>> The problem I see with this approach is that, the scheduled work is
>> run in its own context, which means there will be a context switch.
>> When this happens, another instance of the work will be scheduled
>> (from schedule() ). I imagine I would need a conditional call to
>> schedule_work(). Something like:
>> if(!is_kthread(next))
>>     schedule_work(...);
>>
>> Regards
>> Guru
>>
>>
>> On Tue, Aug 18, 2015 at 6:27 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>> On Tue, Aug 18, 2015 at 9:16 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
>>>> We're working on a research system where we're trying to achieve
>>>> optimal frequency selection on a per-process basis. To do so, I added
>>>> additional fields to struct task_struct to store the (computed)
>>>> optimal frequency and set it. The code that computes the optimal
>>>> frequency is calculated on every scheduler_tick().
>>>>
>>>> I'm having trouble calling cpufreq_set_rate() from both a)
>>>> scheduler_tick() and b) schedule().
>>>
>>> Its not just about mutex-lock. The two scheduler functions mentioned above
>>> are called from atomic context, but they can't call anything which can
>>> potentially
>>> sleep.
>>>
>>> cpufreq_set_rate() or any clk_rate_set() can potentially sleep, and so must
>>> not be called from there. Best do it from a workqueue.
>>>
>>> --
>>> viresh
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
