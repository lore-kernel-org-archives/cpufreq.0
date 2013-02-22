From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 linux-next] cpufreq: ondemand: Calculate gradient of
 CPU load to early increase frequency
Date: Fri, 22 Feb 2013 11:27:09 +0530
Message-ID: <CAOh2x==cjXGqm0+y_-_Zqc1W5f9Gny7gc=CbR=JRJxXOmg4iWA@mail.gmail.com>
References: <51253715.7080600@semaphore.gr>
	<CAOh2x=mD4DbEH245xsceS1wyhmrRPpB2LeJ9Mh+WGHUA+bZprA@mail.gmail.com>
	<512605A1.8090106@semaphore.gr>
	<CAOh2x=m82jKMf+xgg+fjnCUHLpCQ_NgYqw4auyAidokt_z=uOw@mail.gmail.com>
	<51265BC6.8030601@semaphore.gr>
	<CAKohpokKCrvMYWQCRWccDJHbBNO7km5-vP=d3TwhDyU7HGX-YA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=H0A0VXHbSwG0tfeirIX8bsAQVVCmmVszdyzixRPzjak=;
        b=E5p6ofA8WcURxJXESm68KAvLK+hTYM2i8Kctf5+HVTAKPt4SR4pNppoTJ6qtD1E72K
         G2xJ1bTAyQ3ZuWM40SAnsW89CDW1EaGGuXLY1gUqP88UOjK3Lia+QJOPR0dFH6N+6khd
         fEyLMJbhAJ2AaplrndY+djQ6f+iEa+3Gr9EGDzCudby5wII/cnWXHTcmmZlPSX1ns5fJ
         21xOw5bRJx2/OJP8HBgzf7NKuF+lX9YH2JxBCI6NjnQvQaGMBzxHAWiKZkrx2O/ug7Vz
         dPCfSyzx3xAV108BWHTwsqoosIF1EwWP3k6BwfOoAQcIjz6MouTrTgHce3W1kT9vSLtQ
         7kIA==
In-Reply-To: <CAKohpokKCrvMYWQCRWccDJHbBNO7km5-vP=d3TwhDyU7HGX-YA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Stratos Karafotis <stratosk@semaphore.gr>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 22, 2013 at 7:26 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 21 February 2013 23:09, Stratos Karafotis <stratosk@semaphore.gr> wrote:

>> Instead of checking only the absolute value of CPU load_freq to increase
>> frequency, we detect forthcoming CPU load rise and increase frequency
>> earlier.
>>
>> Every sampling rate, we calculate the gradient of load_freq. If it is
>> too steep we assume that the load most probably will go over
>> up_threshold in next iteration(s) and we increase frequency immediately.
>>
>> New tuners are introduced:
>> - early_demand: to enable this functionality (disabled by default).
>> - grad_up_threshold: over this gradient of load we will increase
>> frequency immediately.
>>
>> Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Rafael,

I applied it here with my Ack over my patches, for getting a run by
"kbuild test robot".

http://git.linaro.org/gitweb?p=people/vireshk/linux.git;a=shortlog;h=refs/heads/cpufreq-for-3.10
