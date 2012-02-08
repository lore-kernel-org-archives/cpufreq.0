From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 3/4] cpufreq: New 'interactive' governor
Date: Wed, 8 Feb 2012 15:00:59 -0800
Message-ID: <CAKfTPtBgVy+CmNtbwetP1LRDusrUkHPXGPzNXwq2J13qOjtJ1Q@mail.gmail.com>
References: <20120208013959.GA24535@panacea>
	<20120208014437.GC459@panacea>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120208014437.GC459@panacea>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Anton Vorontsov <anton.vorontsov@linaro.org>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Dave Jones <davej@redhat.com>, Russell King <linux@arm.linux.org.uk>, Oleg Nesterov <oleg@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Nicolas Pitre <nico@fluxnic.net>, Mike Chan <mike@android.com>, Todd Poynor <toddpoynor@google.com>, cpufreq@vger.kernel.org, kernel-team@android.com, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Anton,

Have you got some figures which shows the improvement of the
responsivness compared to other governor like the ondemand one ?
That could be interesting to test interactive governor with
cpufreq-bench and compare the results with ondemand ?

Regards,
Vincent

On 7 February 2012 17:44, Anton Vorontsov <anton.vorontsov@linaro.org> =
wrote:
> From: Mike Chan <mike@android.com>
>
> This governor is designed for latency-sensitive workloads, such as
> interactive user interfaces. =A0The interactive governor aims to be
> significantly more responsive to ramp CPU quickly up when CPU-intensi=
ve
> activity begins.
>
> Existing governors sample CPU load at a particular rate, typically
> every X ms. =A0This can lead to under-powering UI threads for the per=
iod of
> time during which the user begins interacting with a previously-idle =
system
> until the next sample period happens.
>
> The 'interactive' governor uses a different approach. Instead of samp=
ling
> the CPU at a specified rate, the governor will check whether to scale=
 the
> CPU frequency up soon after coming out of idle. =A0When the CPU comes=
 out of
> idle, a timer is configured to fire within 1-2 ticks. =A0If the CPU i=
s very
> busy from exiting idle to when the timer fires then we assume the CPU=
 is
> underpowered and ramp to MAX speed.
>
> If the CPU was not sufficiently busy to immediately ramp to MAX speed=
, then
> the governor evaluates the CPU load since the last speed adjustment,
> choosing the highest value between that longer-term load or the short=
-term
> load since idle exit to determine the CPU speed to ramp to.
>
> A realtime thread is used for scaling up, giving the remaining tasks =
the
> CPU performance benefit, unlike existing governors which are more lik=
ely to
> schedule rampup work to occur after your performance starved tasks ha=
ve
> completed.
>
> The tuneables for this governor are:
> /sys/devices/system/cpu/cpufreq/interactive/min_sample_time:
> =A0 =A0 =A0 =A0The minimum amount of time to spend at the current fre=
quency before
> =A0 =A0 =A0 =A0ramping down. This is to ensure that the governor has =
seen enough
> =A0 =A0 =A0 =A0historic CPU load data to determine the appropriate wo=
rkload.
> =A0 =A0 =A0 =A0Default is 20000 uS.
> /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
> =A0 =A0 =A0 =A0The CPU load at which to ramp to max speed. =A0Default=
 is 95.
