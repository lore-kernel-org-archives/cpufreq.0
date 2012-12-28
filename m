From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH] Fix problem with cpufreq_pndemand or cpufreq_conservative
Date: Fri, 28 Dec 2012 17:45:54 -0600
Message-ID: <50DE2F32.1010207@lwfinger.net>
References: <50DE1A74.4040607@lwfinger.net> <3226192.H2BxHSuKio@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=dn12HrLCnjFYbZ4deFYVwmfSDLrKRqJQ+bdvfPu8nZc=;
        b=KIXTuUmIV4bBnJaSkLKXirkyhO5Goql8q0x8fXAzvdEixeXjSOSUDvKihyYR9x0qBE
         InW/nP/a2DeO3D6h6iVBzMOq2Ot4zxo0VkmByKymVpNkWS4g8+WUoOnLDnxgO1s7NtEc
         QIv5O8RYswh743Q8fdqyQoV+30EIQC91lWQDzLmFvux5amWNT7rfiO5xx+9kQC/zizKc
         EseoXBqHGG9NWuweh/aoHRTv1bLDfzeo2KlA5vsbVubtxSSgHTrM3LXiR6zYbTu6jo+3
         37GeaRageKrW2O1ejIVVTL7pgkRDtgJ93LqPxgXaAMXTSZ6MfBxboHBBe9mUFizVb8nw
         MsXQ==
In-Reply-To: <3226192.H2BxHSuKio@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: viresh kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 12/28/2012 05:01 PM, Rafael J. Wysocki wrote:
> On Friday, December 28, 2012 04:17:24 PM Larry Finger wrote:
>> Since commit 2aacdff entitled "cpufreq: Move common part from governors to
>> separate file", whenever the drivers that depend on this new file
>> (cpufreq_ondemand or cpufreq_conservative) are built as modules, a new module
>> named cpufreq_governor is created. It seems that kmake is smart enough to create
>> a separate module whenever more than one module includes the same object file.
>> As drivers/cpufreq/cpufreq_governor.c contains no MODULE directives, the
>> resulting module has no license specified, which results in logging of a "module
>> license 'unspecified' taints kernel". In addition, a number of globals are
>> exported GPL only, and are therefore not available.
>>
>> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
>> ---
>>
>> This particular patch is the simplest possible; however, it hides the intent. I
>> have prepared the longer version that makes the reason clearer by adding a new
>> configuration variable that is dependent on the other two, and rearranges
>> drivers/cpufreq/Makefile. That version could be submitted if that is what is
>> desired.
>
> Yes, please.

I'll send it shortly.

>> The changes to cpufreq_governor.c are the same as in this version.
>
> I wonder if that's avoidable?  The intention is not to create an additional
> module, clearly.

It appears not to be possible. I don't know enough about to kmake to understand 
why it is forcing a new module. Perhaps some expert knows what Kconfig or 
Makefile magic will prevent that.

Larry



