From: "Joseph Xu" <josephzxu@gmail.com>
Subject: Re: problem in sysfs_set_policy
Date: Fri, 11 Jul 2008 00:34:27 -0400
Message-ID: <bc342bf90807102134n2d0dc88boc43a980fd0da395e@mail.gmail.com>
References: <bc342bf90806221938k34788a57v991396c371bf4943@mail.gmail.com>
	<20080710200339.GA29755@isilmar.linta.de>
	<bc342bf90807102114p6e58e696rae7c84f416904ecd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bc342bf90807102114p6e58e696rae7c84f416904ecd@mail.gmail.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Okay, I'm an idiot. I just realized I mixed up min and max in the
patch description. The correct description should be:

Fixes a bug that causes failure when trying to write a new cpufreq
policy whose minimum frequency value is greater than the old policy's
maximum frequency value. Since the min value is not allowed to be
greater than the max value, writing to the proc file scaling_max_freq
will fail. The patch checks for this situation, and if it occurs, will
write the new min value before writing the new max value.

On Fri, Jul 11, 2008 at 12:14 AM, Joseph Xu <josephzxu@gmail.com> wrote:
> Here you go. I've never submitted a kernel patch before, the rules
> seem kind of stringent. Hope this format is correct.
> ---
> Fixes a bug that causes failure when trying to write a new cpufreq
> policy whose minimum frequency value is greater than the old policy's
> maximum frequency value. Since the min value is not allowed to be
> greater than the max value, writing to the proc file scaling_min_freq
> will fail. The patch checks for this situation, and if it occurs, will
> write the max value before writing the min value.
>
> Signed-off-by: Joseph Xu <josephzxu@gmail.com>
>
> --- cpufrequtils-002/lib/sysfs.c        2006-06-01 04:54:41.000000000 -0400
> +++ cpufrequtils-002-patched/lib/sysfs.c        2008-07-10 23:50:08.000000000 -0400
> @@ -495,6 +495,8 @@
>        char max[SYSFS_PATH_MAX];
>        char gov[SYSFS_PATH_MAX];
>        int ret;
> +       unsigned long old_min;
> +       int write_max_first;
>
>        if (!policy || !(policy->governor))
>                return -EINVAL;
> @@ -508,14 +510,25 @@
>        snprintf(min, SYSFS_PATH_MAX, "%lu", policy->min);
>        snprintf(max, SYSFS_PATH_MAX, "%lu", policy->max);
>
> -       ret = sysfs_write_one_value(cpu, WRITE_SCALING_MAX_FREQ, max, strlen(max));
> -       if (ret)
> -               return ret;
> +       old_min = sysfs_get_one_value(cpu, SCALING_MIN_FREQ);
> +       write_max_first = (old_min && (policy->max < old_min) ? 0 : 1);
> +
> +       if (write_max_first) {
> +               ret = sysfs_write_one_value(cpu, WRITE_SCALING_MAX_FREQ, max, strlen(max));
> +               if (ret)
> +                       return ret;
> +       }
>
>        ret = sysfs_write_one_value(cpu, WRITE_SCALING_MIN_FREQ, min, strlen(min));
>        if (ret)
>                return ret;
>
> +       if (!write_max_first) {
> +               ret = sysfs_write_one_value(cpu, WRITE_SCALING_MAX_FREQ, max, strlen(max));
> +               if (ret)
> +                       return ret;
> +       }
> +
>        return sysfs_write_one_value(cpu, WRITE_SCALING_GOVERNOR, gov, strlen(gov));
>  }
>
