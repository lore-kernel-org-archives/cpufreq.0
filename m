From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Fri, 3 Sep 2004 17:37:27 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040903153727.GA9969@dominikbrodowski.de>
References: <20040829125717.GA17032@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
	<20040830200407.GB8563@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301735320.21527@montezuma.fsmlabs.com>
	<20040830214707.GA9324@dominikbrodowski.de>
	<Pine.LNX.4.58.0409011215110.4378@montezuma.fsmlabs.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0409011215110.4378@montezuma.fsmlabs.com>
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

On Wed, Sep 01, 2004 at 12:18:17PM -0400, Zwane Mwaikambo wrote:
> On Mon, 30 Aug 2004, Dominik Brodowski wrote:
> 
> > Why? If the CPU is removed [and thus removed from the online map] the device
> > disappears from the kernel's perspective -- so there's no room for the
> > /sys/devices/system/cpu/cpuX/ kobject.
> 
> It hasn't disappeared as a device, only that the processor will not
> participate in a number of kernel processes. The kobject has to also stay
> around so that we can online it again.

OK.

> > While it is short for p4-clockmod, it isn't sufficiently short for
> > powernow-k8.
> 
> Yeah we'll have to go case by case.

But I _really_ _don't_ _like_ _it_. Having to disable preemption for the
corner case of CPU hotplug. How often do CPU hotplug events happen? Very
rarely compared to _other_ valid preempting code, e.g. audio IRQs... And I
don't see _any_ reason why CPU hotplug couldn't wait until a cpufreq request
for a CPU is finished. However, the current CPU hotplug notifiers don't
allow for this: they only notify the notifiers if the CPU is down, not
before to avoid migrating to/switching frequency of the dying CPU.

I'm thinking of one of the following two implementations:


A)

DOWN:
1.) notifier informs cpufreq that CPU is dying
2.) cpufreq grabs policy lock
3.) sets a flag or something so that future cpufreq-related calls for this
    CPU will fail
4.) cpufreq release policy lock
5.) cpu is removed from online_map ....


UP:
1.) cpu is online 
2.) notifier informs cpufreq that CPU is ONLINE
3.) cpufreq grabs policy lock
4.) clears the flag mentioned above

Problem: ->exit() and ->init() aren't called for the CPU going off- or
online which means that changes in their cpufreq capabilities won't be
noticed.


B)

DOWN:
1.) notifier informs cpufreq that CPU is dying
2.) cpufreq_remove_dev() is executed, finishes only when _all_ current
	cpufreq-related work on this CPU is done
3.) cpu is removed from online_map....

UP:
1.) cpu is online
2.) notifier informs cpufreq that CPU is ONLINE
3.) cpufreq_add_dev() is executed


	Dominik
