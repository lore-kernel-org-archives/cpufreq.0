From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Sat, 24 May 2008 13:03:09 +0200
Message-ID: <20080524110309.GB13173@isilmar.linta.de>
References: <1209844030.13290.5.camel@linux-2bdv.site>
	<20080511161934.GI15445@codemonkey.org.uk>
	<20080522040118.GA28737@anvil.corenet.prv>
	<1211541678.29901.78.camel@queen.suse.de>
	<20080523084737.ZZRA012@mailhub.coreip.homeip.net>
	<1211555977.29901.110.camel@queen.suse.de>
	<20080523113206.ZZRA012@mailhub.coreip.homeip.net>
	<1211559367.29901.140.camel@queen.suse.de>
	<20080523133809.ZZRA012@mailhub.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20080523133809.ZZRA012@mailhub.coreip.homeip.net>
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
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, mzahor@dtech.sk, cpufreq <cpufreq@lists.linux.org.uk>

Hi,

On Fri, May 23, 2008 at 01:40:22PM -0400, Dmitry Torokhov wrote:
> On Fri, May 23, 2008 at 06:16:07PM +0200, Thomas Renninger wrote:
> > ...
> > > > How much Watts does the machine
> > > > save power when it is idle using p4-clockmod?
> > > 
> > > Don't care. Don't care. Do I need to repeat it? I don't care. All I
> > > know is that it87 reports lower temperature when CPU is throttled.
> > How much is it, constantly?
> > 
> 
> Hmm, it looks ike on ide it is about 78C throttled and 81 unthrottled
> (I would not pay attention to absolute numbers, I never actually tried
> to calibrate the readings). So apparently not a lot... For some reason
> I remember the difference a bit bigger, maybe I was lookig under light
> load?

Probably you were looking under more or less heavy load, for then and only
then p4-clockmod makes a difference. (>12.5 load at least)

Thomas: the question whether it saves power when it is idle is not a good
criterion -- IIRC, some Intel SpeedStep-capable processors do enter the same
low voltage idle state, so on a 100% idle system acpi-cpufreq wouldn't make
a difference there either. Similarily, some cpufreq drivers which only do
frequency scaling but not frequency and voltage scaling will also only see
limited energy savings on 100% idle.

To summarize: If the CPU load is constantly x (0<x<1) within a timeframe,
the _CPU_ energy consumption of an ideal system is approximately

- if the CPU does not support frequency or voltage scaling:

	E_none	=  E_idle * (1-x) + E_max * x

- if the CPU supports frequency scaling (with linear energy savings):

	E_fs	=  E_idle + (E_max - E_idle) * x  = E_none

- if the CPU supports throttling:

	E_t	=  E_idle * (1-x) + E_max * x = E_none

- if the CPU supports frequency and voltage scaling (with energy savings to
  the power of two)

	E_fvs	=  E_idle + (E_max - E_idle) * x^2


This shows that:
1) _if_ idle states work properly, and
2) _if_ the system needs to finish tasks as soon as possible,
neither frequency scaling alone nor throttling will get you anything.

Now, let's test whether these two requirements are met:

ad 1) to the Intel folks out here: is C1 entered during throttling, or some
deeper sleep level? If it's something deeper, this requirement is not met on
my desktop P4 which only offers C1. 

ad 2) I can see of two aspects where this is invalid:
	- programs which will eat up as much CPU as possible e.g. for
	  even more frames per seconds, and
	- thermal side-effects: if the CPU energy consumption surpasses
	  certain thresholds, fans might be needed for cooling, or their
	  rotational speed increased, thereby also increasing the noise,
	  and not to forget the increased hardware wear by increased
	  temperatures...

However, this second requirement alone might be able to be met by software
alone, as long as the first requirement -- a proper idle state is entered --
is fulfilled:
(1) Currently, _all_ tasks preempt the idle task -- if there's only one task
running in nice level 19, that one gets 100% of the CPU, and the idle thread
gets none.
(2) One could now start a task with a very high priority, which schedules
its own wakeup, and then calls cpuidle_idle_call(). Caveat: this would not
work properly in a high-interrupt system.

Now, such a kernel module would do what -- it would _emulate_ frequency
scaling in a software level, while p4-clockmod _emulates_ frequency scaling
in hardware. Therefore, the correct place for p4-clockmod and such a generic
"I do not want to use my hardware 100%"-module is within the framework which
is made for the capabilities they emulate: cpufreq.

Best,
	Dominik
