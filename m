From: J Webster <jw.jwebster@gmail.com>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Mon, 07 Feb 2011 23:56:21 +0100
Message-ID: <4D507895.70204@gmail.com>
References: <4D4DAB6A.6090807@gmail.com> <20110206044123.GB2703@kamineko.org> <201102072055.38707.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=9GtDM5gsnYUMNzsUNv9SJwbNJ/w1XZGldVM+Oi6iwgQ=;
        b=LeyJ0gb8SaL/CUMwgkKz7L/hEjH6URlY38ykOU9aSpz2KwdcgVa94Dgjks8oKvJEk9
         iWAZJk7zc0B+L0n4UMJUQL4CQcxohqnts06/z7Y1EIl8CjlHRx2SbuKKd8thBuuVGNi3
         1dbD6FyG1avF3u1cYWVKhSaf9iF2ZelBjmC58=
In-Reply-To: <201102072055.38707.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Renninger <trenn@suse.de>
Cc: Mattia Dongili <malattia@linux.it>, cpufreq@vger.kernel.org

The BIOS is BIOS revision A05, which has not been updated since 2005.
The BIOS only has settings to turn speedstep on or off. If it is turned 
off then the computer will not run higher than 800MHz so that won't 
solve the issue.
I have attached the results below when it throttles down to 800 and the 
cpu limit says: 80000 but it starts off at 1733000.

The only thing it could be is a temperature sensor that has gone faulty. 
NHC in windows seems to be able to bypass this issue and ramp it up to 
1.73 but there doesn't seem to be an equivalent in Ubuntu that I know of.

when running at 1.73Ghz correctly:
j@j-Inspiron-9300:~$ date
Mon Feb  7 22:44:49 CET 2011
j@j-Inspiron-9300:~$ sudo cat 
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit
1733000
j@j-Inspiron-9300:~$ cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
   driver: acpi-cpufreq
   CPUs which run at the same hardware frequency: 0
   CPUs which need to have their frequency coordinated by software: 0
   maximum transition latency: 10.0 us.
   hardware limits: 800 MHz - 1.73 GHz
   available frequency steps: 1.73 GHz, 1.33 GHz, 1.07 GHz, 800 MHz
   available cpufreq governors: conservative, ondemand, userspace, 
powersave, performance
   current policy: frequency should be within 1.73 GHz and 1.73 GHz.
                   The governor "performance" may decide which speed to use
                   within this range.
   current CPU frequency is 1.73 GHz.
   cpufreq stats: 1.73 GHz:99.46%, 1.33 GHz:0.00%, 1.07 GHz:0.00%, 800 
MHz:0.54%  (16)

when limited to 800MHz:
j@j-Inspiron-9300:~$ date
Mon Feb  7 23:54:45 CET 2011
j@j-Inspiron-9300:~$ cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
   driver: acpi-cpufreq
   CPUs which run at the same hardware frequency: 0
   CPUs which need to have their frequency coordinated by software: 0
   maximum transition latency: 10.0 us.
   hardware limits: 800 MHz - 1.73 GHz
   available frequency steps: 1.73 GHz, 1.33 GHz, 1.07 GHz, 800 MHz
   available cpufreq governors: conservative, ondemand, userspace, 
powersave, performance
   current policy: frequency should be within 800 MHz and 800 MHz.
                   The governor "performance" may decide which speed to use
                   within this range.
   current CPU frequency is 800 MHz.
   cpufreq stats: 1.73 GHz:69.73%, 1.33 GHz:0.00%, 1.07 GHz:0.00%, 800 
MHz:30.27%  (17)
j@j-Inspiron-9300:~$ sudo cat 
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit
800000





On 07/02/11 20:55, Thomas Renninger wrote:
> On Sunday 06 February 2011 05:41:23 Mattia Dongili wrote:
>> Note that this is a kernel development related list, if your problem is
>> specific to cpufreqd (note the "d" for deamon, a userspace application)
>> please write/reply to me only or to cpufreqd related mailing lists.
>>
>> On Sat, Feb 05, 2011 at 08:56:26PM +0100, J Webster wrote:
>>> My laptop is an Inpsiron 9300, which should be able to go up to 1.73GHz.
>>> I am having an issue whereby when I first turn the computer on,
>>> ondemand is selected and the speed moves between 800 and 1.73
>>> successfully.
>>> For no apparent reason, after 15mins it is throttled back to 800 and
>>> I cannot change it back.
>>> I tired manually editing the scaling_max_freq file to 1733000 but
>>> when I go back to view it it has changed to 800000 again!
>>> I thought it might be this issue:
>>> ##
>>> # Special Rules
>>> ##
>>> # CPU Too hot!
>>> [Rule]
>>> name=CPU Too Hot
>>> acpi_temperature=55-100
>>> cpu_interval=50-100
>>> profile=Performance Low
>>> [/Rule]
>>>
>>> So I changed it from 70-100 but on the last try the cpu did  not
>>> reach 70 and it still throttled it back to 800.
>> Try to increase cpufreqd verbosity, it will tell you which and why a
>> specific rule was selected. From there you can work on modifying your
>> rules to better match your usage.
> Also check whether your BIOS is the reason, if you get 800000 here:
> /sys/devices/system/cpu/cpu0/cpufreq/bios_limit
> you should check your BIOS settings.
>
>         Thomas
