From: Dominik Brodowski <linux@brodo.de>
Subject: Re: ACPI P-State platform limit [Was: Re: Cpufreq for opteron]
Date: Fri, 5 Sep 2003 00:29:04 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030904222904.GA6488@brodo.de>
References: <99F2150714F93F448942F9A9F112634C080EF034@txexmtae.amd.com>
	<20030827053300.GB4037@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030827053300.GB4037@brodo.de>
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
To: paul.devriendt@AMD.com
Cc: pavel@suse.cz, richard.brunner@AMD.com, aj@suse.de, cpufreq@www.linux.org.uk, davej@redhat.com, mark.langsdorf@AMD.com

On Wed, Aug 27, 2003 at 07:33:00AM +0200, Dominik Brodowski wrote:
> [removed CC:linux-kernel]
> 
> > > I dislike this interaction between ACPI and cpufreq -- it 
> > > should be done
> > > more generally. Let's discuss that seperately, though. And if 
> > > the code is
> > > dead code at the moment.
> > 
> > The dead code has been removed in 1.00.07 of the driver. I am
> > happy to receive suggestions as to better ways of detecting battery
> > versus mains power transitions.
> 
> Currently, the ACPI P-States cpufreq driver does implement the "platform
> limit". However, I'm not really excited about how it works -- and especially
> that it only works with the ACPI P-States cpufreq driver and not with all
> drivers.
> 
> The platform limit [ _PPC ] refers to the states defined in _PSS. This means
> that this knowledge can and should be used independent of the cpufreq driver:
> if the _PPC is, let's say, 2, and accoring to _PSS P2 is 1.2 GHz, a
> "platform limit CPUFREQ_POLICY_NOTIFIER". If the _PPC changes, a
> new cpufreq_reevaluate() function should be called:

I named it cpufreq_update_policy() instead, and you can check the
implementation for it and for the _PPC in:

http://www.brodo.de/cpufreq_tmp/cpufreq-2.6.0-test4-update_policy
and                                                                                
http://www.brodo.de/cpufreq_tmp/acpi-2.6.0-test4-processor_perflib


	Dominik
