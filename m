From: Dominik Brodowski <linux@brodo.de>
Subject: ACPI P-State platform limit [Was: Re: Cpufreq for opteron]
Date: Wed, 27 Aug 2003 07:33:00 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030827053300.GB4037@brodo.de>
References: <99F2150714F93F448942F9A9F112634C080EF034@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C080EF034@txexmtae.amd.com>
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
Content-Transfer-Encoding: 7bit
To: paul.devriendt@AMD.com
Cc: pavel@suse.cz, richard.brunner@AMD.com, aj@suse.de, cpufreq@www.linux.org.uk, davej@redhat.com, mark.langsdorf@AMD.com

[removed CC:linux-kernel]

> > I dislike this interaction between ACPI and cpufreq -- it 
> > should be done
> > more generally. Let's discuss that seperately, though. And if 
> > the code is
> > dead code at the moment.
> 
> The dead code has been removed in 1.00.07 of the driver. I am
> happy to receive suggestions as to better ways of detecting battery
> versus mains power transitions.

Currently, the ACPI P-States cpufreq driver does implement the "platform
limit". However, I'm not really excited about how it works -- and especially
that it only works with the ACPI P-States cpufreq driver and not with all
drivers.

[ A preliminary questions to the AMD people out here: Is the information in 
the _PSS of any usage for the powernow-k{7,8} driver? ]

The platform limit [ _PPC ] refers to the states defined in _PSS. This means
that this knowledge can and should be used independent of the cpufreq driver:
if the _PPC is, let's say, 2, and accoring to _PSS P2 is 1.2 GHz, a
"platform limit CPUFREQ_POLICY_NOTIFIER". If the _PPC changes, a
new cpufreq_reevaluate() function should be called:

/* cpufreq_reevaluate() - called by policy notifiers if their demands change
 * @cpu - affected CPU (nr).
 *
 * Certain cpufreq policy notifiers have demands which change over time, for
 * example a different ACPI platform limit aftern an docking/undocking event,
 * or a dangerously high temperature. When such a demand changes,
 * cpufreq_reevaluate() shall be called. This function will then try to set
 * the existing ->min, ->max and ->policy or ->governor combination, and in
 * this process all policy notifiers are called as usual.
 *
 * NOTE #1: this function might_sleep().
 */

cpufreq_reevluate(unsigned int cpu)
{
	cpufreq_policy * data = cpufreq_cpu_get(cpu);

	if (!data)
		return -EINVAL;

	cpufreq_set_policy(data);

	cpufreq_cpu_put(cpu);
}


Comments?

	Dominik
