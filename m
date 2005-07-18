From: Ian Campbell <icampbell@arcom.com>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Mon, 18 Jul 2005 12:02:06 +0100
Message-ID: <1121684526.4215.25.camel@icampbell-debian>
References: <1121341256.10537.12.camel@icampbell-debian>
	<20050715164115.GA3240@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050715164115.GA3240@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

On Fri, 2005-07-15 at 18:41 +0200, Dominik Brodowski wrote:

Thanks for you comments. 

I've snipped the bits for changes that I've already done.

> > +static void pxa_select_freq_table(struct cpufreq_policy *policy,
> > +                               pxa_freqs_t ** settings,
> > +                               struct cpufreq_frequency_table
> **table)
> > +{
> [SNIP]
> > +}
> 
> As noted by Eric Piel already, please use a module parameter combined
> with a sysfs file instead.
> 
I've got it working with a module parameter so cpu_pxa.performance=1
allows selection of the performance table at boot time. 

This also creates /sys/module/cpu_pxa/parameters/performance which can
be written to and takes effect on the next frequency change. Is this
acceptable or should I look for a way to add a sysfs file
to /sys/devices/system/cpu/cpu0/cpufreq? The advantage would be
immediate application of the change (I think...)

> > +	cpumask_t cpus_allowed;
> 
> Is this a SMP-capable platform?

I don't really know to be honest -- there are SMP ARM's in the world but
I don't know if that will ever extend to the PXA. I doubt it, but I've
asked on the ARM kernel list.

> Is the PXA just a sub-architecture of ARM?

That's right, it's one of Intel's ARM implementations, it takes over
from their StrongARM stuff. The PXA line is quite commonly found in
PDAs.

> >  choice
> >  	prompt "Default CPUFreq governor"
> > -	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
> > +	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110 || CPU_FREQ_PXA
> 
> Why is that?

I've no idea -- I just copied the StrongARM stuff. My guess is that
someone decided that PERFORMANCE wasn't suitable as the default for an
"embedded" platform. I think I'll probably just drop this chunk since
you can always choose via config anyway. I've pinged the ARM list just
in case there is a more pressing reason.

Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been virus scanned by MessageLabs.
