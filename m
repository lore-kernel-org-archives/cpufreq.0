From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH v6] Cpufreq: Fix governor start/stop race condition
Date: Wed, 19 Jun 2013 13:21:50 +0800
Message-ID: <CAFgnuDcLY7HfwNHLez46+bX=V3m5pDcj7Cm8ECehV4+WoUtEEQ@mail.gmail.com>
References: <1371606191-5618-1-git-send-email-chenxg@marvell.com>
	<CAKohpont42JcdLH-TawNWVDJeiLNHeAWx4fgvAkyerOD=64MLQ@mail.gmail.com>
	<CAFgnuDcxS53FS0w31w8k4JzyhKadfO+P12jOy5hyfVKf6pEPWg@mail.gmail.com>
	<CAKohpo=t+bVdPpqVoBOGByeNguLgyLqoE3sLwjfDFAeQArbuMA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=RNoFZtOj1ENjiyvohCoRM2NuIttAYqbGG7jlkHVI8D0=;
        b=tETjvOlGOvKlj+Y4a0t/lY/XMszFG8TGV70FIBFwRIyaApxmStxOoGyv6zs0xAJ0Lm
         jE+1JK4PLhtTqXC0HeXRvDbmC4eDolots9PhKxoiHcYFyK3HNcJd6D8KNdq/v68c7h0z
         GXXFVsErfZ96geOtpos0y/QGjuZr4118gh0lfJIk84LfLx9IiKOBCLF4i+tlUUoLn5Aa
         RroCjLSrmfAq9S6K6FiMV8F2QySZ84Me1d+RVl1jefS9u0wOGbvSp3Ap1dfJIdL9jvxf
         eRrFe1LEmUpkK696hyE5TcJdWJEZ15E59CO9uHn8b6JrbYo6XnVk/Rdh/fuILYZ+2Mlu
         oaVw==
In-Reply-To: <CAKohpo=t+bVdPpqVoBOGByeNguLgyLqoE3sLwjfDFAeQArbuMA@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Xiaoguang Chen <chenxg@marvell.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, njiang1@marvell.com, zjwu@marvell.com, ylmao@marvell.com

2013/6/19 Viresh Kumar <viresh.kumar@linaro.org>:
> On 19 June 2013 10:45, Xiaoguang Chen <chenxg.marvell@gmail.com> wrote:
>> 2013/6/19 Viresh Kumar <viresh.kumar@linaro.org>:
>>> On 19 June 2013 07:13, Xiaoguang Chen <chenxg@marvell.com> wrote:
>>>> There are 4 CPUs and policy->cpu=cpu0, cpu1/2/3 are linked to cpu0.
>>>> The normal sequence is as below:
>>>
>>> I thought Rafael asked to write cpu0 as CPU0, ...
>>
>> I changed "cpus" to "CPUs" as Rafael suggested(Please spell cpus as
>> "CPUs".  And please start sequences from capitals.)
>> do I need to change other "cpu" to "CPU"?
>
> I am not really sure what he meant by "sequence", but I guess its regarding
> cpu0, cpu1, cpu2, etc... and not cpu .

Ok, it's not a big deal, I'll change it.

> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
