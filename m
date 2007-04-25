From: olof@lixom.net (Olof Johansson)
Subject: Re: [PATCH] [2.6.22] pasemi: cpufreq driver
Date: Wed, 25 Apr 2007 18:57:57 -0500
Message-ID: <20070425235757.GA20905@lixom.net>
References: <20070425204633.GC19781@lixom.net>
	<200704260147.35878.arnd@arndb.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200704260147.35878.arnd@arndb.de>
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
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, paulus@samba.org, cpufreq@lists.linux.org.uk

On Thu, Apr 26, 2007 at 01:47:35AM +0200, Arnd Bergmann wrote:
> On Wednesday 25 April 2007, Olof Johansson wrote:
> 
> > +/* This should eventually come out of the device tree */
> > +#define SDCPWR_BASE		0xfc104000
> > +#define SDCPWR_SIZE		0x1000
> > +
> > +#define SDCASR_BASE		0xfc120000
> > +#define SDCASR_SIZE		0x2000
> 
> the comment is right. Why don't you do it then? ;-)

Leftovers from when it was a regular platform driver.

> > +static int pas_cpufreq_cpu_init (struct cpufreq_policy *policy)
> > +{
> > +	u32 *max_freq;
> > +	int i, cur_astate;
> > +	struct device_node *cpu;
> > +
> > +	cpu = of_get_cpu_node(policy->cpu, NULL);
> > +
> > +	if(!cpu)
> > +		return -ENODEV;
> > +
> > +	sdcpwr_mapbase = ioremap(SDCPWR_BASE, SDCPWR_SIZE);
> > +	sdcasr_mapbase = ioremap(SDCASR_BASE, SDCASR_SIZE);
> > +	if (!sdcpwr_mapbase || !sdcasr_mapbase)
> > +		panic("SDCMAP: Cannot map registers!");
> 
> I can't see any check in here that finds out if you are actually running on
> the right hardware. 
> The proper way to implement this driver would be to register an
> of_platform_driver for the cpufreq device and then get the register
> addresses from there,

Yup.

> > @@ -155,7 +155,7 @@ source "drivers/cpufreq/Kconfig"
> >  
> >  config CPU_FREQ_PMAC
> >  	bool "Support for Apple PowerBooks"
> > -	depends on CPU_FREQ && ADB_PMU && PPC32
> > +	depends on ADB_PMU && PPC32
> >  	select CPU_FREQ_TABLE
> >  	help
> >  	  This adds support for frequency switching on Apple PowerBooks,
> > @@ -164,11 +164,21 @@ config CPU_FREQ_PMAC
> >  
> >  config CPU_FREQ_PMAC64
> >  	bool "Support for some Apple G5s"
> > -	depends on CPU_FREQ && PPC64
> > +	depends on PPC64
> >  	select CPU_FREQ_TABLE
> >  	help
> >  	  This adds support for frequency switching on Apple iMac G5,
> >  	  and some of the more recent desktop G5 machines as well.
> 
> Why this change?

They're redundant, but they should have been in a separate patch. I
forgot to revert them before rediffing.

> > +config PPC_PASEMI_CPUFREQ
> > +	bool "Support for PA Semi PWRficient"
> > +	depends on PPC_PASEMI
> > +	default y
> > +	select CPU_FREQ_TABLE
> > +	help
> > +	  This adds the support for frequency switching on PA Semi
> > +	  PWRficient processors.
> > +
> >  endmenu
> 
> Why bool and not tristate?

1) The other cpufreq drivers are bool
2) See the idle loop interaction: It can go tristate once we have runtime
selection of idle loop, but until then we need it for idle=doze.


-Olof
