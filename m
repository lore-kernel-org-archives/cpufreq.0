From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH] cpufreq: return EEXIST instead of EBUSY for second registering
Date: Thu, 19 Sep 2013 18:31:52 -0700
Message-ID: <CAE9FiQXP3DARdJYHBS8w0ATVM78Q9tGTd=8CeMJiwozBU0F_OA@mail.gmail.com>
References: <1379563520-7221-1-git-send-email-yinghai@kernel.org>
	<CAKohpomt+sASL=2i-v=HSkhOZhbPmnFesEfPoEqSE+WKcCfnmw@mail.gmail.com>
	<11319698.mBBnJVdnIk@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=4VgciWmBjd4XRlaVPjHCb+NkQ8JPYC636zGRIgeuxBE=;
        b=vZr2yjH5V8MkBIV8lKNl70kp/gNDvXeQCwf2CJ+JDzbVa8IhR2f1eG2gLHm4ospYJc
         CR3fa1W5zcdD3lWVi2bBFgT2v3WE/g5DSNfWF2Qjgl/3Qxn9kXVItSMt7jwqyIRh5vai
         Vzr/FN4ziNk5D8Y4hIWTh41TULcRgM3DRhmGoOARccEUiJnWU1zPj4rHuFw6iUv9CiRZ
         3cGShOzDq9GJtCLAFVfJiNICY78qlmF8yhWjSsOASOtIUwExlVH+EQ4ZpSv0Dv2+JF29
         veHl9cxlQrkLH7e5rfY0XhdwJpl8OxNzxdGflgqVP3b8H6tBVkUMIZ+dfI3J/oClCoen
         uIuw==
In-Reply-To: <11319698.mBBnJVdnIk@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Sep 19, 2013 at 3:37 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Thursday, September 19, 2013 09:38:32 AM Viresh Kumar wrote:
>> On 19 September 2013 09:35, Yinghai Lu <yinghai@kernel.org> wrote:
>> > System that cpu support intel_pstate, acpi_cpufreq fail to
>> > load, and udev keep trying until trace get filled up and
>> > kernel crash.
>> >
>> > The root cause is driver return ret from cpufreq_register_driver
>> > and when some other driver take over before, it would return
>> > EBUSY, then udev will keep trying...
>> >
>> > cpufreq_register_driver should return EEXIST instead.
>> > then system could boot without appending intel_pstate=disable
>> > and still use intel_pstate.
>> >
>> > Signed-off-by: Yinghai Lu <yinghai@kernel.org>
>>
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Applied, thanks!

Sorry,  looks like this one is not enough.

please let me know if you prefer me send addon patch
or revised one.

Thanks

Yinghai
