From: kernel kernel <kernel@kenobrien.org>
Subject: Re: /sys/ file access
Date: Wed, 17 Jul 2013 11:35:43 +0100
Message-ID: <CAG=jzgBM5HgpigdSKNEx4KhGjcy-7b=b3R8MCzsO8rAiHfb7fQ@mail.gmail.com>
References: <CAG=jzgD=bKTAbGtTG81XRhyBzNHtr-p-Uyh-2A5eQe0ruKkqsw@mail.gmail.com>
	<CAOh2x=kOtD88pjAVjE-mJnvcvNi6-EG6hLFeRTLa2VAS1CSpvQ@mail.gmail.com>
	<CAG=jzgBvvK747yFrwHbn6=5C4J03b-OG3+GOmYx=vpqB3QKBcQ@mail.gmail.com>
	<CAKohpo=-SpoEMQ31CPu4jwFJHtBWqRLVFb2np5jdZs1f_jzyAw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=-SpoEMQ31CPu4jwFJHtBWqRLVFb2np5jdZs1f_jzyAw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org

Thank you very much. This solves my issue.

On Wed, Jul 17, 2013 at 5:49 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 17 July 2013 03:44, kernel kernel <kernel@kenobrien.org> wrote:
>> Apologies,
>>
>> I gave the wrong filename. I'm attempting to read
>>
>> -r-------- 1 root root 4096 Jul 16 21:03 cpuinfo_cur_freq
>>
>> as an unprivileged user. Why is this not world readable by default?
>
> This one actually reads the values directly from the hardware underneath
> and so doesn't have permissions for everyone to do it.
>
> Whereas /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq gets
> the value which cpufreq core believes is currently set and so is readable
> by everybody.



-- 
Ken O'Brien
PhD Researcher
Simulation Science and Extreme Events Cluster,
3B1, UCD CASL,
8 Belfield Business Park,
Dublin 4,
Ireland.
