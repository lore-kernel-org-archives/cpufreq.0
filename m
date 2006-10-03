From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Race in cpufreq_add_dev()?
Date: Mon, 2 Oct 2006 20:27:38 -0400
Message-ID: <20061003002738.GI9748@dominikbrodowski.de>
References: <44AD6609.1080604@goop.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44AD6609.1080604@goop.org>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@lists.linux.org.uk

On Thu, Jul 06, 2006 at 12:35:37PM -0700, Jeremy Fitzhardinge wrote:
> cpufreq_add_dev contains the test:
> 
> #ifdef CONFIG_SMP
> 	/* check whether a different CPU already registered this
> 	 * CPU because it is in the same boat. */
> 	policy = cpufreq_cpu_get(cpu);
> 	if (unlikely(policy)) {
> 		cpufreq_cpu_put(policy);
> 		cpufreq_debug_enable_ratelimit();
> 		return 0;
> 	}
> #endif
> 
> I don't see what prevents two CPUs from racing through here.  Both could 
> perform this test and find that there's no policy for the CPU, and then 
> both will attempt to add it.  Or is there something else which 
> serializes multiple CPUs through this code?

AFAICS it is protected by sysdev_drivers_lock.

	Dominik