>
> Signed-off-by: Mike Chan <mike@android.com>
> Signed-off-by: Todd Poynor <toddpoynor@google.com>
> Signed-off-by: Allen Martin <amartin@nvidia.com> (submitted improveme=
nts)
> Signed-off-by: Axel Haslam <axelhaslam@ti.com> (submitted improvement=
s)
> Signed-off-by: Anton Vorontsov <anton.vorontsov@linaro.org>
> ---
> =A0drivers/cpufreq/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 26 ++
> =A0drivers/cpufreq/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0drivers/cpufreq/cpufreq_interactive.c | =A0700 +++++++++++++++++++=
++++++++++++++
> =A0include/linux/cpufreq.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +
> =A04 files changed, 730 insertions(+), 0 deletions(-)
> =A0create mode 100644 drivers/cpufreq/cpufreq_interactive.c
>
> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> index e24a2a1..c47cc46 100644
> --- a/drivers/cpufreq/Kconfig
> +++ b/drivers/cpufreq/Kconfig
> @@ -99,6 +99,15 @@ config CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
> =A0 =A0 =A0 =A0 =A0Be aware that not all cpufreq drivers support the =
conservative
> =A0 =A0 =A0 =A0 =A0governor. If unsure have a look at the help sectio=
n of the
> =A0 =A0 =A0 =A0 =A0driver. Fallback governor will be the performance =
governor.
> +
> +config CPU_FREQ_DEFAULT_GOV_INTERACTIVE
> + =A0 =A0 =A0 bool "interactive"
> + =A0 =A0 =A0 select CPU_FREQ_GOV_INTERACTIVE
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Use the CPUFreq governor 'interactive' as default. =
This allows
> + =A0 =A0 =A0 =A0 you to get a full dynamic cpu frequency capable sys=
tem by simply
> + =A0 =A0 =A0 =A0 loading your cpufreq low-level hardware driver, usi=
ng the
> + =A0 =A0 =A0 =A0 'interactive' governor for latency-sensitive worklo=
ads.
> =A0endchoice
>
> =A0config CPU_FREQ_GOV_PERFORMANCE
> @@ -179,6 +188,23 @@ config CPU_FREQ_GOV_CONSERVATIVE
>
> =A0 =A0 =A0 =A0 =A0If in doubt, say N.
>
> +config CPU_FREQ_GOV_INTERACTIVE
> + =A0 =A0 =A0 tristate "'interactive' cpufreq policy governor"
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 'interactive' - This driver adds a dynamic cpufreq =
policy governor
> + =A0 =A0 =A0 =A0 designed for latency-sensitive workloads.
> +
> + =A0 =A0 =A0 =A0 This governor attempts to reduce the latency of clo=
ck
> + =A0 =A0 =A0 =A0 increases so that the system is more responsive to
> + =A0 =A0 =A0 =A0 interactive workloads.
> +
> + =A0 =A0 =A0 =A0 To compile this driver as a module, choose M here: =
the
> + =A0 =A0 =A0 =A0 module will be called cpufreq_interactive.
> +
> + =A0 =A0 =A0 =A0 For details, take a look at linux/Documentation/cpu=
-freq.
> +
> + =A0 =A0 =A0 =A0 If in doubt, say N.
> +
> =A0menu "x86 CPU frequency scaling drivers"
> =A0depends on X86
> =A0source "drivers/cpufreq/Kconfig.x86"
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index ac000fa..f84c99b 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE) =A0 =A0+=3D cpuf=
req_powersave.o
> =A0obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE) =A0 +=3D cpufreq_userspace.o
> =A0obj-$(CONFIG_CPU_FREQ_GOV_ONDEMAND) =A0 =A0+=3D cpufreq_ondemand.o
> =A0obj-$(CONFIG_CPU_FREQ_GOV_CONSERVATIVE) =A0 =A0 =A0 =A0+=3D cpufre=
q_conservative.o
> +obj-$(CONFIG_CPU_FREQ_GOV_INTERACTIVE) +=3D cpufreq_interactive.o
>
> =A0# CPUfreq cross-arch helpers
> =A0obj-$(CONFIG_CPU_FREQ_TABLE) =A0 =A0 =A0 =A0 =A0 +=3D freq_table.o
> diff --git a/drivers/cpufreq/cpufreq_interactive.c b/drivers/cpufreq/=
cpufreq_interactive.c
> new file mode 100644
> index 0000000..188096a
> --- /dev/null
> +++ b/drivers/cpufreq/cpufreq_interactive.c
> @@ -0,0 +1,700 @@
> +/*
> + * Copyright (C) 2010 Google, Inc.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + * Author: Mike Chan (mike@android.com)
> + */
> +
> +#include <linux/module.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/cpufreq.h>
> +#include <linux/mutex.h>
> +#include <linux/sched.h>
> +#include <linux/tick.h>
> +#include <linux/time.h>
> +#include <linux/timer.h>
> +#include <linux/workqueue.h>
> +#include <linux/kthread.h>
> +#include <linux/mutex.h>
> +
> +static atomic_t active_count =3D ATOMIC_INIT(0);
> +
> +struct cpufreq_interactive_cpuinfo {
> + =A0 =A0 =A0 struct timer_list cpu_timer;
> + =A0 =A0 =A0 int timer_idlecancel;
> + =A0 =A0 =A0 u64 time_in_idle;
> + =A0 =A0 =A0 u64 idle_exit_time;
> + =A0 =A0 =A0 u64 timer_run_time;
> + =A0 =A0 =A0 int idling;
> + =A0 =A0 =A0 u64 freq_change_time;
> + =A0 =A0 =A0 u64 freq_change_time_in_idle;
> + =A0 =A0 =A0 struct cpufreq_policy *policy;
> + =A0 =A0 =A0 struct cpufreq_frequency_table *freq_table;
> + =A0 =A0 =A0 unsigned int target_freq;
> + =A0 =A0 =A0 int governor_enabled;
> +};
> +
> +static DEFINE_PER_CPU(struct cpufreq_interactive_cpuinfo, cpuinfo);
> +
> +/* Workqueues handle frequency scaling */
> +static struct task_struct *up_task;
> +static struct workqueue_struct *down_wq;
> +static struct work_struct freq_scale_down_work;
> +static cpumask_t up_cpumask;
> +static spinlock_t up_cpumask_lock;
> +static cpumask_t down_cpumask;
> +static spinlock_t down_cpumask_lock;
> +static struct mutex set_speed_lock;
> +
> +/* Hi speed to bump to from lo speed when load burst (default max) *=
/
> +static u64 hispeed_freq;
> +
> +/* Go to hi speed when CPU load at or above this value. */
> +#define DEFAULT_GO_HISPEED_LOAD 95
> +static unsigned long go_hispeed_load;
> +
> +/*
> + * The minimum amount of time to spend at a frequency before we can =
ramp down.
> + */
> +#define DEFAULT_MIN_SAMPLE_TIME (20 * USEC_PER_MSEC)
> +static unsigned long min_sample_time;
> +
> +/*
> + * The sample rate of the timer used to increase frequency
> + */
> +#define DEFAULT_TIMER_RATE (20 * USEC_PER_MSEC)
> +static unsigned long timer_rate;
> +
> +static int cpufreq_governor_interactive(struct cpufreq_policy *polic=
y,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int event);
> +
> +#ifndef CONFIG_CPU_FREQ_DEFAULT_GOV_INTERACTIVE
> +static
> +#endif
> +struct cpufreq_governor cpufreq_gov_interactive =3D {
> + =A0 =A0 =A0 .name =3D "interactive",
> + =A0 =A0 =A0 .governor =3D cpufreq_governor_interactive,
> + =A0 =A0 =A0 .max_transition_latency =3D 10000000,
> + =A0 =A0 =A0 .owner =3D THIS_MODULE,
> +};
> +
> +static void cpufreq_interactive_timer(unsigned long data)
> +{
> + =A0 =A0 =A0 unsigned int delta_idle;
> + =A0 =A0 =A0 unsigned int delta_time;
> + =A0 =A0 =A0 int cpu_load;
> + =A0 =A0 =A0 int load_since_change;
> + =A0 =A0 =A0 u64 time_in_idle;
> + =A0 =A0 =A0 u64 idle_exit_time;
> + =A0 =A0 =A0 struct cpufreq_interactive_cpuinfo *pcpu =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 &per_cpu(cpuinfo, data);
> + =A0 =A0 =A0 u64 now_idle;
> + =A0 =A0 =A0 unsigned int new_freq;
> + =A0 =A0 =A0 unsigned int index;
> + =A0 =A0 =A0 unsigned long flags;
> +
> + =A0 =A0 =A0 smp_rmb();
> +
> + =A0 =A0 =A0 if (!pcpu->governor_enabled)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Once pcpu->timer_run_time is updated to >=3D pcpu-=
>idle_exit_time,
> + =A0 =A0 =A0 =A0* this lets idle exit know the current idle time sam=
ple has
> + =A0 =A0 =A0 =A0* been processed, and idle exit can generate a new s=
ample and
> + =A0 =A0 =A0 =A0* re-arm the timer. =A0This prevents a concurrent id=
le
> + =A0 =A0 =A0 =A0* exit on that CPU from writing a new set of info at=
 the same time
> + =A0 =A0 =A0 =A0* the timer function runs (the timer function can't =
use that info
> + =A0 =A0 =A0 =A0* until more time passes).
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 time_in_idle =3D pcpu->time_in_idle;
> + =A0 =A0 =A0 idle_exit_time =3D pcpu->idle_exit_time;
> + =A0 =A0 =A0 now_idle =3D get_cpu_idle_time_us(data, &pcpu->timer_ru=
n_time);
> + =A0 =A0 =A0 smp_wmb();
> +
> + =A0 =A0 =A0 /* If we raced with cancelling a timer, skip. */
> + =A0 =A0 =A0 if (!idle_exit_time)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;
> +
> + =A0 =A0 =A0 delta_idle =3D (unsigned int) (now_idle - time_in_idle)=
;
> + =A0 =A0 =A0 delta_time =3D (unsigned int) (pcpu->timer_run_time - i=
dle_exit_time);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If timer ran less than 1ms after short-term sample=
 started, retry.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (delta_time < 1000)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto rearm;
> +
> + =A0 =A0 =A0 if (delta_idle > delta_time)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_load =3D 0;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_load =3D 100 * (delta_time - delta_=
idle) / delta_time;
> +
> + =A0 =A0 =A0 delta_idle =3D (unsigned int) (now_idle - pcpu->freq_ch=
ange_time_in_idle);
> + =A0 =A0 =A0 delta_time =3D (unsigned int) (pcpu->timer_run_time - p=
cpu->freq_change_time);
> +
> + =A0 =A0 =A0 if ((delta_time =3D=3D 0) || (delta_idle > delta_time))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 load_since_change =3D 0;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 load_since_change =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 100 * (delta_time - del=
ta_idle) / delta_time;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Choose greater of short-term load (since last idle=
 timer
> + =A0 =A0 =A0 =A0* started or timer function re-armed itself) or long=
-term load
> + =A0 =A0 =A0 =A0* (since last frequency change).
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (load_since_change > cpu_load)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_load =3D load_since_change;
> +
> + =A0 =A0 =A0 if (cpu_load >=3D go_hispeed_load) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pcpu->policy->cur =3D=3D pcpu->poli=
cy->min)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_freq =3D hispeed_fr=
eq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_freq =3D pcpu->poli=
cy->max * cpu_load / 100;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_freq =3D pcpu->policy->cur * cpu_lo=
ad / 100;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (cpufreq_frequency_table_target(pcpu->policy, pcpu->=
freq_table,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0new_freq, CPUFREQ_RELATION_H,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0&index)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn_once("timer %d: cpufreq_frequen=
cy_table_target error\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(int) data);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto rearm;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 new_freq =3D pcpu->freq_table[index].frequency;
> +
> + =A0 =A0 =A0 if (pcpu->target_freq =3D=3D new_freq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto rearm_if_notmax;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Do not scale down unless we have been at this freq=
uency for the
> + =A0 =A0 =A0 =A0* minimum sample time.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (new_freq < pcpu->target_freq) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pcpu->timer_run_time - pcpu->freq_c=
hange_time
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 < min_s=
ample_time)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto rearm;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (new_freq < pcpu->target_freq) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->target_freq =3D new_freq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&down_cpumask_lock, f=
lags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpumask_set_cpu(data, &down_cpumask);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&down_cpumask_lo=
ck, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 queue_work(down_wq, &freq_scale_down_wo=
rk);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->target_freq =3D new_freq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&up_cpumask_lock, fla=
gs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpumask_set_cpu(data, &up_cpumask);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&up_cpumask_lock=
, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 wake_up_process(up_task);
> + =A0 =A0 =A0 }
> +
> +rearm_if_notmax:
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Already set max speed and don't see a need to chan=
ge that,
> + =A0 =A0 =A0 =A0* wait until next idle to re-evaluate, don't need ti=
mer.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (pcpu->target_freq =3D=3D pcpu->policy->max)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;
> +
> +rearm:
> + =A0 =A0 =A0 if (!timer_pending(&pcpu->cpu_timer)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* If already at min: if that CPU is =
idle, don't set timer.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Else cancel the timer if that CPU =
goes idle. =A0We don't
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* need to re-evaluate speed until th=
e next idle exit.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pcpu->target_freq =3D=3D pcpu->poli=
cy->min) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_rmb();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pcpu->idling)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto ex=
it;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->timer_idlecancel =
=3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->time_in_idle =3D get_cpu_idle_tim=
e_us(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data, &pcpu->idle_exit_=
time);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mod_timer(&pcpu->cpu_timer,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 jiffies + usecs_to_=
jiffies(timer_rate));
> + =A0 =A0 =A0 }
> +
> +exit:
> + =A0 =A0 =A0 return;
> +}
> +
> +static void cpufreq_interactive_idle_start(void)
> +{
> + =A0 =A0 =A0 struct cpufreq_interactive_cpuinfo *pcpu =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 &per_cpu(cpuinfo, smp_processor_id());
> + =A0 =A0 =A0 int pending;
> +
> + =A0 =A0 =A0 if (!pcpu->governor_enabled)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 pcpu->idling =3D 1;
> + =A0 =A0 =A0 smp_wmb();
> + =A0 =A0 =A0 pending =3D timer_pending(&pcpu->cpu_timer);
> +
> + =A0 =A0 =A0 if (pcpu->target_freq !=3D pcpu->policy->min) {
> +#ifdef CONFIG_SMP
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Entering idle while not at lowest =
speed. =A0On some
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* platforms this can hold the other =
CPU(s) at that speed
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* even though the CPU is idle. Set a=
 timer to re-evaluate
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* speed so this idle CPU doesn't hol=
d the other CPUs above
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* min indefinitely. =A0This should p=
robably be a quirk of
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* the CPUFreq driver.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pending) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->time_in_idle =3D =
get_cpu_idle_time_us(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_pro=
cessor_id(), &pcpu->idle_exit_time);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->timer_idlecancel =
=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mod_timer(&pcpu->cpu_ti=
mer,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 jif=
fies + usecs_to_jiffies(timer_rate));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +#endif
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* If at min speed and entering idle =
after load has
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* already been evaluated, and a time=
r has been set just in
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* case the CPU suddenly goes busy, c=
ancel that timer. =A0The
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* CPU didn't go busy; we'll recheck =
things upon idle exit.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pending && pcpu->timer_idlecancel) =
{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_timer(&pcpu->cpu_ti=
mer);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Ensure last timer =
run time is after current idle
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* sample start time,=
 so next idle exit will always
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* start a new idle s=
ampling period.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->idle_exit_time =3D=
 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->timer_idlecancel =
=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> +}
> +
> +static void cpufreq_interactive_idle_end(void)
> +{
> + =A0 =A0 =A0 struct cpufreq_interactive_cpuinfo *pcpu =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 &per_cpu(cpuinfo, smp_processor_id());
> +
> + =A0 =A0 =A0 pcpu->idling =3D 0;
> + =A0 =A0 =A0 smp_wmb();
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Arm the timer for 1-2 ticks later if not already, =
and if the timer
> + =A0 =A0 =A0 =A0* function has already processed the previous load s=
ampling
> + =A0 =A0 =A0 =A0* interval. =A0(If the timer is not pending but has =
not processed
> + =A0 =A0 =A0 =A0* the previous interval, it is probably racing with =
us on another
> + =A0 =A0 =A0 =A0* CPU. =A0Let it compute load based on the previous =
sample and then
> + =A0 =A0 =A0 =A0* re-arm the timer for another interval when it's do=
ne, rather
> + =A0 =A0 =A0 =A0* than updating the interval start time to be "now",=
 which doesn't
> + =A0 =A0 =A0 =A0* give the timer function enough time to make a deci=
sion on this
> + =A0 =A0 =A0 =A0* run.)
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (timer_pending(&pcpu->cpu_timer) =3D=3D 0 &&
> + =A0 =A0 =A0 =A0 =A0 pcpu->timer_run_time >=3D pcpu->idle_exit_time =
&&
> + =A0 =A0 =A0 =A0 =A0 pcpu->governor_enabled) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->time_in_idle =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 get_cpu_idle_time_us(sm=
p_processor_id(),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0&pcpu->idle_exit_time);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->timer_idlecancel =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mod_timer(&pcpu->cpu_timer,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 jiffies + usecs_to_=
jiffies(timer_rate));
> + =A0 =A0 =A0 }
> +
> +}
> +
> +static int cpufreq_interactive_up_task(void *data)
> +{
> + =A0 =A0 =A0 unsigned int cpu;
> + =A0 =A0 =A0 cpumask_t tmp_mask;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 struct cpufreq_interactive_cpuinfo *pcpu;
> +
> + =A0 =A0 =A0 while (1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_current_state(TASK_INTERRUPTIBLE);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&up_cpumask_lock, fla=
gs);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cpumask_empty(&up_cpumask)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&up_cpumask_lock, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (kthread_should_stop=
())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&up_c=
pumask_lock, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_current_state(TASK_RUNNING);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp_mask =3D up_cpumask;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpumask_clear(&up_cpumask);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&up_cpumask_lock=
, flags);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_cpu(cpu, &tmp_mask) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int j;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int max_freq =3D=
 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu =3D &per_cpu(cpuin=
fo, cpu);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_rmb();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pcpu->governor_ena=
bled)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continu=
e;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&set_speed_l=
ock);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_cpu(j, pcpu->p=
olicy->cpus) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
cpufreq_interactive_cpuinfo *pjcpu =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 &per_cpu(cpuinfo, j);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pjc=
pu->target_freq > max_freq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 max_freq =3D pjcpu->target_freq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (max_freq !=3D pcpu-=
>policy->cur)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __cpufr=
eq_driver_target(pcpu->policy,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 max_freq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CPUFREQ_RELATION_H);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&set_speed=
_lock);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->freq_change_time_=
in_idle =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 get_cpu=
_idle_time_us(cpu,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&pcpu->freq_change_time);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void cpufreq_interactive_freq_down(struct work_struct *work)
> +{
> + =A0 =A0 =A0 unsigned int cpu;
> + =A0 =A0 =A0 cpumask_t tmp_mask;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 struct cpufreq_interactive_cpuinfo *pcpu;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&down_cpumask_lock, flags);
> + =A0 =A0 =A0 tmp_mask =3D down_cpumask;
> + =A0 =A0 =A0 cpumask_clear(&down_cpumask);
> + =A0 =A0 =A0 spin_unlock_irqrestore(&down_cpumask_lock, flags);
> +
> + =A0 =A0 =A0 for_each_cpu(cpu, &tmp_mask) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int j;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int max_freq =3D 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu =3D &per_cpu(cpuinfo, cpu);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_rmb();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pcpu->governor_enabled)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&set_speed_lock);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_cpu(j, pcpu->policy->cpus) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpufreq_interact=
ive_cpuinfo *pjcpu =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &per_cp=
u(cpuinfo, j);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pjcpu->target_freq =
> max_freq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 max_fre=
q =3D pjcpu->target_freq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (max_freq !=3D pcpu->policy->cur)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __cpufreq_driver_target=
(pcpu->policy, max_freq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 CPUFREQ_RELATION_H);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&set_speed_lock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->freq_change_time_in_idle =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 get_cpu_idle_time_us(cp=
u,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0&pcpu->freq_change_time);
> + =A0 =A0 =A0 }
> +}
> +
> +static ssize_t show_hispeed_freq(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stru=
ct attribute *attr, char *buf)
> +{
> + =A0 =A0 =A0 return sprintf(buf, "%llu\n", hispeed_freq);
> +}
> +
> +static ssize_t store_hispeed_freq(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct attribute *attr, const char *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 siz=
e_t count)
> +{
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 u64 val;
> +
> + =A0 =A0 =A0 ret =3D strict_strtoull(buf, 0, &val);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 hispeed_freq =3D val;
> + =A0 =A0 =A0 return count;
> +}
> +
> +static struct global_attr hispeed_freq_attr =3D __ATTR(hispeed_freq,=
 0644,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 show_hispeed_freq, store_hispeed_freq);
