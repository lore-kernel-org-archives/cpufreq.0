From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Thu, 10 Jun 2004 18:44:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610164434.GA14158@dominikbrodowski.de>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<40C7AF6C.1080408@cern.ch> <20040610153711.GZ13782@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040610153711.GZ13782@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: holbling@cpt.univ-mrs.fr, cpufreq@www.linux.org.uk

On Thu, Jun 10, 2004 at 05:37:11PM +0200, Bruno Ducrot wrote:
> Dominik, your though, please?

I'd agree with this change.

> What about 
> 	for_each_cpu_mask(i, affected_cpu_map) {
> 		...
> 	}
> instead?

That's indeed shorter -- don't know why whoever converted p4-clockmod to the
new sibling mask did use for_each_cpu_mask...

> > @@ -297,6 +337,9 @@
> >  	if (!speed)
> >  		return -EIO;
> >  
> > +	/* allow to run on any CPU */
> > +	set_cpus_allowed(current, cpus_allowed);
> > +
> 
> Something wrong.  I mean, there is a return but the set_cpu_allowed()
> is done after...

Thanks for catching this -- it definitely needs to be fixed.

	Dominik
