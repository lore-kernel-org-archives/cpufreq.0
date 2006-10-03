From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Frequency changes for XScale PXA255
Date: Mon, 2 Oct 2006 20:23:47 -0400
Message-ID: <20061003002346.GH9748@dominikbrodowski.de>
References: <b6cb966c0607060232k40b87efrd51c9bbdbaf8a105@mail.gmail.com>
	<20060706160859.GA5441@isilmar.linta.de>
	<b6cb966c0607061009o64a6a47dnaa996219f6984c2e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <b6cb966c0607061009o64a6a47dnaa996219f6984c2e@mail.gmail.com>
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
To: Miroslav Vasic <miroslav.vasic@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

Sorry for not getting back to you earlier. What's the status of your
modules? A few comments:

On Thu, Jul 06, 2006 at 07:09:01PM +0200, Miroslav Vasic wrote:
> static int pxa_set_target(struct cpufreq_policy *policy,
>                 unsigned int target_freq,
>                 unsigned int relation)
> {
>    /*
>     * Bind to the specified CPU.  When this call returns,
>     * we should be running on the right CPU.
>     */
>    set_cpus_allowed(current, cpumask_of_cpu(cpu));
>    BUG_ON(cpu != smp_processor_id());

You don't need to do that this early -- the next few instructions can still
be run on any CPU.
> 
>    /* Get the current policy */
>    pxa_select_freq_table(policy, &pxa_freq_settings, &pxa_freqs_table);
> 
>    /* Lookup the next frequency */
>    if (cpufreq_frequency_table_target(policy, pxa_freqs_table,
>                                       target_freq, relation, &idx)) {
>        return -EINVAL;
>    }

up to exactly here. Unless get-clk_frequency_khz(0) means "let's ask for the
speed of CPU 0", then this code is even more broken. It is broken, BTW, for
it does no error handling (i.e. resetting set_cups_allowed().)

>    printk(KERN_INFO "The first notify_transition \n");
>    cpufreq_notify_transition1(&freqs, CPUFREQ_PRECHANGE);
			      ^
artifact or part of the code?

	Dominik
