From: Ian Campbell <icampbell@arcom.com>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Mon, 18 Jul 2005 13:11:23 +0100
Message-ID: <1121688683.4215.39.camel@icampbell-debian>
References: <1121341256.10537.12.camel@icampbell-debian>
	<20050715164115.GA3240@isilmar.linta.de>
	<1121684526.4215.25.camel@icampbell-debian>
	<20050718120112.GA4270@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050718120112.GA4270@isilmar.linta.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

On Mon, 2005-07-18 at 14:01 +0200, Dominik Brodowski wrote:
> > This also creates /sys/module/cpu_pxa/parameters/performance which can
> > be written to and takes effect on the next frequency change. Is this
> > acceptable or should I look for a way to add a sysfs file
> > to /sys/devices/system/cpu/cpu0/cpufreq? The advantage would be
> > immediate application of the change (I think...)
> 
> Tough question. As sysfs supports links... could you try adding a link from
> /sys/devices/system/cpu/cpu0/performance_mode to
> /sys/module/cpu_pxa/parameters/performance ?

I can certainly try, although I suspect you'll see me on linux-kernel in
about an hour soliciting help from the sysfs guys ;-)

> > > >  choice
> > > >  	prompt "Default CPUFreq governor"
> > > > -	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
> > > > +	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110 || CPU_FREQ_PXA
> > > 
> > > Why is that?
> > 
> > I've no idea -- I just copied the StrongARM stuff. My guess is that
> > someone decided that PERFORMANCE wasn't suitable as the default for an
> > "embedded" platform. I think I'll probably just drop this chunk since
> > you can always choose via config anyway. I've pinged the ARM list just
> > in case there is a more pressing reason.
> 
> I added it to maintain backwards compatibility. AFAICS, there is no real
> reason to copy this behaviour to new drivers.

K, I'll drop that bit then. Thanks.

Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been virus scanned by MessageLabs.
