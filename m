From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq driver for nForce2
Date: Sun, 6 Jun 2004 18:20:52 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040606162052.GA26435@dominikbrodowski.de>
References: <40BF2860.1070502@hasw.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40BF2860.1070502@hasw.net>
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
To: Sebastian Witt <se.witt@gmx.net>
Cc: cpufreq@www.linux.org.uk

Hi Sebastian,

A few remarks on your driver:

- nforce2_verify should assert that there's at least one valid state in
  between policy->min and policy->max. If policy->min were 55300 kHz and
  policy->max 55400 kHz, nforce2_verify wouldn't adapt. Something like
	fsb_pol_max = policy->max / (fid * 1000);
	if (policy->min < (fsb_pol_max * fid * 1000))
		policy->max = (fsb_pol_max + 1) * fid * 1000;
  Or does the code in nforce2_calc_pll mean that there might be only one
  "state" available in a 4 MHz FSB interval? If so, the code above needs to
  be modified.

- Why is the new PLL value written _forty_ times?

- nforce2_target should be ordered a bit differently: calculate
	target_fsb = target_freq / (fid * 1000);
  first, then set
	freqs.new = target_fsb * fid * 1000;

- implement a ->get() function, please. It's (probably) only
static unsigned int nforce2_get(unsigned int cpu)
{
	if (cpu)
		return 0;
	return nforce2_fsb_read() * fid * 1000;
}

- if there's an user-specified max_fsb which is larger than it was booted
  at, there should be a big warning -- if anyone is overclocking the CPU,
  there might be random crashes etc. These should not need to be debugged by
  kernel developers.

- Speaking of stability: changing the FSB on the fly proved to be difficult
  on other platforms. While I think the method used in nforce2 is less
  error-prone, it might be good to add some big warning to the kernel logs

- Next issue wrt stability: where did you get the information from? While I
  don't really care, if it's from "official" documentation, it's less prone
  to stability errors.

- cpufreq_frequency_table_put_attr(policy->cpu) in nforce2_cpu_exit is
  invalid, as you're not using cpufreq table helpers. Also, the
  corresponding get_attr call is missing, so... Also, this means you don't
  need to have a nforce2_attr or a .attr in struct nforce2_driver.

- please convert MODULE_PARM to module_param

- s/NFORCE2_SAVE_DISTANCE/NFORCE2_SAFE_DISTANCE

- check for !cpu_khz in ->init(). While unlikely, it is possible that
  cpu_khz isn't initialized correctly due to broken TSC etc.

- Implementing .5 FIDs shouldn't be too difficult.
	x change the semantics of FID to represent _ten_ times the FID
	x 
	if (!fid)
		fid = cpu_khz / (fsb * 100);
	if (fid % 5) {
		unsigned int mfid = fid % 5;
		if (mfid > 2)
			fid += 5 - mfid;
		else
			fid -= mfid;
	}


Thanks,
	Dominik
