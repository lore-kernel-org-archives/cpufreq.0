From: Ross Lagerwall <rosslagerwall@gmail.com>
Subject: Re: cpufreq turbo regression
Date: Thu, 30 May 2013 21:55:47 +0100
Message-ID: <20130530205547.GA612@hobo.wolfson.cam.ac.uk>
References: <20130530135246.GA2177@hobo.wolfson.cam.ac.uk>
 <CAKohponjio66Okm+jWk_w0jN8RJdQyUEk3Y9sbZ7MWzOpamBmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=e8g0i9YFfpbuRvjvszDeNLaiGP+ZI/NRVHRxeAaVMls=;
        b=KzTOo73hrqKV1QvWbQjYqPJNwBu4zog1Q33AVCsL8nbtbUTKudvAzAB+CLE81pUXu/
         eQHQb+hu3Rp+q+v+vRJb1VgIJbLmUcrvUoVhgqOZgZWxYOwCNnz3G0zY6bcAIxIqLs72
         cPpR8tW0YFtxbNK2RzAWCfDL+XVgE6oBfgR3A1k7C6dudUCzFJdvsXYFxR53oSCvFQlG
         EuhyrIDYWLUSyKBlo5hsi5J18teDnHBF2cOW3En4u+1vle44LExI3MD6Psqx3ogxeyyu
         2ZJmXeHNkFIC3M1IPLeRSzr5wiEC3RYXAtBIkVDKczWyWCgh3N8nZdDO5hjLvuszFTsA
         M0Dg==
Content-Disposition: inline
In-Reply-To: <CAKohponjio66Okm+jWk_w0jN8RJdQyUEk3Y9sbZ7MWzOpamBmQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org

On Thu, May 30, 2013 at 09:11:12PM +0530, Viresh Kumar wrote:
> This patch was pretty much sensible and all drivers now depend on it
> now.
> 
> @Dirk: Can you please help us in understanding why this might be
> happening. I believe it has to do with some bad design of acpi-cpufreq
> driver (I tried to look into target routine but couldn't understand why
> this might be happening).
> 

Here is some more relevant info:
It seems like turbo is correctly set up on core 0.
If I run "taskset -c 0 stress -c 1", the frequency of core 0 jumps to
~3.8GHz.  Repeating with core 1, 2 or 3 leaves the frequency of the
respective core at 3.4GHz (no turbo).

