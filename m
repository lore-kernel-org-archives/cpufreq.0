From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 3/6] cpufreq: tolerate inexact values when collecting stats
Date: Thu, 1 Nov 2012 11:14:21 +0900
Message-ID: <CAJ0PZbQYbmUM_cZ07X0_6ocqc0zH4asbLpvkr+W2tkN_9YLkzA@mail.gmail.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com>
	<1351685025-26698-1-git-send-email-mark.langsdorf@calxeda.com>
	<1351685025-26698-4-git-send-email-mark.langsdorf@calxeda.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=tbhQpyHJl40yAlclhGs1PIayHBlr1kHFg9wmCQutJX4=;
        b=vxKm+ierg/GYUf16vUC8Zxs9vvesykb2nRO9Lfyd+aBL/QX60wjSxNYUTsfY9GPiAC
         DFZ4wxQCjHSklMyQs4fQs/4w6bIseOuMHPR6R7s/EvBGClBcPGzJcT1WkEwbld7t95va
         KnzvXmbqdvmuZhWRN08n/PaaXeEMmmes+KKFKudfR/rR+FqQkm4c/zKKnN8IBKknHHaU
         qSBnX92Rb0DlnB6DbzLeALCsrTxohTPZ6fo+q2Q1SkPn6n7fMFfXOT9kPv3mY4ac2Cd/
         bbZf8iacAp1qY/IqQI1n4PGfvyMX8H6U+2v/l4CA0Qxo9lQ5cmp6HRhz4VhL8RPGZLp2
         jaOA==
In-Reply-To: <1351685025-26698-4-git-send-email-mark.langsdorf@calxeda.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org

On Wed, Oct 31, 2012 at 9:03 PM, Mark Langsdorf
<mark.langsdorf@calxeda.com> wrote:
> Allow frequency values to vary by +/-5000 Hz when collecting stats.
>
> Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>
> Cc: cpufreq@vger.kernel.org
> Cc: Rafael J. Wysocki <rjw@sisk.pl>

If we are getting values with some variations from policy->cur and we
can sure that the every "intended" frequency is already included in
the freq_table[] array, why don't we simply do rounding based on the
freq_table[]? (choosing the closest value from the table)

Besides, your proposal may incur bugs in my system (look at the first
two values):

mzx@hisui:~/test$ cat
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
3401000 3400000 3200000 3000000 2800000 2600000 2400000 2200000
2000000 1800000 1600000
mzx@hisui:~/test$ cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 42
model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
stepping	: 7
cpu MHz		: 1600.000
cache size	: 8192 KB
[skip]


Cheers,
MyungJoo






>
> ---
>  drivers/cpufreq/cpufreq_stats.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
> index 3998316..4e2ea7e 100644
> --- a/drivers/cpufreq/cpufreq_stats.c
> +++ b/drivers/cpufreq/cpufreq_stats.c
> @@ -158,9 +158,11 @@ static struct attribute_group stats_attr_group = {
>  static int freq_table_get_index(struct cpufreq_stats *stat, unsigned int freq)
>  {
>         int index;
> -       for (index = 0; index < stat->max_state; index++)
> -               if (stat->freq_table[index] == freq)
> +       for (index = 0; index < stat->max_state; index++) {
> +               if ((stat->freq_table[index] < (freq + 5000)) &&
> +                   (stat->freq_table[index] > (freq - 5000)))
>                         return index;
> +       }
>         return -1;
>  }
>
> @@ -251,6 +253,8 @@ static int cpufreq_stats_create_table(struct cpufreq_policy *policy,
>         spin_lock(&cpufreq_stats_lock);
>         stat->last_time = get_jiffies_64();
>         stat->last_index = freq_table_get_index(stat, policy->cur);
> +       if (stat->last_index > stat->max_state)
> +               stat->last_index = stat->max_state - 1;
>         spin_unlock(&cpufreq_stats_lock);
>         cpufreq_cpu_put(data);
>         return 0;
> --
> 1.7.11.7
>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
MyungJoo Ham, Ph.D.
System S/W Lab, S/W Center, Samsung Electronics
