From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Thu, 10 Jun 2004 17:37:11 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610153711.GZ13782@poupinou.org>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<40C7AF6C.1080408@cern.ch>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40C7AF6C.1080408@cern.ch>
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
To: holbling@cpt.univ-mrs.fr
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

Hi,

On Thu, Jun 10, 2004 at 12:46:36AM +0000, Christian Hoelbling wrote:


> diff --unified --recursive --new-file linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
> --- linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-09 22:27:18.000000000 +0000
> +++ linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-10 00:29:54.388186856 +0000
> @@ -70,6 +70,7 @@
>   * @notify: whether to call cpufreq_notify_transition for CPU speed changes
>   *
>   *   Tries to change the SpeedStep state. 
> + * Note: notify is a dummy argument. The routine never notifies.

Maybe it's better to kill notify, and modify a little speedstep-smi and speedstep-lib

Dominik, your though, please?

...

> +
> +	for_each_cpu(i) {
> +	        if (cpu_isset(i, affected_cpu_map)) {
> +	                freqs.cpu = i;
> +			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
> +		}
> +	}

What about 
	for_each_cpu_mask(i, affected_cpu_map) {
		...
	}
instead?
>  
>  	/* detect low and high frequency */
>  	result = speedstep_get_freqs(speedstep_processor,
> @@ -297,6 +337,9 @@
>  	if (!speed)
>  		return -EIO;
>  
> +	/* allow to run on any CPU */
> +	set_cpus_allowed(current, cpus_allowed);
> +

Something wrong.  I mean, there is a return but the set_cpu_allowed()
is done after...

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
