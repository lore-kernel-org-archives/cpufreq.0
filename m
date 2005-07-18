From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Mon, 18 Jul 2005 14:01:12 +0200
Message-ID: <20050718120112.GA4270@isilmar.linta.de>
References: <1121341256.10537.12.camel@icampbell-debian>
	<20050715164115.GA3240@isilmar.linta.de>
	<1121684526.4215.25.camel@icampbell-debian>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1121684526.4215.25.camel@icampbell-debian>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Campbell <icampbell@arcom.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Mon, Jul 18, 2005 at 12:02:06PM +0100, Ian Campbell wrote:
> On Fri, 2005-07-15 at 18:41 +0200, Dominik Brodowski wrote:
> > > +static void pxa_select_freq_table(struct cpufreq_policy *policy,
> > > +                               pxa_freqs_t ** settings,
> > > +                               struct cpufreq_frequency_table
> > **table)
> > > +{
> > [SNIP]
> > > +}
> > 
> > As noted by Eric Piel already, please use a module parameter combined
> > with a sysfs file instead.
> > 
> I've got it working with a module parameter so cpu_pxa.performance=1
> allows selection of the performance table at boot time. 
> 
> This also creates /sys/module/cpu_pxa/parameters/performance which can
> be written to and takes effect on the next frequency change. Is this
> acceptable or should I look for a way to add a sysfs file
> to /sys/devices/system/cpu/cpu0/cpufreq? The advantage would be
> immediate application of the change (I think...)

Tough question. As sysfs supports links... could you try adding a link from
/sys/devices/system/cpu/cpu0/performance_mode to
/sys/module/cpu_pxa/parameters/performance ?

> > >  choice
> > >  	prompt "Default CPUFreq governor"
> > > -	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
> > > +	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110 || CPU_FREQ_PXA
> > 
> > Why is that?
> 
> I've no idea -- I just copied the StrongARM stuff. My guess is that
> someone decided that PERFORMANCE wasn't suitable as the default for an
> "embedded" platform. I think I'll probably just drop this chunk since
> you can always choose via config anyway. I've pinged the ARM list just
> in case there is a more pressing reason.

I added it to maintain backwards compatibility. AFAICS, there is no real
reason to copy this behaviour to new drivers.

Thanks,
	Dominik
