From: paul.devriendt@AMD.com
Subject: RE: Cpufreq for opteron
Date: Tue, 26 Aug 2003 19:43:37 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C080EF034@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: linux@brodo.de, pavel@suse.cz
Cc: richard.brunner@AMD.com, aj@suse.de, cpufreq@www.linux.org.uk, davej@redhat.com, mark.langsdorf@AMD.com, linux-kernel@vger.kernel.org

> > +#define VERSION "version 1.00.06 - August 13, 2003"
> 
> If AMD wants it in, let's put it into the /* comment header 
> at the top */ ?

It gets written to the log file with printk ... if someone needs
to send me a log file of an error, I find it helpful to know what
version of the driver it came from.

> > +static int onbattery = 1;	/* Set if running on battery, 
> reset otherwise. */
> > +			   /* Of no relevance unless 
> batterypstates <     */
> > +			   /* numpstates, as defined in the 
> PSB/PST.      */
> 
> I dislike this interaction between ACPI and cpufreq -- it 
> should be done
> more generally. Let's discuss that seperately, though. And if 
> the code is
> dead code at the moment.

The dead code has been removed in 1.00.07 of the driver. I am
happy to receive suggestions as to better ways of detecting battery
versus mains power transitions.

> > +static int
> > +drv_verify(struct cpufreq_policy *pol)
> > +{
> <snip>
> > +	dprintk(KERN_DEBUG PFX
> > +		"ver: cpu%d, min %d, max %d, cur %d, pol %d 
> (%s)\n", pol->cpu,
> > +		pol->min, pol->max, pol->cur, pol->policy,
> > +		pol->policy ==
> > +		CPUFREQ_POLICY_POWERSAVE ? "psave" : pol->policy ==
> > +		CPUFREQ_POLICY_PERFORMANCE ? "perf" : "unk");
> > +
> > +	if (pol->cpu != 0) {
> > +		printk(KERN_ERR PFX "verify - cpu not 0\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	res = find_match(&targ, &min, &max,
> > +			 pol->policy ==
> > +			 CPUFREQ_POLICY_POWERSAVE ? SEARCH_DOWN 
> : SEARCH_UP, 0,
> > +			 0);
> 
> Why do you check for CPUFREQ_POLICY here??? In a ->target 
> class cpufreq
> driver[*] you must not worry about the policy, only about min and max
> frequency.
> 
> [*] ->target class cpufreq drivers [cpufreq_driver->target is 
> used] have
> specific operating frequencies.
>     ->setpolicy class cpufreq drivers have operating frequency ranges
> [currently only available on Transmeta Crusoe processors]

If the driver has to expand the range to find a matching frequency, it
has to know whether to expand up or down. That comes from policy.

> Also, it'd be great if this driver were converted to use the CPUfreq
> freuqency table helpers -- check drivers/cpufreq/freq_table.c in
> linux-2.6.0-test4. Using it makes the code much cleaner, easier to 
> understand, and less prone to errors.

I'll look into for the next rev.

> 	Dominik

Thanks. Paul.
