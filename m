From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: writing a cpufreq driver
Date: Fri, 22 Sep 2006 18:05:14 +0200
Message-ID: <20060922160514.GQ4945@poupinou.org>
References: <20060921184833.GC1216@dbz.icequake.net>
	<20060922153948.GN4945@poupinou.org>
	<20060922160025.GA4459@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060922160025.GA4459@dbz.icequake.net>
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
To: Ryan Underwood <nemesis@icequake.net>
Cc: Cpufreq@lists.linux.org.uk

On Fri, Sep 22, 2006 at 11:00:25AM -0500, Ryan Underwood wrote:
> 
> On Fri, Sep 22, 2006 at 05:39:49PM +0200, Bruno Ducrot wrote:
> > That may indicate TSC frequency is constant.  Try to add a
> > .flags = CPUFREQ_CONST_LOOPS
> > onto the driver like this:
> > 
> > > static struct cpufreq_driver toshiba_freq_driver = {
> > > 	.get	= toshiba_freq_get_cpu_frequency,
> > > 	.verify	= toshiba_freq_verify,
> > > 	.target	= toshiba_freq_target,
> > > 	.init	= toshiba_freq_cpu_init,
> > > 	.exit	= toshiba_freq_cpu_exit,
> > > 	.name	= "toshiba_freq",
> > > 	.owner	= THIS_MODULE,
> > > 	.attr	= toshiba_freq_attr,
> >         .flags	= CPUFREQ_CONST_LOOPS,
> > 	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 	HERE
> > > };
> 
> That worked.  Looks like the CPU MHZ isn't changing really (on this
> machine at least).
> 

I'm now sure the southbridge is throttling the processor...

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
