From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq and p4 prescott
Date: Sat, 15 May 2004 21:41:25 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040515194124.GA8212@dominikbrodowski.de>
References: <20040513173946.GA8238@dominikbrodowski.de>
	<20040514214751.GA8433@nospam.com>
	<20040515064434.GB8572@dominikbrodowski.de>
	<20040515105200.GA8095@nospam.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040515105200.GA8095@nospam.com>
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
To: linux-kernel@tux.tmfweb.nl
Cc: moqua@kurtenba.ch, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Sat, May 15, 2004 at 12:52:01PM +0200, rutger@nospam.com wrote:
> > > Ah, ok! This makes the measurement next to impossible. Unless we
> > > generate instructions of ~900 ticks, which should takes 900 + 5600
> > > ticks in case of modulated clock, and 900 ticks in case of
> > > non-modulated clock. Something to try...
> > 
> > As I said, I forgot the actual frequency, so 800 ticks is a guess...
> 
> The only thing I could find in Intel's documentation is the max. time
> of throttling is 3 microseconds (p.67; 5.2.1 of Prescott
> datasheet). So this 3 microseconds should correspond to 5600 ticks or
> so...

Can't find it in the datasheets right now, but did find an interesting
comment in section 13.15.3 of 24547212.pdf which explains the strange
behaviour we're seeing.

> ..so it has only effect on the same sibbling, not the other. That's
> what I meant with 'repeat scaling for each virtual processor'.

This is so strange... but it is what's to be found in said section in the
datasheet. It says both logical CPUs need to be set identically so that it
works "properly", i.e. as expected.

> That's true. I can set the freq. of each virtual CPU. Probably not
> very useful, and even confusing. And if we keep this,

I think we should not keep it; I'll prepare a patch soon.

> the scheduler
> should be told about the speed differences of both (virtual)
> processors.

On (real) SMP systems this is an issue; but even more on SMP systems where 
true frequency and voltage scaling is done. 

> > > However, what's the use of p4-clockmod if it doesn't have impact on
> > > the temperature and the power consumption of the CPU?
> > 
> > The use of the p4-clockmod driver is that it puts the CPU into a low-power
> > state -- it only has thermal and power consequences, however, if either the
> > "idling" does not work, or the processor load is higher than the frequency
> > the CPU is put into by p4-clockmod.
> 
> I saw several sleep states in which the processor can reside (like
> when using the 'hlt' instruction) like S3; would those help?

If you mean C3, then that's very good. ACPI C-States are "idling" -- ACPI
S-States (like S3) are for "suspend to ram/disk"

> I know this is not P4 specific, but motherboard specific, but do
> you know of modules which use motherboard specific knowledge to scale
> the processor?
No.
> If the BIOS can do it, so should we be able to do it.

Dynamic frequency scaling is (probably) way different from setting a
frequency at boot (which is what the BIOS does). Timing issues, settling
times, etc. are way too complicated, AFAICS. Even trying to do this might
result in severe non-recoverable hardware failures.

	Dominik
