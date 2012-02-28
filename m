From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [RFC PATCH 2/2] CPUfreq ondemand: handle QoS request on DVFS
 response latency
Date: Tue, 28 Feb 2012 09:39:17 +0900
Message-ID: <CAJ0PZbTP5t9krrPi83EP5qziWbLkW4GtJpMQKM2OznzzNZd3GQ@mail.gmail.com>
References: <CAJ0PZbSODSJvV-_Gje9Hm9Ek22Z9m+PAcsf071OCmAOtsnKzyg@mail.gmail.com>
	<1329897815-15871-3-git-send-email-myungjoo.ham@samsung.com>
	<20120225113005.GC16932@elf.ucw.cz>
	<201202260047.16127.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=nzqDnxww88wkOB4SA+nf4USh1nsOM+5tDETKlQMH+24=;
        b=dlHLFCwZdlCMVV/+JStUHRdO3U4ZJmbumANL4m1IDG68Nq3aTzgcD6VmauZPbcWxLI
         fMqlz6AgxQn6KldxnKAGbG4C9tf9Rjiy9yfD+uyrO/o0pzb5LLK+yL5nC/na9Be9DgLm
         tkRauSUxpMbN6uGhu+91yBzHPQ/JdY4qDnLHo=
In-Reply-To: <201202260047.16127.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Pavel Machek <pavel@ucw.cz>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Kevin Hilman <khilman@ti.com>, Jean Pihet <j-pihet@ti.com>, markgross <markgross@thegnar.org>, kyungmin.park@samsung.com

On Sun, Feb 26, 2012 at 8:47 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Saturday, February 25, 2012, Pavel Machek wrote:
>> On Wed 2012-02-22 17:03:35, MyungJoo Ham wrote:
>> > With QoS class, DVFS_RESPONSE_LATENCY, users (device drivers and
>> > userspace processes) may express the desired maximum response late=
ncy
>> > from DVFS mechanisms such as CPUfreq's ondemand governors. Based o=
n such
>> > QoS requests, the ondemand governor may flexibly adjust sampling r=
ate
>> > accordingly unless it goes below the min_sampling_rate.
>> >
>> > The benefit of having DVFS_RESPONSE_LATENCY is to have faster resp=
onse
>> > from user inputs (mouse clicks, keyboard inputs, touchscreen touch=
es,
>> > and others) without increasing frequency unconditionally. Because =
some
>> > input events may not require any performance increases, increasing=
 the
