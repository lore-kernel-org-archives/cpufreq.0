From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH] cpufreq: conservative: fix requested_freq reduction issue
Date: Fri, 8 Nov 2013 13:01:38 +0800
Message-ID: <CAFgnuDe3xF4W6jpFO+aGuyKaYjj-4swGQcR3fE-OVHyeVhsG5g@mail.gmail.com>
References: <1383791330-8289-1-git-send-email-chenxg@marvell.com>
	<CAKohpo=2xjR=nr5hyMg9bve5_uVbV79R2FTxks0bLmL7kNV9Mg@mail.gmail.com>
	<CADmjqpNWYVxrXuo106rBuZeZ2BrkGFkmbMJ8jxi39c8kLiQ+iw@mail.gmail.com>
	<CAKohpon6DhiWMuszuznK4ZNCBTpy0_r3gGvTXCDMcktXpN3HEw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=8ok6c9ar0Vn/TQEURkCNxxSktxjBCJRlXtO4MKnQKSo=;
        b=kt0M89klUDGyU6gydqn7KGffbk+elZaF7HHzh4zBvine8F4pZyP2vwQ48BWT3tK2ki
         eMooIoeIKtNLmPUEx/Wj5A4qdC91xe+TMW23HG+swPgSpO91vnH7ZHCG8UIi54rTuEUL
         50RiI+T80QiWsIZW1KrmdG6HMV+CaaHdvQ6bkhEnfsTOmZw4mIUn7w3kW+OZZoq2UYcw
         NhCJmKaJQMLunrOINuNuWot/oBfiQuMhau568PvuCV6J5n243wV+cGWOynYXIAdv7NCi
         Yk3FMsaU2jQAfAMHBA3cpBgxEkVG7sYIUemcBuehhdgzOItYRrILAvlY9DZCSHlATz4f
         k9ew==
In-Reply-To: <CAKohpon6DhiWMuszuznK4ZNCBTpy0_r3gGvTXCDMcktXpN3HEw@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stratos Karafotis <skarafotis@gmail.com>, Xiaoguang Chen <chenxg@marvell.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi, Viresh, Sorry for the late reply.
I'll prepare the patch.
BTW, do you think we should set requeste_freq to policy->max when such
condition happens?

Thanks
Xiaoguang

2013/11/8 Viresh Kumar <viresh.kumar@linaro.org>:
> On 8 November 2013 00:36, Stratos Karafotis <skarafotis@gmail.com> wrote:
>> I think the existing code already checks if the requested_freq is greater
>> than policy->max in __cpufreq_driver_target.
>
> Yes it does. But the problem is:
> - cs_check_cpu() sets requested_freq above policy->max
> - We execute following code because (requested_freq != policy->max)
>
>     dbs_info->requested_freq += get_freq_target(cs_tuners, policy);
>     __cpufreq_driver_target(policy, dbs_info->requested_freq,
> CPUFREQ_RELATION_H);
> - In __cpufreq_driver_target(), we don't do anything and return early..
> - Above will keep on repeating all the time..
>
> If we change the code as I have suggested it to be:
> - After first loop where requested_freq went over policy->max, we will
> return early from cs_check_cpu(), but we have already set freq to max..
>
>> If we put this check earlier, cpufreq will never reach policy->max.
>
> Can you please explain why do you see that happening?
