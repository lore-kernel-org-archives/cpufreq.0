From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Dynamic cpufreq_frequency_table?
Date: Wed, 6 Mar 2013 08:31:32 +0800
Message-ID: <CAKohpomy57GxZDDDmLskocowwvPE5O3x6UpVY6dEYn7nUKWnHw@mail.gmail.com>
References: <CAMefCkB4LVnReZmEc65qddNiW17gzVXiTWdN=uaFm5v2aycxcQ@mail.gmail.com>
	<CAOh2x==m=mco-UXL=kA3RU2MwoipFFTbtrHrHdTfSeFeRGj19A@mail.gmail.com>
	<CAMefCkCr1tvP_SbWV2XuVAMiuo8SOMBWPOhNyJjVR+kWo63kuQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAMefCkCr1tvP_SbWV2XuVAMiuo8SOMBWPOhNyJjVR+kWo63kuQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: cpufreq@vger.kernel.org

On 6 March 2013 01:28, Guru Prasad <gurupras@buffalo.edu> wrote:
> What I mean is, every time i start the simulation with a new clock
> frequency, I have my cpufreq_init function do the following
>         int steps;
>         policy->cpuinfo.max_freq = my_cpufreq_get(policy->cpu); //In KHz
>         policy->cpuinfo.min_freq = 100  * 1000; //In KHz

You don't have to set these, but you just need to pass the right table
to cpufreq core and call cpufreq_frequency_table_cpuinfo(). These would
be set accordingly by this routine.

>         policy->cpuinfo.transition_latency = 10 * 1000; //In us
>         policy->cur = my_cpufreq_get(policy->cpu);      //(I'm assuming that
> the CPU frequency is always at the maximum before the driver takes
> control.)
>
>
> //      Get the number of cpufreq steps - Each step is 200MHz
>         steps = get_cpufreq_steps(policy->cpuinfo.max_freq,
> policy->cpuinfo.min_freq);
> //      Malloc the required space based on number of steps
>         dyn_cpufreq_table = kmalloc(sizeof(struct
> cpufreq_frequency_table) * steps, GFP_KERNEL);
> //      Create entries in the table
>         create_freq_table(dyn_cpufreq_table, policy);

That's okay, but i didn't get how will you get different set of
freqs in your table when you boot up.

> However, when I use this code, although my debug statements suggest
> that the table is created successfully, sysfs shows no cpufreq under
> /sys/devices/system/cpu/cpu0/

Something is wrong. And for finding out what, you need to post your code
here, even if it is non-mainline-able.


> Am I doing something wrong? Is GFP_KERNEL the wrong flag to use for
> this purpose?

That's not the culprit for sure.
