From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: my dothan didn't work with cpufreq...
Date: Thu, 22 Jul 2004 10:34:25 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1090517665.5267.9.camel@ixodes.goop.org>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
	<20040722060437.GA8888@dominikbrodowski.de>
	<1090479407.4351.6.camel@localhost>
	<20040722093126.GA8418@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040722093126.GA8418@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Thu, 2004-07-22 at 11:31 +0200, Dominik Brodowski wrote:
> > The hacky way to work it out would be to read
> > back the MSR and see what freq/voltage pair you have (which would only
> > work at max speed).
> ... but as many systems boot at a lower speed on battery power, I wouldn't
> want to do this.

Oh, no, I wasn't even considering suggesting it.  It's too nasty.

> However, as "enhanced SpeedStep" is going to be introduced on
> desktop CPUs, the problem will increase: the MSR will likely have a
> different encoding. See Venkatesh's patches for details. Also, I fear that
> as more CPUs support enhanced SpeedStep, the larger
> speedstep-centrino.{o,ko} will become.

The tables are not very big, and I was thinking about generating the
model names from a template rather than explicitly enumerating them all
as we do now.

But you're right, it looks like the simple table approach will be hard
or impossible to maintain.

> > +static const struct cpu_id cpu_ids[] = {
> > +	[CPU_BANIAS]	= { X86_VENDOR_INTEL,	6,  9, 5 },
> > +	[CPU_DOTHAN_A1]	= { X86_VENDOR_INTEL,	6, 13, 1 },
> > +	[CPU_DOTHAN_B0]	= { X86_VENDOR_INTEL,	6, 13, 6 },
> 
> Hm, I'm unsure whether this is proper CodingStyle... IIRC, much effort was
> spent in converting such { }s to include the respective "fields", like
> 	{ .x86_vendor = X86_VENDOR_INTEL, x86_family = 6 ... 
> and so on.

For a tiny little structure like this, which is defined immediately
above, this is fine. (CodingStyle makes no mention of structure
initialization.)

	J
