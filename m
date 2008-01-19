From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Cbe-oss-dev] Subject: cell: add spu aware cpufreq governor
Date: Sat, 19 Jan 2008 22:38:44 +0100
Message-ID: <200801192238.45636.arnd@arndb.de>
References: <20080118171119.3faa4a6a@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080118171119.3faa4a6a@de.ibm.com>
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
To: cbe-oss-dev@ozlabs.org
Cc: Christian Krafft <krafft@de.ibm.com>, cpufreq@lists.linux.org.uk

On Friday 18 January 2008, Christian Krafft wrote:
> +#include <linux/cpufreq.h>
> +#include <linux/sched.h>
> +#include <linux/timer.h>
> +#include <asm/atomic.h>
> +#include <asm/machdep.h>
> +#include <asm/spu.h>
> +
> +#include "asm/cell-regs.h"
> +
> +#define DEBUG		1

You should have the '#define DEBUG' _before_ the #includes, otherwise pr_debug
and friends don't do what you think they do.

> +static void spu_gov_init_work(struct spu_gov_info_struct *info);

Try to avoid forward declarations for static functions, instead reorder
the functions in call order.

> +
> +static void spu_gov_timer(struct work_struct *work)

'timer' is a bad name for a work function, because it suggests
you're working on a timer_list.

> +static void spu_gov_init_work(struct spu_gov_info_struct *info)
> +{
> +	int delay = usecs_to_jiffies(info->poll_int * 1000);
> +	delay -= jiffies % delay;
> +	INIT_DELAYED_WORK_DEFERRABLE(&info->work, spu_gov_timer);
> +	queue_delayed_work_on(info->policy->cpu, kspugov_wq, &info->work, delay);
> +}

I think you shouldn't call INIT_DELAYED_WORK_DEFERRABLE() more than once.
While I'm not sure if it's actually broken like you do it, it's certainly
not how this interface was meant to be used.

What's the point of the computation, can't you just always queue the
work to be run in info->poll_int miliseconds from the time you call it?

> +static void spu_gov_cancel_work(struct spu_gov_info_struct *info)
> +{
> +	cancel_delayed_work(&info->work);
> +}

Doesn't that need to be cancel_delayed_work_sync() for rearming work queues?

> +static int __init spu_gov_init(void)
> +{
> +	if (!machine_is(cell))
> +		return -ENODEV;

This seems wrong, why would you only allow that on cell platforms,
but e.g. not celleb or even ps3 (assuming they had a cpufreq
backend)? I think the only dependency is on spufs being loaded and
that should work using module dependencies.

> +	kspugov_wq = create_workqueue("kspugov");
> +	if (!kspugov_wq) {
> +		printk(KERN_ERR "creation of kspugov failed\n");
> +		return -EFAULT;
> +	}
> +
> +	return cpufreq_register_governor(&spu_governor);
> +}
> +
> +static void __exit spu_gov_exit(void)
> +{
> +	cpufreq_unregister_governor(&spu_governor);
> +	destroy_workqueue(kspugov_wq);
> +}

What happens when the work functions is called after unregistering?

	Arnd <><