> +
> +
> +static ssize_t show_go_hispeed_load(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0struct attribute *attr, char *buf)
> +{
> + =A0 =A0 =A0 return sprintf(buf, "%lu\n", go_hispeed_load);
> +}
> +
> +static ssize_t store_go_hispeed_load(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct attribute *attr,=
 const char *buf, size_t count)
> +{
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 unsigned long val;
> +
> + =A0 =A0 =A0 ret =3D strict_strtoul(buf, 0, &val);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 go_hispeed_load =3D val;
> + =A0 =A0 =A0 return count;
> +}
> +
> +static struct global_attr go_hispeed_load_attr =3D __ATTR(go_hispeed=
_load, 0644,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 show_go_hispeed_load, store_go_hispeed_=
load);
> +
> +static ssize_t show_min_sample_time(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
attribute *attr, char *buf)
> +{
> + =A0 =A0 =A0 return sprintf(buf, "%lu\n", min_sample_time);
> +}
> +
> +static ssize_t store_min_sample_time(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct attribute *attr,=
 const char *buf, size_t count)
> +{
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 unsigned long val;
> +
> + =A0 =A0 =A0 ret =3D strict_strtoul(buf, 0, &val);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 min_sample_time =3D val;
> + =A0 =A0 =A0 return count;
> +}
> +
> +static struct global_attr min_sample_time_attr =3D __ATTR(min_sample=
_time, 0644,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 show_min_sample_time, store_min_sample_=
time);
> +
> +static ssize_t show_timer_rate(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct attribute *attr,=
 char *buf)
