From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: my dothan didn't work with cpufreq...
Date: Thu, 22 Jul 2004 11:31:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040722093126.GA8418@dominikbrodowski.de>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
	<20040722060437.GA8888@dominikbrodowski.de>
	<1090479407.4351.6.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1090479407.4351.6.camel@localhost>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

> Yeah, I worked that out from a closer reading of the docs.  There really
> doesn't seem to be any non-hacky way to work out which CPU you have, and
> they seem to have non-overlapping specs (ie, you can't run a VID#D part
> with VID#A voltages).  The hacky way to work it out would be to read
> back the MSR and see what freq/voltage pair you have (which would only
> work at max speed).
... but as many systems boot at a lower speed on battery power, I wouldn't
want to do this.

> Seems like a reasonable idea, though it would be nice for Dothan users
> to not have an ACPI dependency. 

However, as "enhanced SpeedStep" is going to be introduced on
desktop CPUs, the problem will increase: the MSR will likely have a
different encoding. See Venkatesh's patches for details. Also, I fear that
as more CPUs support enhanced SpeedStep, the larger
speedstep-centrino.{o,ko} will become.

> +static const struct cpu_id cpu_ids[] = {
> +	[CPU_BANIAS]	= { X86_VENDOR_INTEL,	6,  9, 5 },
> +	[CPU_DOTHAN_A1]	= { X86_VENDOR_INTEL,	6, 13, 1 },
> +	[CPU_DOTHAN_B0]	= { X86_VENDOR_INTEL,	6, 13, 6 },

Hm, I'm unsure whether this is proper CodingStyle... IIRC, much effort was
spent in converting such { }s to include the respective "fields", like
	{ .x86_vendor = X86_VENDOR_INTEL, x86_family = 6 ... 
and so on.

	Dominik
