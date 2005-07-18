From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Mon, 18 Jul 2005 17:03:07 +0200
Message-ID: <20050718150307.GA8202@isilmar.linta.de>
References: <1121341256.10537.12.camel@icampbell-debian>
	<20050715164115.GA3240@isilmar.linta.de>
	<1121684526.4215.25.camel@icampbell-debian>
	<20050718120112.GA4270@isilmar.linta.de>
	<1121688683.4215.39.camel@icampbell-debian>
	<1121697094.3519.27.camel@icampbell-debian>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1121697094.3519.27.camel@icampbell-debian>
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

On Mon, Jul 18, 2005 at 03:31:34PM +0100, Ian Campbell wrote:
> On Mon, 2005-07-18 at 13:11 +0100, Ian Campbell wrote:
> > On Mon, 2005-07-18 at 14:01 +0200, Dominik Brodowski wrote:
> > > > This also creates /sys/module/cpu_pxa/parameters/performance which can
> > > > be written to and takes effect on the next frequency change. Is this
> > > > acceptable or should I look for a way to add a sysfs file
> > > > to /sys/devices/system/cpu/cpu0/cpufreq? The advantage would be
> > > > immediate application of the change (I think...)
> > > 
> > > Tough question. As sysfs supports links... could you try adding a link from
> > > /sys/devices/system/cpu/cpu0/performance_mode to
> > > /sys/module/cpu_pxa/parameters/performance ?
> > 
> > I can certainly try, although I suspect you'll see me on linux-kernel in
> > about an hour soliciting help from the sysfs guys ;-)
> 
> As near as I can tell this isn't going to be possible because when the
> module is built in there is no kobject that I can get my hands on to use
> as the target, since mkobj is faked out in
> kernel/params.c:kernel_param_sysfs_setup() and THIS_MODULE is NULL
> anyway.
> 
> So I've decided just add a freq_attr for the value, keeping the module
> param (but mode == 0) to set the initial value.
> 
> I want to make it transition to the new set of frequencies immediately
> instead of waiting for the next frequency change. I have:
> 
>         static ssize_t store_pxa_mode_attr(struct cpufreq_policy * policy, const char *buf, size_t count)
>         {
>         	unsigned int ret = -EINVAL;
>         	char str[16];
>         
>         	ret = sscanf (buf, "%15s", str);
>         	if (ret != 1)
>         		return -EINVAL;
>         
>         	if (strnicmp(str,"performance",16)==0)
>         		performance = 1;
>         	else
>         		performance = 0;
>         	
>         	ret = cpufreq_governor(policy->cpu, CPUFREQ_GOV_START);
>         
>         	return ret ? ret : count;
>         }
> 
> I'm not sure about the call to cpufreq_governor to "restart" the current
> governor (and hence apply the new timings), it looks ok from the current
> code, and appears to work, but I don't want to rely on undefined
> behaviour. Is it OK?
No. Just call 
		cpufreq_update_policy(policy->cpu);
instead.

Thanks,
	Dominik
