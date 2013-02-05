From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: BUG in bleeding edge c560f3d
Date: Mon, 04 Feb 2013 16:05:27 -0800
Message-ID: <51104CC7.8030800@gmail.com>
References: <511033EA.7090604@gmail.com> <3463348.tWNCISaOfi@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=iEb+ePau9B8H7hY9Myz0Kimmd++ycPURsARctBUHbxI=;
        b=qGgxlhOGjql6ApVFs/qj/0EiJtiOtRko23Kta3lJPFj2T8ujAwJk0c7mBcS65PMEVZ
         vTifDIRsPmpAfDj1+q7BNkI5lHsKFXrHEE2/1DeVDCzW+DZxsVi+/sGZWk0jiOveC0WU
         YZes68EqJaQ9xep8222+yuaGzQvFV3w7q8rlU9jI+GPeioP5rp8imADyIWIBumGMRvK9
         INvyaLZZcZgLkzGBHV8lyREfTPRqFXk/6WpzV1QsV9HJVnxHj8e76F6UHG1Ea9/heSnx
         r95mT/58xCGJFRL77Cy8S4gA3Z4gGQW2BAQFzRU1DIFXiDdSVMVSpslCcomDr3pCh4J1
         I1Pg==
In-Reply-To: <3463348.tWNCISaOfi@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, cpufreq@vger.kernel.org

On 02/04/2013 04:09 PM, Rafael J. Wysocki wrote:
> On Monday, February 04, 2013 02:19:22 PM Dirk Brandewie wrote:
>> Hi All,
>>
>> There is a bug in the bleeding-edge branch. Using the ondemand governor
>> and acpi_cpufreq scaling driver the system hangs while trying to reboot or
>> trying to offline a cpu manually.  The last call where I have tracing turned
>> on is __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>>
>> [   38.138236] __cpufreq_remove_dev: cpufreq: __cpufreq_remove_dev:
>> unregistering CPU 1
>> [   38.146663] __cpufreq_governor: cpufreq: __cpufreq_governor for CPU 0, event 2
>> [   71.562262] ata3.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
>>
>>
>> It looks like the breakage comes from the removal of the sysfs files in the
>> incorrect order.  While rebasing my patches onto bleeding edge I found this
>> problem as well.  I have a couple of hack patches that workaround the issue
>> when using my driver if anyone would like to see them.
>
> There have been a few fixes since c560f3d, they are in linux-pm.git/linux-next
> now.  Can you please test that tree and see if the problem is still there?
>
Rebased a couple of hours ago testing now.  ATM it looks like it is related to
cpufreq_stats handling of the sysfs files


> Rafael
>
>