> +{
> + =A0 =A0 =A0 return sprintf(buf, "%lu\n", timer_rate);
> +}
> +
> +static ssize_t store_timer_rate(struct kobject *kobj,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct attribute *attr,=
 const char *buf, size_t count)
> +{
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 unsigned long val;
> +
> + =A0 =A0 =A0 ret =3D strict_strtoul(buf, 0, &val);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 timer_rate =3D val;
> + =A0 =A0 =A0 return count;
> +}
> +
> +static struct global_attr timer_rate_attr =3D __ATTR(timer_rate, 064=
4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 show_timer_rate, store_timer_rate);
> +
> +static struct attribute *interactive_attributes[] =3D {
> + =A0 =A0 =A0 &hispeed_freq_attr.attr,
> + =A0 =A0 =A0 &go_hispeed_load_attr.attr,
> + =A0 =A0 =A0 &min_sample_time_attr.attr,
> + =A0 =A0 =A0 &timer_rate_attr.attr,
> + =A0 =A0 =A0 NULL,
> +};
> +
> +static struct attribute_group interactive_attr_group =3D {
> + =A0 =A0 =A0 .attrs =3D interactive_attributes,
> + =A0 =A0 =A0 .name =3D "interactive",
> +};
> +
> +static int cpufreq_governor_interactive(struct cpufreq_policy *polic=
y,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int event)
> +{
> + =A0 =A0 =A0 int rc;
> + =A0 =A0 =A0 unsigned int j;
> + =A0 =A0 =A0 struct cpufreq_interactive_cpuinfo *pcpu;
> + =A0 =A0 =A0 struct cpufreq_frequency_table *freq_table;
> +
> + =A0 =A0 =A0 switch (event) {
> + =A0 =A0 =A0 case CPUFREQ_GOV_START:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!cpu_online(policy->cpu))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq_table =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_frequency_get_t=
able(policy->cpu);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_cpu(j, policy->cpus) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu =3D &per_cpu(cpuin=
fo, j);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->policy =3D policy=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->target_freq =3D p=
olicy->cur;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->freq_table =3D fr=
eq_table;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->freq_change_time_=
in_idle =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 get_cpu=
_idle_time_us(j,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0&pcpu->freq_change_time);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->governor_enabled =
=3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_wmb();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!hispeed_freq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hispeed_freq =3D policy=
->max;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Do not register the idle hook and =
create sysfs
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* entries if we have already done so=
=2E
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (atomic_inc_return(&active_count) > =
1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D sysfs_create_group(cpufreq_globa=
l_kobject,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &intera=
ctive_attr_group);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rc)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case CPUFREQ_GOV_STOP:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_cpu(j, policy->cpus) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu =3D &per_cpu(cpuin=
fo, j);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->governor_enabled =
=3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_wmb();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_timer_sync(&pcpu->c=
pu_timer);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Reset idle exit ti=
me since we may cancel the timer
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* before it can run =
after the last idle exit time,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* to avoid tripping =
the check in idle exit for a timer
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* that is trying to =
run.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->idle_exit_time =3D=
 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flush_work(&freq_scale_down_work);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (atomic_dec_return(&active_count) > =
0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sysfs_remove_group(cpufreq_global_kobje=
ct,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &intera=
ctive_attr_group);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case CPUFREQ_GOV_LIMITS:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (policy->max < policy->cur)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __cpufreq_driver_target=
(policy,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 policy->max, CPUFREQ_RELATION_H);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (policy->min > policy->cur)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __cpufreq_driver_target=
(policy,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 policy->min, CPUFREQ_RELATION_L);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int cpufreq_interactive_idle_notifier(struct notifier_block *=
nb,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0unsigned long val,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0void *data)
> +{
> + =A0 =A0 =A0 switch (val) {
> + =A0 =A0 =A0 case SCHED_IDLE_START:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_interactive_idle_start();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case SCHED_IDLE_END:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_interactive_idle_end();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct notifier_block cpufreq_interactive_idle_nb =3D {
> + =A0 =A0 =A0 .notifier_call =3D cpufreq_interactive_idle_notifier,
> +};
> +
> +static int __init cpufreq_interactive_init(void)
> +{
> + =A0 =A0 =A0 unsigned int i;
> + =A0 =A0 =A0 struct cpufreq_interactive_cpuinfo *pcpu;
> + =A0 =A0 =A0 struct sched_param param =3D { .sched_priority =3D MAX_=
RT_PRIO-1 };
> +
> + =A0 =A0 =A0 go_hispeed_load =3D DEFAULT_GO_HISPEED_LOAD;
> + =A0 =A0 =A0 min_sample_time =3D DEFAULT_MIN_SAMPLE_TIME;
> + =A0 =A0 =A0 timer_rate =3D DEFAULT_TIMER_RATE;
> +
> + =A0 =A0 =A0 /* Initalize per-cpu timers */
> + =A0 =A0 =A0 for_each_possible_cpu(i) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu =3D &per_cpu(cpuinfo, i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 init_timer(&pcpu->cpu_timer);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->cpu_timer.function =3D cpufreq_in=
teractive_timer;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcpu->cpu_timer.data =3D i;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 up_task =3D kthread_create(cpufreq_interactive_up_task,=
 NULL,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"kin=
teractiveup");
> + =A0 =A0 =A0 if (IS_ERR(up_task))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(up_task);
> +
> + =A0 =A0 =A0 sched_setscheduler_nocheck(up_task, SCHED_FIFO, &param)=
;
> + =A0 =A0 =A0 get_task_struct(up_task);
> +
> + =A0 =A0 =A0 /* No rescuer thread, bind to CPU queuing the work for =
possibly
> + =A0 =A0 =A0 =A0 =A0warm cache (probably doesn't matter much). */
> + =A0 =A0 =A0 down_wq =3D alloc_workqueue("knteractive_down", 0, 1);
> +
> + =A0 =A0 =A0 if (!down_wq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_freeuptask;
> +
> + =A0 =A0 =A0 INIT_WORK(&freq_scale_down_work,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_interactive_freq_down);
> +
> + =A0 =A0 =A0 spin_lock_init(&up_cpumask_lock);
> + =A0 =A0 =A0 spin_lock_init(&down_cpumask_lock);
> + =A0 =A0 =A0 mutex_init(&set_speed_lock);
> +
> + =A0 =A0 =A0 sched_idle_notifier_register(&cpufreq_interactive_idle_=
nb);
> +
> + =A0 =A0 =A0 return cpufreq_register_governor(&cpufreq_gov_interacti=
ve);
> +
> +err_freeuptask:
> + =A0 =A0 =A0 put_task_struct(up_task);
> + =A0 =A0 =A0 return -ENOMEM;
> +}
> +
> +#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_INTERACTIVE
> +fs_initcall(cpufreq_interactive_init);
> +#else
> +module_init(cpufreq_interactive_init);
> +#endif
> +
> +static void __exit cpufreq_interactive_exit(void)
> +{
> + =A0 =A0 =A0 cpufreq_unregister_governor(&cpufreq_gov_interactive);
> + =A0 =A0 =A0 kthread_stop(up_task);
> + =A0 =A0 =A0 put_task_struct(up_task);
> + =A0 =A0 =A0 destroy_workqueue(down_wq);
> +}
> +
> +module_exit(cpufreq_interactive_exit);
> +
> +MODULE_AUTHOR("Mike Chan <mike@android.com>");
> +MODULE_DESCRIPTION("'cpufreq_interactive' - A cpufreq governor for "
> + =A0 =A0 =A0 "Latency sensitive workloads");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 6216115..c6126b9 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -363,6 +363,9 @@ extern struct cpufreq_governor cpufreq_gov_ondema=
nd;
> =A0#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE)
> =A0extern struct cpufreq_governor cpufreq_gov_conservative;
> =A0#define CPUFREQ_DEFAULT_GOVERNOR =A0 =A0 =A0 (&cpufreq_gov_conserv=
ative)
> +#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_INTERACTIVE)
> +extern struct cpufreq_governor cpufreq_gov_interactive;
> +#define CPUFREQ_DEFAULT_GOVERNOR =A0 =A0 =A0 (&cpufreq_gov_interacti=
ve)
> =A0#endif
>
>
> --
> 1.7.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
