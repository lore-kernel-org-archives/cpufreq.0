From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: Only query drivers that implement cpufreq_driver.target()
Date: Tue, 05 Feb 2013 18:06:32 -0800
Message-ID: <5111BAA8.5050101@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com> <1360088646-19104-4-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=nXQrgwm2Jw88GjQe-fjpJrK+cjTWd-vK377UEBeXGu3w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=TKHaq+gH6ekDx9VVPQdbHTVc3kS1H8yPTaKRaMq7G4U=;
        b=WyPvdy/KAnfpDhP3GuAAi3E0yxZWQ4snX0VXMPKD2w/RN0RLHboZAjTAbWQsYgy2N/
         A+HUoTxMHMoGru4HxVpwdLuO9gC6EHY+MXXZa0WPibH0rf3oeUAtM3tdFpec5W0UKcNE
         l4ETC/u+8DyzZl3tH05sY6pXTQmxb/JMncyVwd73WIxlRcCjh9/LjZ+E45aBbDVlXdNQ
         Pp4GEk2wTkHXAOcdKsd/I1fyOd+7TnxmuORBo698WFWV4x85IibmVRAY/5Y5nhEOGLv8
         xCwUnuDhgBBiH04s4GgNHCZLJH+gf9ObLkVCgbPXnDmh3YFHL72H5rf2O+H/clonA+Ko
         rdKQ==
In-Reply-To: <CAOh2x=nXQrgwm2Jw88GjQe-fjpJrK+cjTWd-vK377UEBeXGu3w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/05/2013 05:47 PM, Viresh Kumar wrote:
> On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
>> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>>
>> Scaling drivers that implement cpufreq_driver.setpolicy() have
>> internal governors and may/will change the current operating frequency
>> very frequently this will cause cpufreq_out_of_sync() to be called
>> every time. Only call cpufreq_driver.get() for drivers that implement
>> cpufreq_driver.target()
>>
>> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
>> ---
>>   drivers/cpufreq/cpufreq.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 96bc302..d8daa4b 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -1787,7 +1787,7 @@ int cpufreq_update_policy(unsigned int cpu)
>>
>>          /* BIOS might change freq behind our back
>>            -> ask driver for current freq and notify governors about a change */
>> -       if (cpufreq_driver->get) {
>> +       if (cpufreq_driver->get && cpufreq_driver->target) {
>>                  policy.cur = cpufreq_driver->get(cpu);
>>                  if (!data->cur) {
>>                          pr_debug("Driver did not initialize current freq");
>
> I am really not liking copy-pasting my older comments here :(
>
> "This would mean policy->cur has a garbage value. I don't really know
> how would other routine behave on this. Would it make sense to make
> policy->cur zero atleast?
> "
>
The driver implements get() and will return a valid value but the other 
components that track the current frequency will not have been notified about 
any change so there is nothing to be out of sync with.  There is no reason to 
call cpufreq_out_of_sync() where the driver being used implements an internal
governor.

--Dirk

