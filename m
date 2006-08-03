From: "kay@rz.fh-augsburg.de" <kay@rz.fh-augsburg.de>
Subject: Re: Why supports the speedstep-ich only 2 processor states
Date: Thu, 03 Aug 2006 20:38:38 +0100
Message-ID: <1154633918.9169.15.camel@sunwork>
References: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
	<a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
	<1154617007.23310.3.camel@skylla.slagter.name>
	<a11ccc30608030816s22bbd417pe93a00703d1f18df@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <a11ccc30608030816s22bbd417pe93a00703d1f18df@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Hiroshi Miura <miura@da-cha.org>, cpufreq@lists.linux.org.uk

Hi,

first, thanks for your answers.

Ok, I tried the throttling. And it's available two for the 191 MHz Mode.
And you are both right, there is no power saving if idle with the
throttling at both Modes.
Power Saving is about 200 mW at 191 MHz compared to 733 MHz. I know it's
not much, but I am not willing to accept that it's not possible :-).
Because it definitly is.

So I will try to adapt the code by hand for the 191 MHz state... and I
hope this will not damage anything.

Strange behavior i noticed:
- without cpufreq support in the kernel the processor has 191 MHz with
the fixed slow option in the BIOS. With cpufreq support, but without any
cpufreq modules loaded, it has 205 MHz reported by /proc/cpuinfo

- both the 205 and the 191 MHz mode are reported with 359 bogomips

- after booting up with cpufreq-support, but without loading the modules
(and reported 205 MHz) I loaded the modules by hand. Now /proc/cpuinfo
reports 1130 MHz at 556 bogomips

- without cpufreq-support and 1130 MHz /proc/cpuinfo reports 2240
bogomips, with cpufreq-support and loading the modules at startup, it
reports 3400 bogomips

Ok this got a little messy but I hope you understand what I wrote.

Greetz

Thomas
-------------------------------------------------------------------------------

On Fri, 2006-08-04 at 00:16 +0900, Hiroshi Miura wrote:
> Hi,
> 
> Tomas said 'as if i run at 733 MHz.' and it seems  that
> state of speedstep is 733MHz(LOW) and some mechanism like throttling
> are working but is not affect any power saving.
> 
> I think throttling looks like processor halt state.
> CPU just not working some duration till timer intrupt coming or
>  predefined ratio.
> If cpu load is low, I think throttling may have no difference, because
> cpu is halted or throttled in many of cpu time.
> 
> 2006/8/3, Erik Slagter <erik@slagter.name>:
> > On do, 2006-08-03 at 23:47 +0900, Hiroshi Miura wrote:
> > > The latter is configurable by setting  /proc/acpi/processor/CPU0/throttling
> > >
> > > For example, if your acpi bios support 4 throttling state and set LOW
> > > with  speedstep, then freq = 733 x 25% => 184Mhz.
> > >
> > > I don't know how BIOS set chips to run such a state but it may help
> > > you to understand what is happened.
> >
> > Hmmm, I don't think that will buy you much. At least in my system
> > throttling doesn't give _any_ power saving.
> >
> 
