From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] CPUFREQ : calculate delay after dbs_check_cpu
Date: Mon, 21 Feb 2011 17:02:31 +0100
Message-ID: <AANLkTi=WvDzNvxX_98+tz4LBNVTzx=tUotTRA-XdGKQG@mail.gmail.com>
References: <AANLkTiknsVjXMPA6wkcXmd4g4Enkb2oXadk1iYj0o3sy@mail.gmail.com>
	<AANLkTi=Z7Qen24-A97eOjg6f8xkR2OguPwh_KzqTPbMK@mail.gmail.com>
	<AANLkTimoaiknv7kDHXy1S_qmgmcuhFSWrORww0_EuB1c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTimoaiknv7kDHXy1S_qmgmcuhFSWrORww0_EuB1c@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Amit Kachhap <amit.kachhap@linaro.org>
Cc: cpufreq@vger.kernel.org, linaro-dev@lists.linaro.org, Patch Tracking <patches@linaro.org>

Hi Amit,

Thanks for this input about performance improvement.

=46or the powersave_bias mode, it's normal that you have some
performances improvement because we run freq_lo_jiffies in low freq
and freq_high_jiffies in high freq with  (freq_lo_jiffies +
freq_high_jiffies) =3D sample_rate whereas the duration was sample_rate
in low freq before.
you can also note that powersave_bias feature doesn't use the
sampling_down factor

Vincent

On 21 February 2011 10:38, Amit Kachhap <amit.kachhap@linaro.org> wrote=
:
> Hi Vincent,
>
> I checked this patch and I can see some performance improvement in my
> arm platform also. So in your patch there are 2 changes. First one is
> for calculating delay after rate_mult is set, this can be tested with
> cpufreq-bench tool. For the second part which requires enabling power
> save bias , the cpufreq-bench does not do that. So I tested with one
> time setting of =A0powersave_bias parameter and here also there is so=
me
> increase in performance. But ideally powersave mode should have more
> power saving and some compromise in performance.
>
> //Amit Daniel
>
> On 15 February 2011 04:41, Vincent Guittot <vincent.guittot@linaro.or=
g> wrote:
>> Hi,
>>
>> The ondemand delay value is calculated before calling dbs_check_cpu
>> which can lead to a delay value of sampling_rate*sampling_down_facto=
r
>> but a frequency set to the lowest value. The main result is a slow
>> responsiveness during this period. This patch moves the calculation =
of
>> delay after the call of dbs_check_cpu. I have seen this problem when
>> testing cpufreq-bench on my Arm platform.
>>
>> Vincent
>>
>> On 7 February 2011 17:14, Vincent Guittot <vincent.guittot@linaro.or=
g> wrote:
>>> calculate ondemand delay after dbs_check_cpu call because it can
>>> modify rate_mult value
>>>
>>> use freq_lo_jiffies value for the sub sample period of powersave_bi=
as mode
>>>
>>> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>>> ---
>>> =A0drivers/cpufreq/cpufreq_ondemand.c | =A0 20 +++++++++++++-------
>>> =A01 files changed, 13 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/cpufreq/cpufreq_ondemand.c
>>> b/drivers/cpufreq/cpufreq_ondemand.c
>>> index 58aa85e..44c2dba 100644
>>> --- a/drivers/cpufreq/cpufreq_ondemand.c
>>> +++ b/drivers/cpufreq/cpufreq_ondemand.c
>>> @@ -641,13 +641,7 @@ static void do_dbs_timer(struct work_struct *w=
ork)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0container_of(work, struct cpu_dbs_in=
fo_s, work.work);
>>> =A0 =A0 =A0 =A0unsigned int cpu =3D dbs_info->cpu;
>>> =A0 =A0 =A0 =A0int sample_type =3D dbs_info->sample_type;
>>> -
>>> - =A0 =A0 =A0 /* We want all CPUs to do sampling nearly on same jif=
fy */
>>> - =A0 =A0 =A0 int delay =3D usecs_to_jiffies(dbs_tuners_ins.samplin=
g_rate
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 * dbs_info->rate_mult);
>>> -
>>> - =A0 =A0 =A0 if (num_online_cpus() > 1)
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay -=3D jiffies % delay;
>>> + =A0 =A0 =A0 int delay;
>>>
>>> =A0 =A0 =A0 =A0mutex_lock(&dbs_info->timer_mutex);
>>>
>>> @@ -660,10 +654,22 @@ static void do_dbs_timer(struct work_struct *=
work)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Setup timer for S=
UB_SAMPLE */
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dbs_info->sample_typ=
e =3D DBS_SUB_SAMPLE;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0delay =3D dbs_info->=
freq_hi_jiffies;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* We want all CPUs t=
o do sampling nearly on
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* same jiffy
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay =3D usecs_to_ji=
ffies(dbs_tuners_ins.sampling_rate
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * dbs=
_info->rate_mult);
>>> +
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (num_online_cpus()=
 > 1)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay=
 -=3D jiffies % delay;
>>> +
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> +
>>> =A0 =A0 =A0 =A0} else {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__cpufreq_driver_target(dbs_info->cu=
r_policy,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dbs_info->freq_lo, C=
PUFREQ_RELATION_H);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay =3D dbs_info->freq_lo_jiffies;
>>> =A0 =A0 =A0 =A0}
>>> =A0 =A0 =A0 =A0schedule_delayed_work_on(cpu, &dbs_info->work, delay=
);
>>> =A0 =A0 =A0 =A0mutex_unlock(&dbs_info->timer_mutex);
>>> --
>>> 1.7.1
>>>
>>
>> _______________________________________________
>> linaro-dev mailing list
>> linaro-dev@lists.linaro.org
>> http://lists.linaro.org/mailman/listinfo/linaro-dev
>>
>