I turned on logging and got:
[    0.570749] acpi_cpufreq_init
[    0.570750] acpi_cpufreq_early_init
[    0.570828] cpufreq: trying to register driver acpi-cpufreq
[    0.570829] cpufreq: adding CPU 0
[    0.570830] acpi_cpufreq_cpu_init
[    0.570869] HARDWARE addr space
[    0.570870] get_cur_freq_on_cpu (0)
[    0.570872] get_cur_val = 8704
[    0.570872] cur freq = 3400000
[    0.570873] CPU0 - ACPI performance management activated.
[    0.570874]      *P0: 3401 MHz, 77000 mW, 10 uS
[    0.570875]       P1: 3400 MHz, 77000 mW, 10 uS
[    0.570876]       P2: 3300 MHz, 73840 mW, 10 uS
[    0.570877]       P3: 3100 MHz, 67694 mW, 10 uS
[    0.570878]       P4: 3000 MHz, 64705 mW, 10 uS
[    0.570879]       P5: 2900 MHz, 61772 mW, 10 uS
[    0.570879]       P6: 2800 MHz, 58907 mW, 10 uS
[    0.570880]       P7: 2600 MHz, 53315 mW, 10 uS
[    0.570881]       P8: 2500 MHz, 50601 mW, 10 uS
[    0.570882]       P9: 2400 MHz, 47940 mW, 10 uS
[    0.570883]       P10: 2200 MHz, 42787 mW, 10 uS
[    0.570884]       P11: 2100 MHz, 40284 mW, 10 uS
[    0.570885]       P12: 2000 MHz, 37833 mW, 10 uS
[    0.570885]       P13: 1900 MHz, 35433 mW, 10 uS
[    0.570886]       P14: 1700 MHz, 31421 mW, 10 uS
[    0.570887]       P15: 1600 MHz, 29164 mW, 10 uS
[    0.570896] cpufreq: setting new policy for CPU 0: 1600000 - 3401000 kHz
[    0.570897] acpi_cpufreq_verify
[    0.570898] acpi_cpufreq_verify
[    0.570899] cpufreq: new min and max freqs are 1600000 - 3401000 kHz
[    0.570899] cpufreq: governor switch
[    0.570900] cpufreq: __cpufreq_governor for CPU 0, event 4
[    0.570901] cpufreq: __cpufreq_governor for CPU 0, event 1
[    0.570902] target for CPU 0: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.570903] acpi_cpufreq_target 3401000 (0)
[    0.570904] Called after resume, resetting to P0
[    0.570905] cpufreq: notification 0 of frequency transition to 3401000 kHz
[    0.570907] cpufreq: notification 1 of frequency transition to 3401000 kHz
[    0.570908] cpufreq: FREQ: 3401000 - CPU: 0
[    0.570909] cpufreq: governor: change or update limits
[    0.570909] cpufreq: __cpufreq_governor for CPU 0, event 3
[    0.570910] target for CPU 0: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.570911] cpufreq: initialization complete
[    0.570912] cpufreq: adding CPU 1
[    0.570913] acpi_cpufreq_cpu_init
[    0.570986] HARDWARE addr space
[    0.570999] get_cur_freq_on_cpu (1)
[    0.571001] get_cur_val = 9728
[    0.571001] cur freq = 3401000
[    0.571002] CPU1 - ACPI performance management activated.
[    0.571003]      *P0: 3401 MHz, 77000 mW, 10 uS
[    0.571003]       P1: 3400 MHz, 77000 mW, 10 uS
[    0.571004]       P2: 3300 MHz, 73840 mW, 10 uS
[    0.571005]       P3: 3100 MHz, 67694 mW, 10 uS
[    0.571006]       P4: 3000 MHz, 64705 mW, 10 uS
[    0.571006]       P5: 2900 MHz, 61772 mW, 10 uS
[    0.571007]       P6: 2800 MHz, 58907 mW, 10 uS
[    0.571008]       P7: 2600 MHz, 53315 mW, 10 uS
[    0.571009]       P8: 2500 MHz, 50601 mW, 10 uS
[    0.571009]       P9: 2400 MHz, 47940 mW, 10 uS
[    0.571010]       P10: 2200 MHz, 42787 mW, 10 uS
[    0.571011]       P11: 2100 MHz, 40284 mW, 10 uS
[    0.571012]       P12: 2000 MHz, 37833 mW, 10 uS
[    0.571013]       P13: 1900 MHz, 35433 mW, 10 uS
[    0.571013]       P14: 1700 MHz, 31421 mW, 10 uS
[    0.571014]       P15: 1600 MHz, 29164 mW, 10 uS
[    0.571019] cpufreq: setting new policy for CPU 1: 1600000 - 3401000 kHz
[    0.571020] acpi_cpufreq_verify
[    0.571020] acpi_cpufreq_verify
[    0.571021] cpufreq: new min and max freqs are 1600000 - 3401000 kHz
[    0.571022] cpufreq: governor switch
[    0.571022] cpufreq: __cpufreq_governor for CPU 1, event 4
[    0.571023] cpufreq: __cpufreq_governor for CPU 1, event 1
[    0.571024] target for CPU 1: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.571024] cpufreq: governor: change or update limits
[    0.571025] cpufreq: __cpufreq_governor for CPU 1, event 3
[    0.571025] target for CPU 1: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.571026] cpufreq: initialization complete
[    0.571027] cpufreq: adding CPU 2
[    0.571027] acpi_cpufreq_cpu_init
[    0.571069] HARDWARE addr space
[    0.571070] get_cur_freq_on_cpu (2)
[    0.571107] get_cur_val = 9728
[    0.571108] cur freq = 3401000
[    0.571108] CPU2 - ACPI performance management activated.
[    0.571109]      *P0: 3401 MHz, 77000 mW, 10 uS
[    0.571110]       P1: 3400 MHz, 77000 mW, 10 uS
[    0.571111]       P2: 3300 MHz, 73840 mW, 10 uS
[    0.571111]       P3: 3100 MHz, 67694 mW, 10 uS
[    0.571112]       P4: 3000 MHz, 64705 mW, 10 uS
[    0.571113]       P5: 2900 MHz, 61772 mW, 10 uS
[    0.571114]       P6: 2800 MHz, 58907 mW, 10 uS
[    0.571114]       P7: 2600 MHz, 53315 mW, 10 uS
[    0.571115]       P8: 2500 MHz, 50601 mW, 10 uS
[    0.571116]       P9: 2400 MHz, 47940 mW, 10 uS
[    0.571117]       P10: 2200 MHz, 42787 mW, 10 uS
[    0.571117]       P11: 2100 MHz, 40284 mW, 10 uS
[    0.571118]       P12: 2000 MHz, 37833 mW, 10 uS
[    0.571119]       P13: 1900 MHz, 35433 mW, 10 uS
[    0.571120]       P14: 1700 MHz, 31421 mW, 10 uS
[    0.571121]       P15: 1600 MHz, 29164 mW, 10 uS
[    0.571126] cpufreq: setting new policy for CPU 2: 1600000 - 3401000 kHz
[    0.571127] acpi_cpufreq_verify
[    0.571128] acpi_cpufreq_verify
[    0.571128] cpufreq: new min and max freqs are 1600000 - 3401000 kHz
[    0.571129] cpufreq: governor switch
[    0.571129] cpufreq: __cpufreq_governor for CPU 2, event 4
[    0.571130] cpufreq: __cpufreq_governor for CPU 2, event 1
[    0.571131] target for CPU 2: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.571131] cpufreq: governor: change or update limits
[    0.571132] cpufreq: __cpufreq_governor for CPU 2, event 3
[    0.571133] target for CPU 2: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.571133] cpufreq: initialization complete
[    0.571134] cpufreq: adding CPU 3
[    0.571135] acpi_cpufreq_cpu_init
[    0.571176] HARDWARE addr space
[    0.571177] get_cur_freq_on_cpu (3)
[    0.571227] get_cur_val = 9472
[    0.571227] cur freq = 3401000
[    0.571228] CPU3 - ACPI performance management activated.
[    0.571229]      *P0: 3401 MHz, 77000 mW, 10 uS
[    0.571229]       P1: 3400 MHz, 77000 mW, 10 uS
[    0.571230]       P2: 3300 MHz, 73840 mW, 10 uS
[    0.571231]       P3: 3100 MHz, 67694 mW, 10 uS
[    0.571232]       P4: 3000 MHz, 64705 mW, 10 uS
[    0.571233]       P5: 2900 MHz, 61772 mW, 10 uS
[    0.571233]       P6: 2800 MHz, 58907 mW, 10 uS
[    0.571234]       P7: 2600 MHz, 53315 mW, 10 uS
[    0.571235]       P8: 2500 MHz, 50601 mW, 10 uS
[    0.571236]       P9: 2400 MHz, 47940 mW, 10 uS
[    0.571236]       P10: 2200 MHz, 42787 mW, 10 uS
[    0.571237]       P11: 2100 MHz, 40284 mW, 10 uS
[    0.571238]       P12: 2000 MHz, 37833 mW, 10 uS
[    0.571251]       P13: 1900 MHz, 35433 mW, 10 uS
[    0.571252]       P14: 1700 MHz, 31421 mW, 10 uS
[    0.571253]       P15: 1600 MHz, 29164 mW, 10 uS
[    0.571258] cpufreq: setting new policy for CPU 3: 1600000 - 3401000 kHz
[    0.571258] acpi_cpufreq_verify
[    0.571259] acpi_cpufreq_verify
[    0.571260] cpufreq: new min and max freqs are 1600000 - 3401000 kHz
[    0.571260] cpufreq: governor switch
[    0.571261] cpufreq: __cpufreq_governor for CPU 3, event 4
[    0.571261] cpufreq: __cpufreq_governor for CPU 3, event 1
[    0.571262] target for CPU 3: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.571263] cpufreq: governor: change or update limits
[    0.571263] cpufreq: __cpufreq_governor for CPU 3, event 3
[    0.571264] target for CPU 3: 3401000 kHz, relation 1, requested 3401000 kHz
[    0.571264] cpufreq: initialization complete
[    0.571266] cpufreq: driver acpi-cpufreq up and running

Core 0 reports its frequency to be 3400000, the highest non-turbo
frequency and is correctly set to 3401000.
The log seems to indicate that CPU 1, 2 and 3 are already at 3401000
(the turbo frequency enabler) but this must be incorrect because they do
not scale to 3.8GHz when stressed.
Presumably reverting the previously discussed patch makes it work
because it sets it to 3401000 regardless of what the previous frequency
claims to be.

Hmmm, now to find out why those values are reported incorrectly...

Thanks for the help,
-- 
Ross Lagerwall
