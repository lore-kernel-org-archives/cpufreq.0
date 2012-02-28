From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [RFC PATCH 1/2] CPUfreq ondemand: update sampling rate without
 waiting for next sampling
Date: Tue, 28 Feb 2012 11:19:22 +0900
Message-ID: <CAJ0PZbSn8A6fOeq5_wDDQD7hEbb92N7CDA62YtT1gr1Rx6+7bw@mail.gmail.com>
References: <CAJ0PZbSODSJvV-_Gje9Hm9Ek22Z9m+PAcsf071OCmAOtsnKzyg@mail.gmail.com>
	<1329897815-15871-1-git-send-email-myungjoo.ham@samsung.com>
	<1329897815-15871-2-git-send-email-myungjoo.ham@samsung.com>
	<201202260059.02347.rjw@sisk.pl>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:reply-to:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=sXpKJqG6ojgVkLrInMQcIHDJyOhTe0Fivr2UtXv6gWg=;
        b=xMUB1i0Y/Ed5A3PXAWLg9Iby4k1QHCh+k5cpF+zTzV8BZioyC8jL4OpgTxwthI45t/
         U42LNxe/wyvy4XueAXbYZVw9rKu0iAG1As4M9KUEXdZ1cLRhCuOh/pgPTzk6FbqoD8a8
         GN6Do44Ally13P1SgaXEOAgjtQD5THQyedhg4=
In-Reply-To: <201202260059.02347.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Kevin Hilman <khilman@ti.com>, Jean Pihet <j-pihet@ti.com>, markgross <markgross@thegnar.org>, kyungmin.park@samsung.com

2012/2/26 Rafael J. Wysocki <rjw@sisk.pl>:
> On Wednesday, February 22, 2012, MyungJoo Ham wrote:
>> When a new sampling rate is shorter than the current one, (e.g., 1 s=
ec
>> --> 10 ms) regardless how short the new one is, the current ondemand
>> mechanism wait for the previously set timer to be expired.
>>
>> For example, if the user has just expressed that the sampling rate
>> should be 10 ms from now and the previous was 1000 ms, the new rate =
may
>> become effective 999 ms later, which could be not acceptable for the
>> user if the user has intended to speed up sampling because the syste=
m is
>> expected to react to CPU load fluctuation quickly from __now__.
>>
>> In order to address this issue, we need to cancel the previously set
>> timer (schedule_delayed_work) and reset the timer if resetting timer=
 is
>> expected to trigger the delayed_work ealier.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
[]
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!delayed_work_pending(&dbs_info->work)=
)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto next;
>> +
>
> What about doing
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mutex_unlock(&dbs_info=
->timer_mutex);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
>
> here instead of the jump?
>

Like patch 2/2 of this patchset, I'll remove goto in the loop.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 timer =3D &dbs_info->work.timer;
>> + =A0 =A0 =A0 =A0 =A0 =A0 appointed_at =3D timer->expires;
>> +
>
> I would do
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0next_sampling =3D jiffies + usecs_to_j=
iffies(new_rate);
>
> and compare that with timer->expires. =A0Then, the if () below would =
look better.
> Or perhaps use new_rate_jiffies =3D usecs_to_jiffies(new_rate) and us=
e that here
> and below?
>

Oh.. yes, this surely looks ugly. I'll update this.

>> + =A0 =A0 =A0 =A0 =A0 =A0 if (time_before(jiffies + usecs_to_jiffies=
(new_rate),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 appointed_=
at)) {
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&dbs_info->ti=
mer_mutex);
>
> I'm not sure if this isn't going to be racy. =A0Have you verified tha=
t?

This unlock is added to avoid race condition against do_dbs_timer().
Unless the delay is 0 (polling_interval =3D 0ms?), do_dbs_timer() or
mutex_lock() took several ms, do_dbs_timer() won't be running again
holding the mutex after cancel_delayed_work_sync().

I've tested a few cases only backported on kernel 3.0; however, I'll
do more extensive testing on this part before submitting the next
iteration of the patchset and try to run this code with 3.3-rc5.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cancel_delayed_work_sync(&=
dbs_info->work);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&dbs_info->time=
r_mutex);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule_delayed_work_on(d=
bs_info->cpu, &dbs_info->work,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0usecs_to_jiffies(new_rate));
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +next:
>> + =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&dbs_info->timer_mutex);
>> + =A0 =A0 }
>> +}
>> +
>> =A0static ssize_t store_sampling_rate(struct kobject *a, struct attr=
ibute *b,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c=
onst char *buf, size_t count)
>> =A0{
>> @@ -265,7 +321,7 @@ static ssize_t store_sampling_rate(struct kobjec=
t *a, struct attribute *b,
>> =A0 =A0 =A0 ret =3D sscanf(buf, "%u", &input);
>> =A0 =A0 =A0 if (ret !=3D 1)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> - =A0 =A0 dbs_tuners_ins.sampling_rate =3D max(input, min_sampling_r=
ate);
>> + =A0 =A0 update_sampling_rate(input);
>> =A0 =A0 =A0 return count;
>> =A0}
>
> Thanks,
> Rafael

Thank you.


Cheers!
MyungJoo.

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
