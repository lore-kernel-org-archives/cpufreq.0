From: Sebastian Witt <se.witt@gmx.net>
Subject: Re: cpufreq driver for nForce2
Date: Sun, 06 Jun 2004 21:34:00 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40C371A8.1030005@hasw.net>
References: <40BF2860.1070502@hasw.net>
	<20040606162052.GA26435@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040606162052.GA26435@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

Hi Dominik,

Dominik Brodowski wrote:

> - nforce2_verify should assert that there's at least one valid state in
>   between policy->min and policy->max. If policy->min were 55300 kHz and
>   policy->max 55400 kHz, nforce2_verify wouldn't adapt. Something like
> 	fsb_pol_max = policy->max / (fid * 1000);
> 	if (policy->min < (fsb_pol_max * fid * 1000))
> 		policy->max = (fsb_pol_max + 1) * fid * 1000;
>   Or does the code in nforce2_calc_pll mean that there might be only one
>   "state" available in a 4 MHz FSB interval? If so, the code above needs to
>   be modified.

I will change this.

> - Why is the new PLL value written _forty_ times?

It's written 64 times. The chipset applies the new FSB when the 
'counter' (PLLADR) reaches 0x40.

> - nforce2_target should be ordered a bit differently: calculate
> 	target_fsb = target_freq / (fid * 1000);
>   first, then set
> 	freqs.new = target_fsb * fid * 1000;

Ok, changed.

> - implement a ->get() function, please. It's (probably) only
> static unsigned int nforce2_get(unsigned int cpu)
> {
> 	if (cpu)
> 		return 0;
> 	return nforce2_fsb_read() * fid * 1000;
> }

This also.

> - if there's an user-specified max_fsb which is larger than it was booted
>   at, there should be a big warning -- if anyone is overclocking the CPU,
>   there might be random crashes etc. These should not need to be debugged by
>   kernel developers.

I've added a warning when max_fsb is greater than the current FSB.

> - Speaking of stability: changing the FSB on the fly proved to be difficult
>   on other platforms. While I think the method used in nforce2 is less
>   error-prone, it might be good to add some big warning to the kernel logs

Yes, this is only possible because the PCI/AGP clock is independent from 
the FSB. I added a warning.

> 
> - Next issue wrt stability: where did you get the information from? While I
>   don't really care, if it's from "official" documentation, it's less prone
>   to stability errors.

I don't know if there is any official documentation, it's based on 
8rdavcore (www.hasw.net/8rdavcore) and the FSB changing code is tested 
for several months. If the FSB is changed between a limited range 
(max_fsb = bootfsb and min_fsb = bootfsb - 60 works on most boards), 
there are no problems.

On many boards is a greater range possible, but this depends too much on 
the chipset parameters set by the Bios. But FSB changing was never 
planned and is out of specifications so this is all experimental.

> - cpufreq_frequency_table_put_attr(policy->cpu) in nforce2_cpu_exit is
>   invalid, as you're not using cpufreq table helpers. Also, the
>   corresponding get_attr call is missing, so... Also, this means you don't
>   need to have a nforce2_attr or a .attr in struct nforce2_driver.

You're right, removed it.

> - please convert MODULE_PARM to module_param
> 
> - s/NFORCE2_SAVE_DISTANCE/NFORCE2_SAFE_DISTANCE

> - check for !cpu_khz in ->init(). While unlikely, it is possible that
>   cpu_khz isn't initialized correctly due to broken TSC etc.

Done.

Thanks for your help,
Sebastian
