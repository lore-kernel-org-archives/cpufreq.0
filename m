From: Alex Simonov <a_simonov@yahoo.com>
Subject: Re: Ondemand governor not working with kernel-2.6.12-12mdk
Date: Sat, 8 Oct 2005 10:30:32 -0700 (PDT)
Message-ID: <20051008173032.52611.qmail@web32704.mail.mud.yahoo.com>
References: <43455149.1090702@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <43455149.1090702@tremplin-utc.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="utf-8"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: cpufreq@lists.linux.org.uk

Hello Eric,

> > 
> Here it is. It's against 2.6.13 but should
> apply cleanly against 2.6.12. 

Your patch did the trick, thanks! The only draw
back is that the responsiveness is not 
so good - it takes at least 2-3 seconds to 
switch  to  the highest frequency and back, when
thie high load is over. Is it supposed to be like
that by design, or this latency could be changed?


>   If it works (or doesn't), could you also
> email the cpufreq list, to 
> continue the thread there?

Sorry, I forgot to CC it to the cpufreq list.
Here it is now.



Alex



> 
> Eric
> > ---
>linux-2.6.13/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c.bak
> 2005-08-08 10:14:35.000000000 +0200
> +++
>
linux-2.6.13/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
> 2005-09-17 12:50:27.000000000 +0200
> @@ -301,6 +301,35 @@ static int
> speedstep_verify (struct cpuf
>  }
>  
>  
> +/**
> + * speedstep_get_transition_latency - returns
> the maximum transition latency
> + * of the current processor
> + * @processor: type of processor
> + *
> + * The CPU transition latency depends on the
> type of CPU, so we get it
> + * from a database.
> + */
> +static unsigned int
> speedstep_get_transition_latency(unsigned int
> processor)
> +{
> +	switch (processor) {
> +	case SPEEDSTEP_PROCESSOR_PIII_C:
> +	case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
> +		/* According to intel's p3_ds.pdf p.23 and
> table 22, similar to PIII_T */
> +	case SPEEDSTEP_PROCESSOR_PIII_T:
> +		/* Max 100µs, according to intel's
> 29834006.pdf p.22 */
> +		return 100000;
> +	case SPEEDSTEP_PROCESSOR_P4M:
> +		/* 
> +		 * Depends on the bus clock, which should be
> at least 100MHz.
> +		 * Max ~42µs -> 50µs, according to intel's
> 25068607.pdf p.40 and p.50
> +		 */
> +		return 50000;
> +	default:
> +		/* No info has yet be found, so we are
> conservative */
> +		return CPUFREQ_ETERNAL;
> +	}
> +}
> +
>  static int speedstep_cpu_init(struct
> cpufreq_policy *policy)
>  {
>  	int result = 0;
> @@ -335,7 +364,8 @@ static int
> speedstep_cpu_init(struct cpu
>  
>  	/* cpuinfo and default policy values */
>  	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
> -	policy->cpuinfo.transition_latency =
> CPUFREQ_ETERNAL;
> +	policy->cpuinfo.transition_latency = 
> +	
>
speedstep_get_transition_latency(speedstep_processor);
>  	policy->cur = speed;
>  
>  	result =
> cpufreq_frequency_table_cpuinfo(policy,
> speedstep_freqs);
> 



	
		
__________________________________ 
Yahoo! Mail - PC Magazine Editors' Choice 2005 
http://mail.yahoo.com
