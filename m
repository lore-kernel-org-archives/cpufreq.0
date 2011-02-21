From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH] CPUFREQ : calculate delay after dbs_check_cpu
Date: Mon, 21 Feb 2011 04:38:44 -0500
Message-ID: <AANLkTimoaiknv7kDHXy1S_qmgmcuhFSWrORww0_EuB1c@mail.gmail.com>
References: <AANLkTiknsVjXMPA6wkcXmd4g4Enkb2oXadk1iYj0o3sy@mail.gmail.com>
	<AANLkTi=Z7Qen24-A97eOjg6f8xkR2OguPwh_KzqTPbMK@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=Z7Qen24-A97eOjg6f8xkR2OguPwh_KzqTPbMK@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: cpufreq@vger.kernel.org, linaro-dev@lists.linaro.org, Patch Tracking <patches@linaro.org>

Hi Vincent,

I checked this patch and I can see some performance improvement in my
arm platform also. So in your patch there are 2 changes. First one is
for calculating delay after rate_mult is set, this can be tested with
cpufreq-bench tool. For the second part which requires enabling power
save bias , the cpufreq-bench does not do that. So I tested with one
time setting of  powersave_bias parameter and here also there is some
increase in performance. But ideally powersave mode should have more
power saving and some compromise in performance.

//Amit Daniel

On 15 February 2011 04:41, Vincent Guittot <vincent.guittot@linaro.org>=
 wrote:
> Hi,
>
> The ondemand delay value is calculated before calling dbs_check_cpu
> which can lead to a delay value of sampling_rate*sampling_down_factor
> but a frequency set to the lowest value. The main result is a slow
> responsiveness during this period. This patch moves the calculation o=
f
> delay after the call of dbs_check_cpu. I have seen this problem when
> testing cpufreq-bench on my Arm platform.
>
> Vincent
>
> On 7 February 2011 17:14, Vincent Guittot <vincent.guittot@linaro.org=
> wrote:
>> calculate ondemand delay after dbs_check_cpu call because it can
>> modify rate_mult value
>>
>> use freq_lo_jiffies value for the sub sample period of powersave_bia=
s mode
>>
>> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>> ---
>> =A0drivers/cpufreq/cpufreq_ondemand.c | =A0 20 +++++++++++++-------
>> =A01 files changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/cpufreq/cpufreq_ondemand.c
>> b/drivers/cpufreq/cpufreq_ondemand.c
>> index 58aa85e..44c2dba 100644
>> --- a/drivers/cpufreq/cpufreq_ondemand.c
>> +++ b/drivers/cpufreq/cpufreq_ondemand.c
>> @@ -641,13 +641,7 @@ static void do_dbs_timer(struct work_struct *wo=
rk)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0container_of(work, struct cpu_dbs_inf=
o_s, work.work);
>> =A0 =A0 =A0 =A0unsigned int cpu =3D dbs_info->cpu;
>> =A0 =A0 =A0 =A0int sample_type =3D dbs_info->sample_type;
>> -
>> - =A0 =A0 =A0 /* We want all CPUs to do sampling nearly on same jiff=
y */
>> - =A0 =A0 =A0 int delay =3D usecs_to_jiffies(dbs_tuners_ins.sampling=
_rate
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 * dbs_info->rate_mult);
>> -
>> - =A0 =A0 =A0 if (num_online_cpus() > 1)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay -=3D jiffies % delay;
>> + =A0 =A0 =A0 int delay;
>>
>> =A0 =A0 =A0 =A0mutex_lock(&dbs_info->timer_mutex);
>>
>> @@ -660,10 +654,22 @@ static void do_dbs_timer(struct work_struct *w=
ork)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Setup timer for SU=
B_SAMPLE */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dbs_info->sample_type=
 =3D DBS_SUB_SAMPLE;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0delay =3D dbs_info->f=
req_hi_jiffies;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* We want all CPUs to=
 do sampling nearly on
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* same jiffy
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay =3D usecs_to_jif=
fies(dbs_tuners_ins.sampling_rate
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * dbs_=
info->rate_mult);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (num_online_cpus() =
> 1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay =
-=3D jiffies % delay;
>> +
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> +
>> =A0 =A0 =A0 =A0} else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__cpufreq_driver_target(dbs_info->cur=
_policy,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dbs_info->freq_lo, CP=
UFREQ_RELATION_H);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 delay =3D dbs_info->freq_lo_jiffies;
>> =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0schedule_delayed_work_on(cpu, &dbs_info->work, delay)=
;
>> =A0 =A0 =A0 =A0mutex_unlock(&dbs_info->timer_mutex);
>> --
>> 1.7.1
>>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>
