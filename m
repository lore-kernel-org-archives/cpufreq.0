From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Sun, 29 Aug 2004 14:57:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040829125717.GA17032@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
To: zwane@linuxpower.ca, cpufreq@www.linux.org.uk

> This currently oopses when a processor goes offline since it can't
> schedule itself onto the correct cpu.

What's the call trace? Because I don't see why it should happen: if the CPU
is removed, cpufreq_remove_dev() gets called, which cleans up the governor
and the device driver -- and I can't see a call to setdc in this code path.

> So we now disable preemption whilst reading or setting the DC.
Or should we disable CPU hotplug [IIRC there's some callback to temporarily
do that] in the cpufreq core before calling ->target() or ->get()

> There is a questionable hunk which returns the
> stock_freq if the processor being read from is offline.

and it would avoid this very very questionable hunk...

Thanks,
	Dominik
