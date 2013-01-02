From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH V2] Fix problem with cpufreq_ondemand or cpufreq_conservative
Date: Tue, 01 Jan 2013 22:10:18 -0600
Message-ID: <50E3B32A.8070807@lwfinger.net>
References: <50DE378D.4090008@lwfinger.net> <CAOh2x==ER3j7P1U+VQEtv00LWWa8JJHu=22--+gTUPFdhiC_cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=4x2ysz0xGgRprTSNzNIOKkiSWHECv+F7bP5hFHzkATM=;
        b=O2npITeB4Us6ZWyfrvnZyxKpsSJh8VYTExC8VAB7XGQbkUZ1SXfBw8LA/SwNXhopRa
         KogXwGMkYSaA3pqRv4jzmSNNlpWU5hyQi7UDxKS1ClzJeCtae1sToTUI7HHxVr1fxZUJ
         9KhzBT7C5ukVxy68E03+DiYo2QOrNJtjajY0dXCCORvQl6IXqGM4Pme8Iyf39U31u+43
         4VNbfbKKXqwFBUXJWC0temdK05PaaHLp3AMVPnSawRgvjKnrfRHcCUm7lbRwrDFoVOWI
         eUFCL8LaG0ULQ7gfcGYsnTIR89AwQOlnKLgQ3YSZoijt0IETE7JDbYB5HugZ0+tDsYo6
         VJ/A==
In-Reply-To: <CAOh2x==ER3j7P1U+VQEtv00LWWa8JJHu=22--+gTUPFdhiC_cQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 01/01/2013 09:56 PM, Viresh Kumar wrote:
> I know, V4 is already accepted, but i had an small comment with one
> of your earlier change, which doesn't exist anymore :)
>
> On Sat, Dec 29, 2012 at 5:51 AM, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>> Index: wireless-testing-new/drivers/cpufreq/cpufreq_governor.c
>
> How are you creating these patches? wireless-testing-new (linux directory names)
> aren't supposed to be present here.
>
>> ===================================================================
>> --- wireless-testing-new.orig/drivers/cpufreq/cpufreq_governor.c
>> +++ wireless-testing-new/drivers/cpufreq/cpufreq_governor.c
>> @@ -316,3 +316,8 @@ second_time:
>>          return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(cpufreq_governor_dbs);
>> +
>> +MODULE_AUTHOR("Alexander Clouter <alex@digriz.org.uk>");
>
> You shouldn't be adding yourself as author here :)
>
> MODULE_AUTHOR("Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>");
> MODULE_AUTHOR("Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>");

I was not adding myself - my name is not Alexander Clouter. When we were 
creating a new module, I got the author from the module that cpufreq_governor 
was originally a part. Perhaps I got the name wrong.

Thanks for the review mentioned in the next Email.

Larry


