From: Pavel Machek <pavel@ucw.cz>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Wed, 25 Feb 2004 18:43:27 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040225174326.GD1214@elf.ucw.cz>
References: <20040216213435.GA9680@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040216213435.GA9680@dominikbrodowski.de>
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
To: dual_bereta_r0x@arenanetwork.com.br, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

Hi!

> By doing so it becomes easier to enter different frequencies e.g. into
> /sys/devices/system/cpu/cpufreq/scaling_setspeed -- on my desktop, typing in
> 1200000 is easier than 12121224... [*]
... 
> [*] The _actual_ CPU speed should be used on all cpufreq drivers where this
> specific CPU frequency has implications to external components, e.g. LCD,
> memory or pcmcia devices. Where only the _frequency ratio_ is of importance
> [for loops_per_jiffy and friends] such "rounding" is acceptable, as long as
> the ratio is constant.

Hey, that's ugly. Values should be real.

If you have troubles typing real frequency, you can either use
/proc/cpufreq and specify values in percent, or modify
scaling_setspeed to go for nearest lower frequency, or create bash
scripts "hi_speed" and "low_speed"; but please don't break
interface....
								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
