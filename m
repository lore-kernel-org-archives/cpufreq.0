From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Sat, 4 Sep 2004 21:00:19 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.53.0409042021530.14142@montezuma.fsmlabs.com>
References: <20040829125717.GA17032@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
	<20040830200407.GB8563@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301735320.21527@montezuma.fsmlabs.com>
	<20040830214707.GA9324@dominikbrodowski.de>
	<Pine.LNX.4.58.0409011215110.4378@montezuma.fsmlabs.com>
	<20040903153727.GA9969@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040903153727.GA9969@dominikbrodowski.de>
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

On Fri, 3 Sep 2004, Dominik Brodowski wrote:

> But I _really_ _don't_ _like_ _it_. Having to disable preemption for the
> corner case of CPU hotplug. How often do CPU hotplug events happen? Very
> rarely compared to _other_ valid preempting code, e.g. audio IRQs... And I
> don't see _any_ reason why CPU hotplug couldn't wait until a cpufreq request
> for a CPU is finished. However, the current CPU hotplug notifiers don't
> allow for this: they only notify the notifiers if the CPU is down, not
> before to avoid migrating to/switching frequency of the dying CPU.

Well interrupts would still preempt (side note, do any of these hardware 
programming have timing requirements? If so preempt might be a problem 
anyway) those scheduling preemption disabled sections.

> A)
> 
> DOWN:
> 1.) notifier informs cpufreq that CPU is dying
> 2.) cpufreq grabs policy lock
> 3.) sets a flag or something so that future cpufreq-related calls for this
>     CPU will fail
> 4.) cpufreq release policy lock
> 5.) cpu is removed from online_map ....
> 
> 
> UP:
> 1.) cpu is online 
> 2.) notifier informs cpufreq that CPU is ONLINE
> 3.) cpufreq grabs policy lock
> 4.) clears the flag mentioned above
> 
> Problem: ->exit() and ->init() aren't called for the CPU going off- or
> online which means that changes in their cpufreq capabilities won't be
> noticed.

Well the major differences between A and B appear to be discovery of new 
capabilities on online processors. I wouldn't go that far as asynchronous 
multiprocessing systems aren't supported in general, but at least it 
allows for releasing memory for unused processors, which can't be a bad 
thing.

Thanks,
	Zwane
