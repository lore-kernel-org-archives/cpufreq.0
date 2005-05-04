From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] dual-core powernow-k8
Date: Wed, 4 May 2005 18:55:59 +0200
Message-ID: <20050504165559.GA1286@isilmar.linta.de>
References: <84EA05E2CA77634C82730353CBE3A84301CFBFD0@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFBFD0@SAUSEXMB1.amd.com>
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
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>, davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

On Wed, May 04, 2005 at 11:53:48AM -0500, Langsdorf, Mark wrote:
> > On Mon, May 02, 2005 at 02:23:41PM -0500, Langsdorf, Mark wrote:
> > > Update the driver to version 1.40.0 and provide support
> > > for dual-core processors.
> > 
> > Looks good to me, though it'd be great if you could provide 
> > step-by-step patches in future (e.g. split up printk 
> > cleanups, adding feature and so on...). One small bit, though:
> 
> Will do.
>  
> > +cpumask_t cpu_sharedcore_mask[NR_CPUS];
> > 
> > can be static, AFAICS.
> 
> I'll add it to my copy.  Do you want me to resubmit?

That's Dave's call...

Thanks,
	Dominik
