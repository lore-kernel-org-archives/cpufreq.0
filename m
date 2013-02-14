From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Thu, 14 Feb 2013 07:23:44 -0800
Message-ID: <511D0180.2080809@gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com> <511BC16C.7040807@gmail.com> <CAOh2x=nwHbbngQm1PE7SfOLbHs3oMMb74zHXD9721OJzWo1+Tg@mail.gmail.com> <1540905.Sh9giL2bZe@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=gn8RU+2sdE8ZKkYuaF8kgxgB5thvS2rFUuptPDzHZfo=;
        b=cP9UbYiOj7tx9o5oE7Dzw+vIZtRW/Oj5l6b0jjqVBZnZEbCVexZgDL2Cy/OIEUSeyR
         F52rAKN42/DWi5AqOtZdcMgX64xb/uNMvUIUGM3I4zPJkYyJIAu8tdGTbQcl3JPqmW8K
         IqQbekGkh5E3AZLPWROdNxIYCourBkZxgbLeterSlU6oxy5HkeKRYbk6UEhRo3RR5o8v
         E90xb87f4fYVcF7pmJp6V3O33i4ssEHn00Y+FnqovqA6Y/lsjCPkg0KysjbFId5yVgBe
         fW+o7a3aY3n8L8/kFa70W2h4e0vWfx3vkBpkmkx8arFRAr0GxZSQeMhb7BD5wjNRYQtK
         c47g==
In-Reply-To: <1540905.Sh9giL2bZe@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Dirk Brandewie <dirk.brandewie@gmail.com>, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On 02/14/2013 04:21 AM, Rafael J. Wysocki wrote:
> On Thursday, February 14, 2013 09:38:21 AM Viresh Kumar wrote:
>> On Wed, Feb 13, 2013 at 10:08 PM, Dirk Brandewie
>> <dirk.brandewie@gmail.com> wrote:
>>> For the case where both are built-in the load order works my driver uses
>>> device_initcall() and acpi_cpufreq uses late_initcall().
>>>
>>> For the case where both are a module (which I was sure I tested) you are
>>> right
>>> I will have to do something.
>>>
>>> For now I propose to make my driver built-in only while I sort out the right
>>> solution for the module build.  Does this seem reasonable to everyone?
>>
>> Of-course i am missing something here. Why would anybody want to insert
>> acpi-cpufreq module when the system supports the pstate driver.
>>
>> In case they are mutually exclusive, then we can have something like
>> depends on !ACPI-DRIVER in the kconfig option of pstate driver.
>
> Yes.  Or the other way around (i.e. make acpi_cpufreq depend on
> !X86_INTEL_PSTATE).
>

The issue is that acpi-cpufreq still needs to be available for Intel processors 
before SandyBridge and for other x86 compatible processors we can't make
intel_pstate and acpi-cpufreq mutually exclusive.

Having intel_pstate built-in solves the issue without the need to patch
acpi-cpufreq.  I believe that most distros build the scaling drivers in
so the distro/user will make the explicit decision to use intel_pstate.


> Thanks,
> Rafael
>
>

