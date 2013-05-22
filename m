From: karthik vm <meetvm@gmail.com>
Subject: Re: Clarification on the DVFS capabilities
Date: Wed, 22 May 2013 12:28:52 -0400
Message-ID: <CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
 <CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=U0nm2jYB/A27+2W4LgE0TX57uzih2UNP4zLSb5T/m8Q=;
        b=Hdv5YuRlGW0pvAQpVgpIqxTKA8G1T2CTxGd2WfNfEcqXFVEnYyG4iaOx7ml34ah3n1
         n9UR92E/GMWSMRGar2nrdTKEgf/AhbGiV3JfiClHCORU76Q+eQ67eDh0GeHk7Baj78Ol
         7pfomF3M1SI08L9nXM3w9yKTUO9YEbdolW/ngHgBshh/t1Urtjf84OvLVJEAyIxCriWE
         HlTyWkZYt0DeHXzfx+6U4rgnEFubaFNHmnKTHV7vXGhDDdVZFJX2fltH/QfBOhhn8RfZ
         WI5KDHBI/iq8U+iSa6nHO2FwFhoOLeVjkHMVw4qn7VGYHGXY0i3fIiHMcl6ZFQC+nyBp
         qOXQ==
In-Reply-To: <CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq <cpufreq@vger.kernel.org>

Hi Viresh,

Thanks for your quick reply. The output of cpufreq-info command is as below:
--------------------------------------------------------------------
$ cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 10.0 us.
  hardware limits: 1000 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 1.67 GHz, 1.33 GHz, 1000 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 1000 MHz and 2.00 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.00 GHz.
  cpufreq stats: 2.00 GHz:7.39%, 1.67 GHz:0.66%, 1.33 GHz:1.23%, 1000
MHz:90.72%  (48956)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 10.0 us.
  hardware limits: 1000 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 1.67 GHz, 1.33 GHz, 1000 MHz
  available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
  current policy: frequency should be within 1000 MHz and 2.00 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.00 GHz.
  cpufreq stats: 2.00 GHz:5.87%, 1.67 GHz:0.22%, 1.33 GHz:0.35%, 1000
MHz:93.55%  (10792)
----------------------------------------------------------------------------------

Also my current Linux version is 3.2.0-43-generic. May be thats why
there are misleading values for "CPUs which run at the same hardware
frequency".

Hence I guess that in my case "CPUs which run at the same hardware
frequency" & "CPUs which need to have their frequency coordinated by
software" should have the same value. If so this means that the CPU
has per-core DVFS. Please correct me if I am wrong.

Regards,
karthik

On Wed, May 22, 2013 at 12:08 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On Tue, May 21, 2013 at 9:48 PM, karthik vm <meetvm@gmail.com> wrote:
>> I have few doubts on the DVFS capabilities of my intel Core2Duo
>> processor (T5750) which has 2 cores (no hyperthreading) and has
>> Enhanced Intel Speed Step Technology (EIST). When I run the
>> "cpufreq-info" command in Ubuntu Linux I get the result that: "CPUs
>> which run at the same hardware frequency: 0 1". Hence I assumed that
>> both the CPUs will increase and decrease the frequency in a
>> synchronous fashion.
>>
>> But when I tried to verify it by using the below command:
>>
>> $ watch -n 0.1 grep \"cpu MHz\" /proc/cpuinfo
>>
>> Here I see that each core is varying the frequency individually
>> contrary to the cpufreq-info commands output that both run at the same
>> hardware frequency. Hence can anyone comment on this behavior?
>
> Which kernel version are you using? Can you paste output of cpufreq-info.
> You need to look at: "CPUs which need to have their frequency
> coordinated by software:"
> to get the right group of cpus..
>
> The other group (pointed by you) had misleading values, which are
> recently fixed in 3.9.
