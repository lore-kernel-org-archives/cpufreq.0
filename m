From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Mon, 30 Aug 2004 17:41:27 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0408301735320.21527@montezuma.fsmlabs.com>
References: <20040829125717.GA17032@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
	<20040830200407.GB8563@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040830200407.GB8563@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: CPU Freq ML <cpufreq@www.linux.org.uk>

On Mon, 30 Aug 2004, Dominik Brodowski wrote:

> > The cpufreq_sysdev_driver stuff only covers device removal and won't cover
> > the processor being removed.
>
> What? If the processor X is removed, the kobject / device of
> /sys/devices/system/cpu/cpuX/ will not be unregistered? If that is the case,
> then the current cpufreq core indeed is severely broken....

I think i may be misunderstood, i mean it won't handle a processor being
removed from the online map.

> > In order to take care of that you need to either
> > disable preemption
> ... however, I dislike disabling preemption -- it can cause long latencies,
> after all -- and prefer disabling CPU hotplug around calls to ->target() and
> ->get()...
>
> > or hold the cpucontrol semaphore, or you could register
> > a cpu online/offline notifier and do the necessary work there.
> ... and that cpu online/offline notifier must then do what I thought the
> sysfs device ->add()/->remove() calls were doing.

It should just be a matter of holding the semaphore during ->get() and
->target, i go for the preempt_disable a lot of the time to avoid too many
contenders for the semaphore and since the preemption critical sections
are fairly short. Regarding other drivers, yes they are mostly all unsafe,
the ACPI one definitely needs looking at too.

Thanks,
	Zwane
