From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Which cpufreq driver is best for ...
Date: Wed, 3 Sep 2003 23:01:53 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030903210153.GA19704@brodo.de>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<20030903192749.GA30360@brodo.de>
	<20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl> <20030903193040.GB30360@brodo.de>
	<20030903195013.GA25291@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903195013.GA25291@gamma.logic.tuwien.ac.at>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Norbert Preining <preining@logic.at>
Cc: cpufreq@www.linux.org.uk

Dear Norbert,


> On Mit, 03 Sep 2003, Dominik Brodowski wrote:
> > No, speedstep-ich is "superior". p4-clockmod only "throttles" the CPU, i.e.
> > it scales down the frequency but not the voltage. This results in an
> > approximately linear saving of energy. speedstep-ich also scales the
> > voltage, which causes much better saving of energy. 
> 
> Sorry for the stupid questions, but why there are 8 different cpu
> frequencies possible with p4-clockmod, while there are only 2 with
> speedstep-ich?

The difference is the following: 

A.) SpeedStep I: The Front Side Bus (FSB) of your CPU is,
most likely, 100 MHz. Within the kernel this is multiplied by a certain
factor to get the CPU frequency. On SpeedStep-capable CPUs there are not one
but _two_ such multipliers -- with two different factors. This is controlled
by _one_ input pin to the CPU, and thus offers only two different operating
frequencies.

B.) Throttling [p4-clockmod]: The CPU only "works" if the clock signal (which
is produced externally and then modified in the mutliplier) is propagated 
throughout the CPU. It is possible to block this clock signal for certain 
periods of time -- so if each char represents a clock tick, the following is
done when 50% throttling is active:
xxxx----xxxx----xxxx----xxxx----
where x denotes the CPU "works" and - denotes where the CPU doesn't do
anything usefull at all.
And probably it's easy to stop every eigth or so CPU clock signal, so you
get 8 different throttling states.

[For informational purposes only:]
C.) SpeedStep II [what you can find on the "Centrino" Pentium-M processor]:
It is not an input pin which steers the frequency multiplier, but a "Model
Specific Register" (MSR), and thus more different frequency multiplier == 
speed settings are possible.

> > And as long as ACPI C-States "idling" or APM "hlt" instructions work, the
> > CPU is "throttled"[*] if there is no work to do anyway, so the p4-clockmod
> > driver doesn't save you anything. The p4-clockmod driver almost only is
> > useful where ACPI or APM "idling" is borken.
> 
> Does this mean, that with speedstep-ich I do *not* need a
> cpufreq/speedstep/cpudyn/(insert your favorite) daemon and this is done
> automatically?

No, with the _p4-clockmod_ driver you don't need a cpudyn daemon [except -
see below...]. With _speedstep-ich_ it'd be very usefull.

> More detailed: linux-2.4.23-pre2 with cpufreq from cvs: What is the best
> way to:
> 	* reduce heat
> 	* increase battery life
both aims are effectively the same: the less energy you use, the less heat
is produced, and the longer the battery lasts.

> (and still do some work, but I normally do not have big long cpu intense
> applications running, besides kernel compiling)?

If you don't mind that the CPU heats up during kernel compiles, the
speedstep-ich driver is better for your usage.

> I found for now that having p4-clockmod saves more energy/produces less
> heat since most of the time the laptop is running in 275MHz (with
> cpudynd), while with speedstep-ich it is running at 1200MHz.

But as the agressive idling done by ACPI or APM saves as much energy as
throttling, this shouldn't be a valid assumption.

> Finally: If p4-clockmod only scales down cpu freq, and speedstep-ich
> scaled down cpu freq *AND* voltage, are there any statistics or other
> ways to compare battery life/heat production between the two,
> assuming that for the former the minimal cpu freq is 274MHz and for the
> later 1200MHz. 

Unfortunately, I don't have the information for your CPU. But, as a good
example, let's take the 1.0 GHz Pentium-III-M. 

100% CPU-usage, 1.0 GHz, Speedstep-High, no throttling:		34.0 W
	and let's say the CPU consuming task takes 1 minute to complete.
	==> for the task you'll need 2.0 kWs [=kJ?] of energy.

100% CPU-usage,	700 MHz, Speedstep-Low, no throttling:		16.1 W
	--> the CPU consuming task will take 1.43 minutes to complete.
	==> for the task you'll need 1.4 kWs of energy.

100% CPU usage, 125 MHz, throttling to 12.5%: [*]		 6.2 W
	--> the CPU consuming task will take 8 minutes to complete.
	==> for the task you'll need 3.0 kWs of energy.


0% CPU usage, 1.0 GHz, SpeedStep-High, throttling doesn't matter: 2.2 W

0% CPU usage, 700 MHz, SpeedStep-Low, throttling doesn't matter:  1.2 W


and now let's assume the "needed" CPU capacity is 100 MHz for one second:

10% CPU usage, 1.0 GHz [SpeedStep-High, no throttling, no dynamic switching]:
	34.0 * 1/10 + 2.2 * 9/10				= 5.38 Ws

14% CPU usage, 700 MHz [SpeedStep-Low, no throttling, no dynamic switching]:
	16.1 * 1/7 + 1.2 * 6/7					= 3.33 Ws

80% CPU usage, 125 MHz [throttling to 12.5%]
	2.2 + ([34.0 - 2.2] * 1/8 * 8/10)			= 5.38 Ws
	==> you don't save anything at all.

10% CPU usage at 1.0GHz for 100ms, then the CPU is dynamically switched to 
the SpeedStep-Low state. No throttling:
	34.0 * 1/10 + 1.2 * 9/10				= 4.48 Ws
	==> this doesn't buy you much, either. This result surprised me too,
	by the way.

[*] 2.2 + ([34.0 - 2.2] * 1/8)


> Concise: Does the speedstep-ich voltage reduction decrease the amount of
> energy used by a factor 4 (~ 1200/274) so that it is comparable to
> p4-clockmod?

Wrong question: Mostly you do care about "energy needed for certain amount
of work". There throttling doesn't save you anything if idling works, but
"speedstepping" does.

The only two reasons for CPUfreq drivers which "only" do throttling are:

a) The idling mechansim is broken.

b) Reduce the heat. If the CPU only takes 6.2 W instead of 34.0 W, this is
much. This is a good approach to avoid a burning feeling on your lap when 
your notebook is compiling, and you don't need the compiled program ASAP.
But: you won't save any _energy_/battery power [see above].


Best wishes to the wonderful city of Vienna,

	Dominik
