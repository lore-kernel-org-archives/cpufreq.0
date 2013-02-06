From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 5/7] cpufreq: balance out cpufreq_cpu_{get,put} for scaling
 drivers using setpolicy
Date: Tue, 05 Feb 2013 18:08:46 -0800
Message-ID: <5111BB2E.2090505@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com> <1360088646-19104-6-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=kJPFyhkG3y_q=a5ciG1HRAn-JkoVYy9OZ9POA+-isbCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=+Nj64PLMXCVTt1LIKnaeF7rxIjNz3aK1xxFPGcALEQU=;
        b=XktXqfbRYHLNGe00Pbex8MWePrk5NNzgVUzioy8VOwSS1ggDEdVTNyMfSIKqMpsoVD
         jVSCy2zyGLgoEwwOmTt/A15O73X8bEDcAhrdwlh43nMV6H/79kMU6okXhW4l5v+slwa9
         uYJ/5to6AIivP3LUsmH5fLI1NSHKAZOLxY2dcAaOgo+FnCFd5y/uj/xR0LptaVLZq0RR
         8vMO8Tcp/TateLeij/Ee0QhENlbyhjdlYwzls0yIWnL6cd7IJgtjt4rml6qe8/ptaZld
         r2fYuPGstn3aioEEKUKUz7BYDizVedEtfT4AN3C9vbrHEKiBqdtTZO5ekiytrX7qkikw
         go5Q==
In-Reply-To: <CAOh2x=kJPFyhkG3y_q=a5ciG1HRAn-JkoVYy9OZ9POA+-isbCQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/05/2013 05:58 PM, Viresh Kumar wrote:
> On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
>> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>>
>> There is an additional reference added to the driver in
>> cpufreq_add_dev()  that is removed in__cpufreq_governor() if the
>> driver implements target().  Remove the last reference when the
>> driver implements setpolicy()
>>
>> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
>> ---
>>   drivers/cpufreq/cpufreq.c |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 622e282..d17477b 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -1049,6 +1049,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
>>          if (cpufreq_driver->target)
>>                  __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>>
>> +       if (cpufreq_driver->setpolicy)
>> +               cpufreq_cpu_put(data);
>
> I don't understand this patch at all.. I grepped both cpufreq_cpu_get() & put()
> in bleeding-edge and found everything to be correct.
>
> Can you please point me to the exact line numbers ?
>

Line 878 in cpufreq_add_dev()

--Dirk
