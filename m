From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH v5] cpufreq: fix governor start/stop race condition
Date: Wed, 19 Jun 2013 11:26:13 +0800
Message-ID: <CAFgnuDdN6CoLCvH6-d9YB=-jm-ESC1s__si970pa10mC3wsCdw@mail.gmail.com>
References: <1371114118-19488-1-git-send-email-chenxg@marvell.com>
	<1912850.KuRKhn87Nf@vostro.rjw.lan>
	<CAFgnuDe1bUub92uE1H9Fc9U7AJCYL=WKdyDe2bg00yEr=kMEbQ@mail.gmail.com>
	<CAKohpoktu5+h0YOCtoS6sq2UP2iU+z+nYjwB6rH7cRWDAOhRSA@mail.gmail.com>
	<CAKohpokN_iJ5in0t3Mo68Tost0u2WT65PQtynQ7-wxGZr0LDQQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=8QK5t8YWRicUqmF0ArT6BoHFtFoaV1kYeC3emdU3k7A=;
        b=LP+9/wvPwB9gfnK8Nsyo17lfPwwD/5waaBUpLltXx45991c0P6VaWYTrwx5Wq2Azk6
         0iK1X/lwc14dXj1x21xa4EehA9LrHJ9Oel+SA/nv3NwySiF7sz2sStgM5mVdf80YZTZq
         Dch3G3Hr8k6MisaSVGRZSVlvSplMJKVtfMsFDwKXgCNZKfst2gQBXy/+3W9XTfRMevbN
         cJnAzeXwzldu7QQnCa1mTMDtD5M6X/NxepPurS0ld+EFQ986fbRmvHA1QOYgjQ5BqVsp
         AiFUSQ7Wa6rMleD1yGqcYE6NhKVQYAYoOKdSzX9Sl+/fzjOQKrycAmS+2fAqMEEz+rZx
         tc9A==
In-Reply-To: <CAKohpokN_iJ5in0t3Mo68Tost0u2WT65PQtynQ7-wxGZr0LDQQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Xiaoguang Chen <chenxg@marvell.com>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, njiang1@marvell.com, zjwu@marvell.com, ylmao@marvell.com

2013/6/19 Viresh Kumar <viresh.kumar@linaro.org>:
> On 19 June 2013 08:43, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> On 19 June 2013 06:50, Xiaoguang Chen <chenxg.marvell@gmail.com> wrote:
>>> 2013/6/19 Rafael J. Wysocki <rjw@sisk.pl>:
>>
>>>>> 2) Current governor is userspace, now cpu0 hotplugs in cpu3, it will
>>>>
>>>> Can you please tell me what the above is supposed to mean?  Is it supposed to
>>>> mean "the online of cpu3 is being run on cpu0" or something different?  If
>>>> something different, then what?

Sorry I missed this question, Let me explain it in detail
Suppose we are in such condtition, current cpufreq goveror is
userspace governor. cpu3 is offline.
and two things happen as above two cases, first thing is application
tries to change current governor to ondemand governor,
second thing is cpu0 tries to make cpu3 online which is off line
before. both of these two cases will try to stop current governor and
start a governor. if above two things interleave, unexpected behavior
will happen.


>>
>> Please read all the questions carefully. You missed this one.
>>
>> Actually you should write: Current governor is userspace, now cpu0 hot-unplugs
>> cpu3, it will **
>
> Ahh I am mistaken, you are actually bringing cpu3 back to the system. Then you
> must have mentioned earlier that cpu3 wasn't online.