>> > frequency unconditionally for inputs may simply consume too much e=
nergy.
>> > Adjusting sampling rate based on user inputs enabled to increase
>> > frequency with less latency if it requires and not to increase fre=
quency
>> > if it does not require.
>> >
>> > Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> >
>> > --
>> > This patch depends on the patch
>> > "PM / QoS: Introduce new classes: DMA-Throughput and DVFS-Latency"=
=2E
>> > and the patch
>> > "CPUfreq ondemand: update sampling rate without waiting for next
>> > sampling"
>> > ---
>> > =A0drivers/cpufreq/cpufreq_ondemand.c | =A0108 +++++++++++++++++++=
+++++++++++++----
>> > =A01 files changed, 96 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/=
cpufreq_ondemand.c
>> > index 2d66649..b9188f1 100644
>> > --- a/drivers/cpufreq/cpufreq_ondemand.c
>> > +++ b/drivers/cpufreq/cpufreq_ondemand.c
>> > @@ -22,6 +22,7 @@
>> > =A0#include <linux/tick.h>
>> > =A0#include <linux/ktime.h>
>> > =A0#include <linux/sched.h>
>> > +#include <linux/pm_qos.h>
>> >
>> > =A0/*
>> > =A0 * dbs is used in this file as a shortform for demandbased swit=
ching
>> > @@ -93,6 +94,7 @@ struct cpu_dbs_info_s {
>> > =A0 =A0 =A0* when user is changing the governor or limits.
>> > =A0 =A0 =A0*/
>> > =A0 =A0 struct mutex timer_mutex;
>> > + =A0 bool activated; /* dbs_timer_init is in effect */
>> > =A0};
>> > =A0static DEFINE_PER_CPU(struct cpu_dbs_info_s, od_cpu_dbs_info);
>> >
>> > @@ -111,6 +113,8 @@ static struct dbs_tuners {
>> > =A0 =A0 unsigned int sampling_down_factor;
>> > =A0 =A0 unsigned int powersave_bias;
>> > =A0 =A0 unsigned int io_is_busy;
>> > + =A0 struct notifier_block dvfs_lat_qos_db;
>> > + =A0 unsigned int dvfs_lat_qos_wants;
>> > =A0} dbs_tuners_ins =3D {
>> > =A0 =A0 .up_threshold =3D DEF_FREQUENCY_UP_THRESHOLD,
>> > =A0 =A0 .sampling_down_factor =3D DEF_SAMPLING_DOWN_FACTOR,
>> > @@ -164,6 +168,23 @@ static inline cputime64_t get_cpu_iowait_time=
(unsigned int cpu, cputime64_t *wal
>> > =A0}
>> >
>> > =A0/*
>> > + * Find right sampling rate based on sampling_rate and
>> > + * QoS requests on dvfs latency.
>> > + */
>> > +static unsigned int effective_sampling_rate(void)
>> > +{
>> > + =A0 unsigned int effective;
>> > +
>> > + =A0 if (dbs_tuners_ins.dvfs_lat_qos_wants)
>> > + =A0 =A0 =A0 =A0 =A0 effective =3D min(dbs_tuners_ins.dvfs_lat_qo=
s_wants,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dbs_tuners_i=
ns.sampling_rate);
>> > + =A0 else
>> > + =A0 =A0 =A0 =A0 =A0 effective =3D dbs_tuners_ins.sampling_rate;
>> > +
>> > + =A0 return max(effective, min_sampling_rate);
>> > +}
>> > +
>> > +/*
>> > =A0 * Find right freq to be set now with powersave_bias on.
>> > =A0 * Returns the freq_hi to be used right now and will set freq_h=
i_jiffies,
>> > =A0 * freq_lo, and freq_lo_jiffies in percpu area for averaging fr=
eqs.
>> > @@ -207,7 +228,7 @@ static unsigned int powersave_bias_target(stru=
ct cpufreq_policy *policy,
>> > =A0 =A0 =A0 =A0 =A0 =A0 dbs_info->freq_lo_jiffies =3D 0;
>> > =A0 =A0 =A0 =A0 =A0 =A0 return freq_lo;
>> > =A0 =A0 }
>> > - =A0 jiffies_total =3D usecs_to_jiffies(dbs_tuners_ins.sampling_r=
ate);
>> > + =A0 jiffies_total =3D usecs_to_jiffies(effective_sampling_rate()=
);
>> > =A0 =A0 jiffies_hi =3D (freq_avg - freq_lo) * jiffies_total;
>> > =A0 =A0 jiffies_hi +=3D ((freq_hi - freq_lo) / 2);
>> > =A0 =A0 jiffies_hi /=3D (freq_hi - freq_lo);
>> > @@ -259,7 +280,8 @@ show_one(powersave_bias, powersave_bias);
>> >
>> > =A0/**
>> > =A0 * update_sampling_rate - update sampling rate effective immedi=
ately if needed.
>> > - * @new_rate: new sampling rate
>> > + * @new_rate: new sampling rate. if it is 0, regard sampling rate=
 is not
>> > + * =A0 =A0 =A0 =A0 changed and assume that qos request value is c=
hanged.
>> > =A0 *
>> > =A0 * If new rate is smaller than the old, simply updaing
>> > =A0 * dbs_tuners_int.sampling_rate might not be appropriate. For e=
xample,
>> > @@ -273,9 +295,13 @@ show_one(powersave_bias, powersave_bias);
>> > =A0static void update_sampling_rate(unsigned int new_rate)
>> > =A0{
>> > =A0 =A0 int cpu;
>> > + =A0 unsigned int effective;
>> > +
>> > +
>> > + =A0 if (new_rate)
>> > + =A0 =A0 =A0 =A0 =A0 dbs_tuners_ins.sampling_rate =3D max(new_rat=
e, min_sampling_rate);
>> >
>> > - =A0 dbs_tuners_ins.sampling_rate =3D new_rate
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D=
 max(new_rate, min_sampling_rate);
>> > + =A0 effective =3D effective_sampling_rate();
>> >
>> > =A0 =A0 for_each_online_cpu(cpu) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 struct cpufreq_policy *policy;
>> > @@ -283,21 +309,31 @@ static void update_sampling_rate(unsigned in=
t new_rate)
>> > =A0 =A0 =A0 =A0 =A0 =A0 struct timer_list *timer;
>> > =A0 =A0 =A0 =A0 =A0 =A0 unsigned long appointed_at;
>> >
>> > + =A0 =A0 =A0 =A0 =A0 /*
>> > + =A0 =A0 =A0 =A0 =A0 =A0* mutex_destory(&dbs_info->timer_mutex) s=
hould not happen
>> > + =A0 =A0 =A0 =A0 =A0 =A0* in this context.
>> > + =A0 =A0 =A0 =A0 =A0 =A0*/
>> > + =A0 =A0 =A0 =A0 =A0 mutex_lock(&dbs_mutex);
>> > +
>> > =A0 =A0 =A0 =A0 =A0 =A0 policy =3D cpufreq_cpu_get(cpu);
>> > =A0 =A0 =A0 =A0 =A0 =A0 if (!policy)
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto next;
>> > =A0 =A0 =A0 =A0 =A0 =A0 dbs_info =3D &per_cpu(od_cpu_dbs_info, pol=
icy->cpu);
>> > =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_cpu_put(policy);
>> >
>> > + =A0 =A0 =A0 =A0 =A0 /* timer_mutex destroyed or will be destoyed=
 soon */
>> > + =A0 =A0 =A0 =A0 =A0 if (!dbs_info->activated)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto next;
>> > +
>> > =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&dbs_info->timer_mutex);
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 if (!delayed_work_pending(&dbs_info->work)=
)
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto next;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto next_timer_mutex;
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 timer =3D &dbs_info->work.timer;
>> > =A0 =A0 =A0 =A0 =A0 =A0 appointed_at =3D timer->expires;
>> >
>> > - =A0 =A0 =A0 =A0 =A0 if (time_before(jiffies + usecs_to_jiffies(n=
ew_rate),
>> > + =A0 =A0 =A0 =A0 =A0 if (time_before(jiffies + usecs_to_jiffies(e=
ffective),
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 appointed_=
at)) {
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&dbs_info->ti=
mer_mutex);
>> > @@ -305,12 +341,15 @@ static void update_sampling_rate(unsigned in=
t new_rate)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&dbs_info->time=
r_mutex);
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule_delayed_work_on(d=
bs_info->cpu, &dbs_info->work,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0usecs_to_jiffies(new_rate));
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0usecs_to_jiffies(effective));
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 }
>> > -next:
>> > +next_timer_mutex:
>> > =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&dbs_info->timer_mutex);
>> > +next:
>> > + =A0 =A0 =A0 =A0 =A0 mutex_unlock(&dbs_mutex);
>> > =A0 =A0 }
>> > +
>> > =A0}
>>
>> I don't think gotos are helpful here. Can you use normal program
>> structure or move it to subroutine...?
>
> I agree with Pavel that gotos don't make that code particularly clear=
=2E
>
> Thanks,
> Rafael

Ok, I'll let it use a normal if/then/else structure there.

Thanks.


Cheers!
MyungJoo.

--=20
MyungJoo Ham, Ph.D.
System S/W Lab, S/W Center, Samsung Electronics
