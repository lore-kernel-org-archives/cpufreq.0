From: Magdalena Dobosz <maj.dobosz@gmail.com>
Subject: cpufreq-info and acpi-cpufreq: reporting MSR_IA32_PERF_CTL as "actual frequency"
Date: Tue, 25 Nov 2014 18:21:12 +0100
Message-ID: <CAHOOexvOXKr4s-mg20VdUOAR3o7EN5iAS-ModAk6-vNKbhwT=g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=65t3za2TcXjQEKoyutK7TUDbMJ2Aa8751b0c2ajBh4I=;
        b=GZhsBAJBGlQ/QZbHP9b/XQT+1L01wjB8HO+96gwBM0CfKpiybkGDb5z5QtMl5VOkuX
         QbkQEjhmGCBEitqtnHXrzzIn+m6jHuJuTeHXcOK9ZKsD3zRHpPp/sN9jc2PrWgnCTC9m
         okfwbAUSCps7+7vNXMUDH55Lrqx5gkTkGFALrNcdvS8EJaL9wZcAuN9X259V3r49F9ku
         RrBY6sOHLdxvQW69dpPwA9pKK0TtCw49NthcF0UpS95IHp1bq5y6GtDzoWmr+tN89mpS
         CRGIk9xlEgikwZqYyEnEYTcKNOj6o6BGjAXSc+oBKTflLgjpz1+tzAiH8QrXSM9nFQO1
         ajbg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CPUFREQ@vger.kernel.org
Cc: Ross Lagerwall <rosslagerwall@gmail.com>, rjw@rjwysocki.net, viresh.kumar@linaro.org

Hi,
I was analyzing the code and behaviour of cpufrequtils (kernel 3.13).
I noticed that the value reported by cpufreq-info as the frequency
"asserted by call to hardware" (exported to sysfs as
"cpuinfo_cur_freq") is always the same as the value reported as the
frequency requested by a governor (exported to sysfs as "freq", stored
in policy->cur).
It was not the case for kernel 3.2 (these two values tend to differ).

I found a reason: while using acpi-cpufreq driver, the value reported
as hardware frequency is retrieved using  get_cur_freq_on_cpu function
(defined in acpi-cpufreq). Now, in kernel version 3.2 this function
reads a value from MSR_IA32_PERF_STATUS, while in kernel 3.13 it reads
MSR_IA32_PERF_CTL.
It is a result of the patch shown below:
https://lists.ubuntu.com/archives/kernel-team/2013-June/029493.html

It looks like a bug for me - we take a requested frequency (control
register) and we report it as "cpuinfo_cur_freq - Current frequency of
the CPU as obtained from the hardware, in KHz. This is the frequency
the CPU actually runs at." (as desribed in cpufrequtils documentation:
https://www.kernel.org/doc/Documentation/cpu-freq/user-guide.txt". I
believe we should read status register (MSR_IA32_PERF_STATUS) instead.

Best regards,
Magdalena Dobosz
