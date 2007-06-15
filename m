From: "Klaus.K Pedersen (Nokia-M/Helsinki)" <klaus.k.pedersen@nokia.com>
Subject: Re: cpufreq_set_policy removed
Date: Fri, 15 Jun 2007 20:45:25 +0300
Message-ID: <1181929526.3436.8.camel@kp-core.localdomain>
References: <20070606214243.GX15955@bakeyournoodle.com>
	<1181170878.31677.272.camel@localhost.localdomain>
	<20070606231342.GA16771@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20070606231342.GA16771@redhat.com>
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
To: cpufreq@lists.linux.org.uk

I currently use set_policy() to get around some peculiar features 
of OMAP2420, so at first I was a little scared. But now after fixing
my code - I agree that it is much better to only rely on the
CPUFREQ_POLICY_NOTIFIER chain.

I have some comments to patch in-line:

On Thu, 2007-06-07 at 00:14 +0000, an unknown sender wrote:
... 
> On Mon, 2007-05-07 at 19:20 +1000, Benjamin Herrenschmidt wrote:
... 
> Index: linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
> ===================================================================
> --- linux-2.6.22-rc2.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
> +++ linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
...
> @@ -173,15 +173,27 @@ static void cbe_cpufreq_handle_pmi(struc
>  	cpu = cbe_node_to_cpu(pmi_msg.data1);
>  	cbe_pmode_new = pmi_msg.data2;
>  
> -	cpufreq_get_policy(&policy, cpu);
> +	pmi_frequency_limit = cbe_freqs[cbe_pmode_new].frequency;
>  
> -	policy.max = min(policy.max, cbe_freqs[cbe_pmode_new].frequency);
> -	policy.min = min(policy.min, policy.max);
> +	pr_debug("cbe_handle_pmi: max freq=%d\n", pmi_frequency_limit);
> +}

Shouldn't cpufreq_update_policy() be called from this function? 

> +
> +static int pmi_notifier(struct notifier_block *nb,
> +				       unsigned long event, void *data)
...
> +	cpufreq_verify_within_limits(policy, 0, pmi_frequency_limit);
> +	return 0;
>  }

... because pmi_notifier() is updating the policy...

... 
> @@ -238,6 +250,10 @@ static int cbe_cpufreq_cpu_init(struct c
>  
>  	cpufreq_frequency_table_get_attr(cbe_freqs, policy->cpu);
>  
> +	/* frequency might get limited later, initialize limit with max_freq */
> +	pmi_frequency_limit = max_freq;
> +	cpufreq_register_notifier(&pmi_notifier_block, CPUFREQ_POLICY_NOTIFIER);

... and pmi_notifier() is registered on the CPUFREQ_POLICY_NOTIFIER
chain.

So, how is the CPUFREQ_POLICY_NOTIFIER chain executed with no calls to
cpufreq_update_policy() (or __cpufreq_set_policy())?

And if pmi_notifier() is not called, how is the policy updated?


BR, Klaus Pedersen
