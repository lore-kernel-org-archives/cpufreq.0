From: Pavel Machek <pavel@ucw.cz>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Mon, 15 Mar 2004 13:44:06 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315124406.GB29260@atrey.karlin.mff.cuni.cz>
References: <20040216213435.GA9680@dominikbrodowski.de>
	<20040225174326.GD1214@elf.ucw.cz>
	<20040216213435.GA9680@dominikbrodowski.de>
	<40313AA9.1060906@arenanetwork.com.br>
	<20040217090939.GA9935@dominikbrodowski.de>
	<403D4BD3.7050703@arenanetwork.com.br>
	<20040314144402.GA22268@dominikbrodowski.de>
	<20040314212303.GA1010@elf.ucw.cz>
	<20040315092639.GD14911@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040315092639.GD14911@dominikbrodowski.de>
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
To: dual_bereta_r0x <dual_bereta_r0x@arenanetwork.com.br>, cpufreq@www.linux.org.uk

> On Sun, Mar 14, 2004 at 10:23:04PM +0100, Pavel Machek wrote:
> > Hi!
> > 
> > > > Hey, that's ugly. Values should be real.
> > > 
> > > Indeed. But if they're not known (and cpu_khz _is_ unreliable), what should
> > > be done?
> > 
> > Is it possible to measure cpu_khz with arbitrary precision if we make
> > measurement slower? I think so; if cpu_khz is too unreliable, perhaps
> > we can make measurement slower but more precise?
> 
> cpu_khz may be zero if the PIT is used as primary time source.

But that's a bug to be fixed, right?
								Pavel
-- 
Horseback riding is like software...
...vgf orggre jura vgf serr.
