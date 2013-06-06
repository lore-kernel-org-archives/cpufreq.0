From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: Cpufreq userspace governor start/stop issue
Date: Thu, 6 Jun 2013 11:40:48 +0800
Message-ID: <CAFgnuDeDUSCd8UMKSBOXVNW+aJwqtr9jd4DTBL=HhsbkDtXgwQ@mail.gmail.com>
References: <CAFgnuDd_6z+g2m8QAfZBaCnwUYUPWB6Dku_3KvmTJ4mOrcOa6Q@mail.gmail.com>
	<CAKohpok=tUf=9peEkriM9Ow8J2NfZxDBuaFQhW+uyfeEVYiRjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=lvJSgPPb1YE+TESl4+fERzGde1aBObNq72BvShfsSqg=;
        b=hNSBtwbrODEPhjdY6kvAnkyDsxeUE/RoQekxjCC/aR+qbyl3rBsKWzb7fWi0VQ1kQG
         vlSGra7Nk07cfiQVZ9aSvQxOq/yiexYb4gBesDMDTx43OSyfrFn9XtzONkTusZfZc/H6
         0g98twTTrwRdAtDxzppwiyWpAlelIAcYBuT/XpnG+mbq0BDfgT9KLUFxz319Sqk6fopz
         gboWLDiH6LG6yE87UIk9lzOhwDmUtU2ZZ0/2PtpMFxyq74SF0Riwf+q9oKsw8+R5P8Df
         NnKON10a4s3WNA/hTzLjqsGNk+6eRBphFDm4FJSbFE+OQf7oFFc6fmQ9VlnIOliR2wsY
         BIow==
In-Reply-To: <CAKohpok=tUf=9peEkriM9Ow8J2NfZxDBuaFQhW+uyfeEVYiRjw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

2013/6/5 Viresh Kumar <viresh.kumar@linaro.org>:
> On 5 June 2013 08:54, Xiaoguang Chen <chenxg.marvell@gmail.com> wrote:
>
> Though I have tried to simplify userspace governor at the best,
> but I think I didn't understood one thing here.
>
>> So consider below case:
>> 1) cpu0 tries to hotplug cpu3, it calls userspace governor stop
>> function, it should stop cpu3's userspace governor, but it actually
>> set cpu0's per_cpu(cpu_is_managed, cpu) to 0.
>> 2) cpu0 tries to change cpu freuqency through userspace governor, but
>> it will never succeed since cpufreq_set will return err if cpu0'
>> percpu variable cpu_is_managed is 0.
>
> This is how it works currently in latest code:
> -> hot-unplug cpu3
>   -> STOP governor for its policy with policy->cpus set to 0,1,2,3
>      -> set managed for policy->cpu (i.e. cpu0) to 0.
>   -> START governor for 0,1,2
>      -> set managed for policy->cpu (i.e. cpu0) to 1.
>
> And so we are in workable situation again and their is no problem
> at all.

Yes, I missed the governor start in the end.
There is still a chance that After governor stop but before governor start,
cpu0 tries to set frequency through userspace governor, it will fail.
This should be the same problem I described to you before that
governor stop and start
should be protected by a lock to keep it in sequence and no body
should interrupt.
It seems we need to use the same lock for userspace governor set
freuqency to delay freq_set until
governor is started.

Thanks
Xiaoguang
