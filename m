From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Mon, 30 Aug 2004 22:04:07 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040830200407.GB8563@dominikbrodowski.de>
References: <20040829125717.GA17032@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
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

On Mon, Aug 30, 2004 at 12:28:44PM -0400, Zwane Mwaikambo wrote:
> On Sun, 29 Aug 2004, Dominik Brodowski wrote:
> 
> > > This currently oopses when a processor goes offline since it can't
> > > schedule itself onto the correct cpu.
> >
> > What's the call trace? Because I don't see why it should happen: if the CPU
> > is removed, cpufreq_remove_dev() gets called, which cleans up the governor
> > and the device driver -- and I can't see a call to setdc in this code path.
> 
> kernel BUG at arch/i386/kernel/cpu/cpufreq/p4-clockmod.c:148!

Thanks.

> > > So we now disable preemption whilst reading or setting the DC.
> > Or should we disable CPU hotplug [IIRC there's some callback to temporarily
> > do that] in the cpufreq core before calling ->target() or ->get()
> >
> > > There is a questionable hunk which returns the
> > > stock_freq if the processor being read from is offline.
> 
> The cpufreq_sysdev_driver stuff only covers device removal and won't cover
> the processor being removed.

What? If the processor X is removed, the kobject / device of
/sys/devices/system/cpu/cpuX/ will not be unregistered? If that is the case,
then the current cpufreq core indeed is severely broken....

> In order to take care of that you need to either
> disable preemption
... however, I dislike disabling preemption -- it can cause long latencies,
after all -- and prefer disabling CPU hotplug around calls to ->target() and
->get()...

> or hold the cpucontrol semaphore, or you could register
> a cpu online/offline notifier and do the necessary work there.
... and that cpu online/offline notifier must then do what I thought the
sysfs device ->add()/->remove() calls were doing.

Thanks,
	Dominik
