From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 16:20:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209152052.GA13262@poupinou.org>
References: <20040209132659.GY13262@poupinou.org>
	<20040209150519.GA6531@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040209150519.GA6531@dominikbrodowski.de>
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
To: davej@redhat.com, cpufreq@www.linux.org.uk
Cc: Dominik Brodowski <linux@dominikbrodowski.de>

On Mon, Feb 09, 2004 at 04:05:19PM +0100, Dominik Brodowski wrote:
> > 1- Include the powernow_acpi_init() as the first call in
> > powernow_decode_bios(), so that ACPI is used first, then if it failed,
> > the legacy method is used,
> > or
> > 2- Include the powernow_acpi_init() at powernow_decode_bios() just
> > before the 3 printk's stating to write that you should see
> > http://www.codemonkey.org.uk/projects/cpufreq/...
> > 
> > I guess 2- is 'better', but I would like to get some thought, though.
> 
> Hm. That's difficult to decide, also for the speedstep-centrino case... I'd
> like to hear some opinions from ACPI and AMD guys first before we decide...

Well, ACPI guys would say you to use ACPI for, but I prefer the legacy
method because otherwise I loose 3 power states ;)

> 
> > +	printk("1\n");

Sound like I forgot to remove that, sorry..

> > +	if (acpi_processor_register_performance(&p, 0))
> > +		return -EIO;
> > +	printk("2\n");
> > +
> > +	r = &p.control_register;
> > +	if (r->space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
> 
> How about
> 	if (p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {

because I use p.control_register at least 2 times, and when that happens
I prefer to introduce another variable, because it's more easier to read IMHO.

> 
> > +		retval = -ENODEV;
> > +		goto out;
> > +	}
> > +	r = &p.status_register;
> > +	if (r->space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
> 
> same here...

and that the second one ;)

> 
> > +	fsb = 100;	/* XXX fix me */
> 
> Any idea on how to determine the FSB?

Unfortunately no.  I don't have all the AMD processor specification for
this.

> 
> > +	latency = 10000;	/* XXX don't trust bios writers.. */
> 
> heh...

OK, I'm perhaps a little bit rude here.  I will rewrite that.

> 
> > +	/*
> > +	 * We don't need no more acpi.
> > +	 * XXX is that true?
> > +	 */
> 
> No, it's not true. If we use ACPI, we need to keep it registered until we
> stop using it. Reasons:
> - keep buggy drivers from interfering [e.g. other cpufreq drivers which 
>   register with ACPI first and with cpufreq later, or avoid registering with
>   cpufreq because of being proprietary...]
> - honor _PPC limits
> - allow for ACPI interface (additions):
>   This includes the /proc/acpi/processor/./performance interface which
>   people still tend to use, and additions to 
>   /sys/devices/system/cpu/cpu0/cpufreq/ still to be written.
> 

Ok (actually, I don't think _PPC is supported on most K7 mobo, since it
return 0 in almost all DSDT, but well, I should consider though in order
to be fully ACPI compliant).

Thanks,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
