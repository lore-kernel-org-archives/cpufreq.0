From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] ARM: ux500: send cpufreq notification for all cpus
Date: Wed, 24 Aug 2011 11:26:07 +0200
Message-ID: <CAKfTPtDf61SpfaD8vuZePF1Z2=DrSxOSr3_89VVwUMGykBAXNA@mail.gmail.com>
References: <1314168245-2373-1-git-send-email-vincent.guittot@linaro.org>
	<4E54B5AC.60608@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4E54B5AC.60608@ti.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Santosh <santosh.shilimkar@ti.com>
Cc: linus.walleij@linaro.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org

On 24 August 2011 10:26, Santosh <santosh.shilimkar@ti.com> wrote:
> On Wednesday 24 August 2011 12:14 PM, Vincent Guittot wrote:
>>
>> The same clock is used for all cpus so we must notify the frequency =
change
>> for each one in order to update the configuration of all twd clockev=
ents.
>>
>> Signed-off-by: Vincent Guittot<vincent.guittot@linaro.org>
>> ---
>> =A0drivers/cpufreq/db8500-cpufreq.c | =A0 =A07 ++++---
>> =A01 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/cpufreq/db8500-cpufreq.c
>> b/drivers/cpufreq/db8500-cpufreq.c
>> index 0d8dd1c..4cb5785 100644
>> --- a/drivers/cpufreq/db8500-cpufreq.c
>> +++ b/drivers/cpufreq/db8500-cpufreq.c
>> @@ -76,13 +76,13 @@ static int db8500_cpufreq_target(struct cpufreq_=
policy
>> *policy,
>>
>> =A0 =A0 =A0 =A0freqs.old =3D policy->cur;
>> =A0 =A0 =A0 =A0freqs.new =3D freq_table[idx].frequency;
>> - =A0 =A0 =A0 freqs.cpu =3D policy->cpu;
>>
>> =A0 =A0 =A0 =A0if (freqs.old =3D=3D freqs.new)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>>
>> =A0 =A0 =A0 =A0/* pre-change notification */
>> - =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
>> + =A0 =A0 =A0 for_each_online_cpu(freqs.cpu)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUF=
REQ_PRECHANGE);
>
> Blind notfier on all online CPU's will race. Take a example whete CPU
> is marked online but not yet registered to CPUFREQ. I have seen such =
a
> race in OMAP and fixed that using the policy->cpus field.
>

You're right, I'm going to use policy->cpus instead

> Regards
> Santosh
>
>
