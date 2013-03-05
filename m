From: Guru Prasad <gurupras@buffalo.edu>
Subject: Re: Dynamic cpufreq_frequency_table?
Date: Tue, 5 Mar 2013 12:28:21 -0500
Message-ID: <CAMefCkCr1tvP_SbWV2XuVAMiuo8SOMBWPOhNyJjVR+kWo63kuQ@mail.gmail.com>
References: <CAMefCkB4LVnReZmEc65qddNiW17gzVXiTWdN=uaFm5v2aycxcQ@mail.gmail.com>
	<CAOh2x==m=mco-UXL=kA3RU2MwoipFFTbtrHrHdTfSeFeRGj19A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=uzNMyMfvFFDhWDB5tIoaBSMzpJU67UuKmczmCe9ogZw=;
        b=0PJQJr6fKNw/dwk65Zx2Zmz3IVZyEB1jCX7lmmghRhRopabJEUVsr1GYI5sI+ITuP4
         ysIEDXMlI4z8tavBXSrMI1b66uZ+AvZYPaUc+Bl67ytaTqIdLVr8bOZF3bK2IcuodE0S
         qGnAtoH2mzl8naT0CIOXuKUJuxA70T/RwzPuGvD222cW0E28eXPWqZY6FbzRCvBFLM/+
         G6yjiGi8Eyxx732uk8XQdmarvjBe1ySZiy7cSf8//mc6LwVfH4UzqFOhKc58Xptwm6q7
         XCxZHeWUzzG8XnBXi0FwB4cOrH6pOhepRTIrTooC8bc5P0oOQ4lx9iMH1jT/8V7f+Fhu
         27iQ==
In-Reply-To: <CAOh2x==m=mco-UXL=kA3RU2MwoipFFTbtrHrHdTfSeFeRGj19A@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org

Hi Viresh,
Thanks for the quick response.

What I mean is, every time i start the simulation with a new clock
frequency, I have my cpufreq_init function do the following
        int steps;
        policy->cpuinfo.max_freq = my_cpufreq_get(policy->cpu);	//In KHz
	policy->cpuinfo.min_freq = 100  * 1000;	//In KHz
	policy->cpuinfo.transition_latency = 10 * 1000; //In us
	policy->cur = my_cpufreq_get(policy->cpu);      //(I'm assuming that
the CPU frequency is always at the maximum before the driver takes
control.)


//      Get the number of cpufreq steps - Each step is 200MHz
        steps = get_cpufreq_steps(policy->cpuinfo.max_freq,
policy->cpuinfo.min_freq);
//      Malloc the required space based on number of steps
        dyn_cpufreq_table = kmalloc(sizeof(struct
cpufreq_frequency_table) * steps, GFP_KERNEL);
//      Create entries in the table
        create_freq_table(dyn_cpufreq_table, policy);

However, when I use this code, although my debug statements suggest
that the table is created successfully, sysfs shows no cpufreq under
/sys/devices/system/cpu/cpu0/

Am I doing something wrong? Is GFP_KERNEL the wrong flag to use for
this purpose?

Regards
Guru

On Tue, Mar 5, 2013 at 12:01 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Hi Guru,
>
> On Wed, Mar 6, 2013 at 12:15 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
>> I'm trying to run the Linux kernel with the cpufreq driver in a
>> simulation environment where the CPU frequency can be modified.
>
> Okay.
>
>> This leaves me with two choices :
>> Either have several kernels with different static cpufreq_frequency tables or
>
> So you meant have different uImages per freq_table, right?
>
>> let the kernel create the cpufreq_frequency_table dynamically.
>
> Didn't get that completely :(
> You want the kernel to create this table dynamically, yes we can allocate memory
> for it dynamically, but we need some input from some static/dynamic code on the
> kind of values you have.
>
> So, we need a fixed freq_table before cpufreq_driver->init is called. That's it.
>
> What you might end up doing could be unregister/register your cpufreq driver for
> every new freq_table you want to test your system with. And so your
> cpufreq_driver->init() can return these new tables everytime.
