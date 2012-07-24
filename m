From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH] conservative: Initialise the cpu field of the this_dbs_info
Date: Tue, 24 Jul 2012 13:54:28 +0530
Message-ID: <CADGdYn7xBka1v7S+y9u9U7dv6ynkWVW+EbRwGB-RHCKBEXy5VA@mail.gmail.com>
References: <1343028920-4712-1-git-send-email-amit.daniel@samsung.com>
	<201207231223.04620.rjw@sisk.pl>
	<CAK44p23wcPmK1c7PvobfuaFFaQ9FNDax9J-3iipgvEOCM5gWGQ@mail.gmail.com>
	<201207232055.26506.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=3udaZVbp4Vum+fecYCfLUkDTkib8VTbR9TDt0ynMqiU=;
        b=Cd5C6S1tiz79Y9ZIeQzddGe17WR1SujOqDhSzqZPM3RQGpklrSVXuwauzlDIKIkc53
         VPLfPmjx6sLqr50B5quLdy2r0Y6TKsXPgDMNkyhZe5kFEk/LfSyVwD36yQkzxlc97xEQ
         lkwww8czksJ9eIky4HcEKf97GDS94mgtnWyQQIAOZDMAs80cE3roaWEa8XTqqLHCy137
         KiILZfX09/GKN/v0owlHgj5XGbBOCum2jJq/tlZMwEkZwjEf+b9DovoCy5vqN0rQHPQj
         A6dLz+tslhIVJe1GmCS4SD9t1/md0CHnyZkbVcmOcq+JEI3pLSAy6l9/itTxsMfZ2ZcQ
         mx0g==
In-Reply-To: <201207232055.26506.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 24, 2012 at 12:25 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Monday, July 23, 2012, Amit Daniel Kachhap wrote:
>> On 23 July 2012 15:53, Rafael J. Wysocki <rjw@sisk.pl> wrote:
>>
>> > On Monday, July 23, 2012, Amit Daniel Kachhap wrote:
>> > > This patch initialises the cpu field of this_dbs_info structure. This
>> > > change is similar to existing ondemand governor.
>> >
>> > Why do you think the change is needed?
>> >
>> > Rafael
>> >
>>
>> I agree that this field is not used anywhere currently but I was trying to
>> perform some experiments and then this un-initialised field caused issues
>> so i thought of fixing this up.
>
> So perhaps please write in the changelog that this is to keep governors
> consistent with each other or something like this.  Without explanation it
> looks pointless.
Ok sure, Will resend the patch with proper change logs.
>
> Thanks,
> Rafael
>
>
>> > > Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> > > ---
>> > >  drivers/cpufreq/cpufreq_conservative.c |    1 +
>> > >  1 files changed, 1 insertions(+), 0 deletions(-)
>> > >
>> > > diff --git a/drivers/cpufreq/cpufreq_conservative.c
>> > b/drivers/cpufreq/cpufreq_conservative.c
>> > > index 235a340..a1563d7 100644
>> > > --- a/drivers/cpufreq/cpufreq_conservative.c
>> > > +++ b/drivers/cpufreq/cpufreq_conservative.c
>> > > @@ -504,6 +504,7 @@ static int cpufreq_governor_dbs(struct
>> > cpufreq_policy *policy,
>> > >                               j_dbs_info->prev_cpu_nice =
>> > >
>> > kcpustat_cpu(j).cpustat[CPUTIME_NICE];
>> > >               }
>> > > +             this_dbs_info->cpu = cpu;
>> > >               this_dbs_info->down_skip = 0;
>> > >               this_dbs_info->requested_freq = policy->cur;
>> > >
>> > >
>> >
>> >
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
