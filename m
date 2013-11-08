From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH] cpufreq: conservative: fix requested_freq reduction issue
Date: Fri, 8 Nov 2013 13:14:39 +0800
Message-ID: <CAFgnuDd+Cw-09S65i52QhpUQ-ZwHtNv5yDuu4xTwsiCFbm5fQA@mail.gmail.com>
References: <1383791330-8289-1-git-send-email-chenxg@marvell.com>
	<CAKohpo=2xjR=nr5hyMg9bve5_uVbV79R2FTxks0bLmL7kNV9Mg@mail.gmail.com>
	<CADmjqpNWYVxrXuo106rBuZeZ2BrkGFkmbMJ8jxi39c8kLiQ+iw@mail.gmail.com>
	<CAKohpon6DhiWMuszuznK4ZNCBTpy0_r3gGvTXCDMcktXpN3HEw@mail.gmail.com>
	<CAFgnuDe3xF4W6jpFO+aGuyKaYjj-4swGQcR3fE-OVHyeVhsG5g@mail.gmail.com>
	<CAKohpo=-mTWo+tsKy7smeC4kvY6d8_t2ciTECrRu4rLTA+-hJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Oeb3+u5c4lOFLZagvsinaKL2G90bC71lm8oIG3KA/jw=;
        b=hleKx4hlAedrogHiirZrdEh0lUw4qfDpu9pyUIQn8B+vRTgkHbGWpXaBd22eV26CXC
         80jdGmIobIEAkQ3p2u9DZmOWUPhM6ys+IgEU2VMxyoP0F/Vopsz5zm8qG5t4HheSzgjM
         Oi/g4CwCA68z+8H/mpqK7yeaUV+mL/Z7n8l3XXDNhqK11BXaft8259LT5f2siK6/ansC
         mbr5HVQXg/EeRFl2Q9NEM47z7yLZdkEqgWFMYa01zUzynlzKJo7ahdvBVzQm69Vg+Rr7
         3C02S1mf5vmgdU1ut5wIRkIMR0Y4jjh7lOqnzKpjIiM7RJguEX5mLcP6YQc1B+6JeLKH
         bvVA==
In-Reply-To: <CAKohpo=-mTWo+tsKy7smeC4kvY6d8_t2ciTECrRu4rLTA+-hJg@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stratos Karafotis <skarafotis@gmail.com>, Xiaoguang Chen <chenxg@marvell.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2013/11/8 Viresh Kumar <viresh.kumar@linaro.org>:
> On 8 November 2013 10:31, Xiaoguang Chen <chenxg.marvell@gmail.com> wrote:
>> Hi, Viresh, Sorry for the late reply.
>
> That's fine :)
>
>> I'll prepare the patch.
>
> Thanks.
>
>> BTW, do you think we should set requeste_freq to policy->max when such
>> condition happens?
>
> I thought about that earlier, but then thought this would be a cleaner solution.
> And guess what, I was wrong.. There is one scenario for which we need to
> set requested_freq correctly..
>
> Suppose we have requested_freq currently greater than policy->max and load
> decreases. We will start decreasing requested_freq but it will take
> one iteration
> to make it equal to max, which is not we want.. So we actually need to set
> it to max when it gets over it.
>
> So, don't do the change I asked for, i.e. replacing == with >=. But
> update existing
> code:
>
> dbs_info->requested_freq += get_freq_target(cs_tuners, policy);
>
> this way:
>
> dbs_info->requested_freq += get_freq_target(cs_tuners, policy);
> if (dbs_info->requested_freq > policy->max)
>     dbs_info->requested_freq = policy->max;

OK, patch will be sent out later

Xiaoguang
