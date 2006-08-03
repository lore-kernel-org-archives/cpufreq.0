From: "Hiroshi Miura" <miura@da-cha.org>
Subject: Re: Why supports the speedstep-ich only 2 processor states
Date: Fri, 4 Aug 2006 00:16:31 +0900
Message-ID: <a11ccc30608030816s22bbd417pe93a00703d1f18df@mail.gmail.com>
References: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
	<a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
	<1154617007.23310.3.camel@skylla.slagter.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154617007.23310.3.camel@skylla.slagter.name>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

Hi,

Tomas said 'as if i run at 733 MHz.' and it seems  that
state of speedstep is 733MHz(LOW) and some mechanism like throttling
are working but is not affect any power saving.

I think throttling looks like processor halt state.
CPU just not working some duration till timer intrupt coming or
 predefined ratio.
If cpu load is low, I think throttling may have no difference, because
cpu is halted or throttled in many of cpu time.

2006/8/3, Erik Slagter <erik@slagter.name>:
> On do, 2006-08-03 at 23:47 +0900, Hiroshi Miura wrote:
> > The latter is configurable by setting  /proc/acpi/processor/CPU0/throttling
> >
> > For example, if your acpi bios support 4 throttling state and set LOW
> > with  speedstep, then freq = 733 x 25% => 184Mhz.
> >
> > I don't know how BIOS set chips to run such a state but it may help
> > you to understand what is happened.
>
> Hmmm, I don't think that will buy you much. At least in my system
> throttling doesn't give _any_ power saving.
>

-- 
HIroshi Miura
