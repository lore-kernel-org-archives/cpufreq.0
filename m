From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Mon, 30 Aug 2004 23:47:07 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040830214707.GA9324@dominikbrodowski.de>
References: <20040829125717.GA17032@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
	<20040830200407.GB8563@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301735320.21527@montezuma.fsmlabs.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408301735320.21527@montezuma.fsmlabs.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zwane Mwaikambo <zwane@linuxpower.ca>
Cc: CPU Freq ML <cpufreq@www.linux.org.uk>

On Mon, Aug 30, 2004 at 05:41:27PM -0400, Zwane Mwaikambo wrote:
> On Mon, 30 Aug 2004, Dominik Brodowski wrote:
> 
> > > The cpufreq_sysdev_driver stuff only covers device removal and won't cover
> > > the processor being removed.
> >
> > What? If the processor X is removed, the kobject / device of
> > /sys/devices/system/cpu/cpuX/ will not be unregistered? If that is the case,
> > then the current cpufreq core indeed is severely broken....
> 
> I think i may be misunderstood, i mean it won't handle a processor being
> removed from the online map.

Why? If the CPU is removed [and thus removed from the online map] the device
disappears from the kernel's perspective -- so there's no room for the
/sys/devices/system/cpu/cpuX/ kobject.

> > > In order to take care of that you need to either
> > > disable preemption
> > ... however, I dislike disabling preemption -- it can cause long latencies,
> > after all -- and prefer disabling CPU hotplug around calls to ->target() and
> > ->get()...
> >
> > > or hold the cpucontrol semaphore, or you could register
> > > a cpu online/offline notifier and do the necessary work there.
> > ... and that cpu online/offline notifier must then do what I thought the
> > sysfs device ->add()/->remove() calls were doing.
> 
> It should just be a matter of holding the semaphore during ->get() and
> ->target, i go for the preempt_disable a lot of the time to avoid too many
> contenders for the semaphore and since the preemption critical sections
> are fairly short.

While it is short for p4-clockmod, it isn't sufficiently short for
powernow-k8.

Thanks,
	Dominik
