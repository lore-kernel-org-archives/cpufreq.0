From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Wed, 1 Sep 2004 12:18:17 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0409011215110.4378@montezuma.fsmlabs.com>
References: <20040829125717.GA17032@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
	<20040830200407.GB8563@dominikbrodowski.de>
	<Pine.LNX.4.58.0408301735320.21527@montezuma.fsmlabs.com>
	<20040830214707.GA9324@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040830214707.GA9324@dominikbrodowski.de>
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

> Why? If the CPU is removed [and thus removed from the online map] the device
> disappears from the kernel's perspective -- so there's no room for the
> /sys/devices/system/cpu/cpuX/ kobject.

It hasn't disappeared as a device, only that the processor will not
participate in a number of kernel processes. The kobject has to also stay
around so that we can online it again.

> While it is short for p4-clockmod, it isn't sufficiently short for
> powernow-k8.

Yeah we'll have to go case by case.

Thanks,
	Zwane
