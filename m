From: Dominik Brodowski <linux@brodo.de>
Subject: Re: CPUFreq dynamic speed governor, take 2.
Date: Sat, 1 Nov 2003 19:09:48 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031101180948.GB3945@brodo.de>
References: <1067583848.25805.234.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1067583848.25805.234.camel@localhost>
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
To: Jon Anderson <janderson@janderson.ca>
Cc: cpufreq@www.linux.org.uk

[Venkatesh, please read line 54++]

Hi Jon,

It seems to me that your governor uses exactly the same algorithm as the one
proposed by Venkatesh Pallipadi, but maybe with some slightly different
default values. So, I'd prefer if only one of these two were
merged into CVS and/or the kernel. And, for that matter, I prefer
Venkatesh's code at the moment as it's cleaner, supports different CPUs,
... - but see below for some details.
 
On Fri, Oct 31, 2003 at 02:04:08AM -0500, Jon Anderson wrote:
> I wrote a simple "dynamic" frequency governor for use on my non-mobile
> P4 laptop, since the demandbased governor patch seems to be targeted at
> mobile CPUs. (...and doesn't work for me :)

That's not entirely correct -- it just has rather strict limits on the
"transition latency", and several cpfureq drivers don't set the proper
transition latency but the dummy value "CPUFREQ_ETERNAL" which disables
dynamic governors [in kernelspace].

> 2) People seem to prefer userspace tools to govern frequency.
Well, I surely don't. I prefer kernelspace.

> +config CPU_FREQ_DEFAULT_GOV_DYNAMIC
"Dynamic" governors can't be default governor -- they can fail due to
transition latency limits, and would leave the cpufreq core in an undefined
state then. Also, the name "dynamic" is too generic as there likely will be
different dynamic cpufreq governors available.

> +/** Should be a list, from FREQ_MAX to FREQ_MIN of CPU speeds in KHz. 
> + * e.g. { FREQ_MAX,1500000,1000000,500000,FREQ_MIN }
> + */
> +static const int32_t cpufreq_dynamic_freqs[] = {
> +	FREQ_MAX, \
> +/**
> + * FIXME: Find better way to find frequencies to switch to.
> + *
> + * These values work on my non-mobile P4 2 GHz, but 
> + * would probably just waste CPU cycles on most other
> + * CPUs. (I.e. these values would probably be invalid.)
> + *
> + *	1500000, \
> + *	1000000, \
> + *	500000, \
> + *	250000, \ */
> +	FREQ_MIN \
> +};

There's no valid reason for such a table. A governor should either
calculate a percentage of operating power, and say whether to go up or down
if this frequency = percentage * max_frequency isn't available. 

Actually, this is a problem in Venkatesh's code: If the governor says "there's
too few processing power available, let's increase the speed" it increases
the current speed by 1 kHz, and says this is a "low limit" which means that
the new speed must be higher than that. For the common frequency scaling
implementations out there, which define only few frequency states, this is
not a problem. For the geode driver, though, which has several thousand
frequency states available IIRC, this is a big problem: switching from
lowest to highest speed may take a couple of seconds or even minutes!


	Dominik
