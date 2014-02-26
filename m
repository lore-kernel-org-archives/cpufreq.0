From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH v2] drivers: cpufreq: Mark function as static in cpufreq.c
Date: Wed, 26 Feb 2014 08:52:49 -0800
Message-ID: <530E1BE1.3030605@gmail.com>
References: <linux-pm@vger.kernel.org20140226154625.GA10701@rashika> <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com> <20140226164142.GA18079@thin>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=N8nqD5DAefwyPPbmqZC1A2rP+N9+7SIiIIuiXlIlvWk=;
        b=iGrX3MItgXlssW3K4sJaw+kT4rqlo/zZ/uPUPgWhYwnnOgZ0EIy/OqJO4qNaKNW5zp
         pPddp5zjxFGmv7VAQ5bDkKFehzuaBIt0qQUd7ttxJfbCqERhRx7QY08qpm8k0o2kpQ0M
         sS5IUTEhmfTpPXFMTa8hxJWtnotyEOGBCE9UklgmkO5vO/T1XBbJyDHlsqxt12I+WWL1
         8b1AV4EMgIY1PBoCZKK7TNh7hc/KB9QwGK8LFrWiMtqkk0oriAm3holXhYgqLAvZwCNE
         BXF30hO1IQ8kY+ZNmu++5l8jQZuIBHZMqNMNHt+6T+TDgYSRxh5+q+GFUdU9KJhYBEOn
         zSkg==
In-Reply-To: <20140226164142.GA18079@thin>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Josh Triplett <josh@joshtriplett.org>, Rashika Kheria <rashika.kheria@gmail.com>
Cc: dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org

On 02/26/2014 08:41 AM, Josh Triplett wrote:
> On Wed, Feb 26, 2014 at 10:08:26PM +0530, Rashika Kheria wrote:
>> Mark function as static in cpufreq.c because it is not
>> used outside this file.
>>
>> This eliminates the following warning in cpufreq.c:
>> drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for =
=E2=80=98show_boost=E2=80=99 [-Wmissing-prototypes]
>>
>> Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
>
> I don't see any uses of this function in cpufreq.c; have uses appeare=
d
> in a development branch?
>

This is a sysfs accessor used to control the boost feature it is not us=
ed by the
core but userspace.


>>   drivers/cpufreq/cpufreq.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 08ca8c9..54fd670 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -352,7 +352,7 @@ EXPORT_SYMBOL_GPL(cpufreq_notify_post_transition=
);
>>   /*****************************************************************=
****
>>    *                          SYSFS INTERFACE                       =
   *
>>    *****************************************************************=
****/
>> -ssize_t show_boost(struct kobject *kobj,
>> +static ssize_t show_boost(struct kobject *kobj,
>>   				 struct attribute *attr, char *buf)
>>   {
>>   	return sprintf(buf, "%d\n", cpufreq_driver->boost_enabled);
>> --
>> 1.7.9.5
>>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
