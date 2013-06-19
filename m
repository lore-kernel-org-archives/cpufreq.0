From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH v6] Cpufreq: Fix governor start/stop race condition
Date: Wed, 19 Jun 2013 13:15:08 +0800
Message-ID: <CAFgnuDcxS53FS0w31w8k4JzyhKadfO+P12jOy5hyfVKf6pEPWg@mail.gmail.com>
References: <1371606191-5618-1-git-send-email-chenxg@marvell.com>
	<CAKohpont42JcdLH-TawNWVDJeiLNHeAWx4fgvAkyerOD=64MLQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=HlUiIdGcfVTZHZq9aDvzmUlgHuOs071x870/0O/6pzQ=;
        b=wwfc41E0RV6pZR5LdaeVYN7n+mrA65gVT7IrbHSoO/Nf/O/PIyPe1BHspQ4ULZ+QGe
         zTFZQDNqg7pRS9OFy4r4B82Pt3OfhQo9YbW1TC8uTb2j2cs9xl/ZTW+nUhdagjo/vRnM
         kZ82FO8XdlDOzbnlo+u56CUi2m/bMejiksN7+42XWgqkhXQpG1UBrMqbq4DDOchYEMDm
         kDcVZwDcW2+5FmsQLtzZHwJmTwTfNzQZkjtRqqLQblcmeEwsgmv5813TPnUFlOOzctlF
         Q7CtLEqrZxT3PHDcbczGxpnaXH9tP4Xs3WJ4IPAI0ScV3S1rk4AYIKV8ch+0QBFywDUw
         9DCQ==
In-Reply-To: <CAKohpont42JcdLH-TawNWVDJeiLNHeAWx4fgvAkyerOD=64MLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Xiaoguang Chen <chenxg@marvell.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, njiang1@marvell.com, zjwu@marvell.com, ylmao@marvell.com

2013/6/19 Viresh Kumar <viresh.kumar@linaro.org>:
> On 19 June 2013 07:13, Xiaoguang Chen <chenxg@marvell.com> wrote:
>> There are 4 CPUs and policy->cpu=cpu0, cpu1/2/3 are linked to cpu0.
>> The normal sequence is as below:
>
> I thought Rafael asked to write cpu0 as CPU0, ...

I changed "cpus" to "CPUs" as Rafael suggested(Please spell cpus as
"CPUs".  And please start sequences from capitals.)
do I need to change other "cpu" to "CPU"?
