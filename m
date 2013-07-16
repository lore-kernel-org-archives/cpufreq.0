From: kernel kernel <kernel@kenobrien.org>
Subject: Re: /sys/ file access
Date: Tue, 16 Jul 2013 23:14:02 +0100
Message-ID: <CAG=jzgBvvK747yFrwHbn6=5C4J03b-OG3+GOmYx=vpqB3QKBcQ@mail.gmail.com>
References: <CAG=jzgD=bKTAbGtTG81XRhyBzNHtr-p-Uyh-2A5eQe0ruKkqsw@mail.gmail.com>
	<CAOh2x=kOtD88pjAVjE-mJnvcvNi6-EG6hLFeRTLa2VAS1CSpvQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=kOtD88pjAVjE-mJnvcvNi6-EG6hLFeRTLa2VAS1CSpvQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org

Apologies,

I gave the wrong filename. I'm attempting to read

-r-------- 1 root root 4096 Jul 16 21:03 cpuinfo_cur_freq

as an unprivileged user. Why is this not world readable by default?

Best Regards,

Ken

On Mon, Jul 15, 2013 at 10:34 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On Fri, Jul 12, 2013 at 2:25 PM, kernel kernel <kernel@kenobrien.org> wrote:
>> I wish to read the file "/sys/devices/system/cpu/cpu0/cpufreq" as an
>> unprivileged user. The default permissions on this file are:
>>
>> -r-------- 1 root root
>>
>> What is the rationale behind this? All other files in this directory
>> are world readable.
>
> Permissions as shown on my Thinkpad with ubuntu 12.04
>
> viresh@blr-linut-001:$ ll /sys/devices/system/cpu/cpu0/
> drwxr-xr-x 3 root root    0 Jul 11 17:53 cpufreq/



-- 
Ken O'Brien
PhD Researcher
Simulation Science and Extreme Events Cluster,
3B1, UCD CASL,
8 Belfield Business Park,
Dublin 4,
Ireland.
