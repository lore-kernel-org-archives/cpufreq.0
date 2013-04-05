From: Adam Williamson <awilliam@redhat.com>
Subject: Re: [PATCH] cpufreq/intel_pstate: Set timer timeout correctly
Date: Thu, 04 Apr 2013 22:42:57 -0700
Message-ID: <515E6461.3060800@redhat.com>
References: <1365096935-16730-1-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=mzQBSnBB3-10yGMdGfxMWeMcvE_t2Mvnz+fvdHv0-uaA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=mzQBSnBB3-10yGMdGfxMWeMcvE_t2Mvnz+fvdHv0-uaA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: dirk.brandewie@gmail.com, Parag Warudkar <parag.lkml@gmail.com>, rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On 04/04/13 10:19 PM, Viresh Kumar wrote:
> On Thu, Apr 4, 2013 at 11:05 PM,  <dirk.brandewie@gmail.com> wrote:
>> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>>
>> The current calculation of the delay time is wrong and a cut and paste
>> error from a previous experimental driver.  This can result in the
>> timeout being set to jiffies + 1 which setup the driver to race with
>> it's self if the apic timer interrupt happen at just the right time.
>>
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=920289
>>
>> Reported-by: Adam Williamson <awilliam@redhat.com>
>> Reported-by: Parag Warudkar <parag.lkml@gmail.com>
>>
>> Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>
>> ---
>>   drivers/cpufreq/intel_pstate.c |    1 -
>>   1 files changed, 0 insertions(+), 1 deletions(-)
>
> Looks fine, but I would like to see a Tested-by from Adam/Parag
> as they haven't said anything about this patch (even in bugzilla).

I'll try. Note the bug is not reliably reproducible, all I can really do 
is run for a day or two and see if it crashes.
-- 
Adam Williamson
Fedora QA Community Monkey
IRC: adamw | Twitter: AdamW_Fedora | identi.ca: adamwfedora
http://www.happyassassin.net
