From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Driver to export CPUfreq statistic
Date: Sun, 21 Nov 2004 11:06:58 +0100
Message-ID: <20041121100658.GB14594@dominikbrodowski.de>
References: <894E37DECA393E4D9374E0ACBBE7427013C999@pdsmsx402.ccr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <894E37DECA393E4D9374E0ACBBE7427013C999@pdsmsx402.ccr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Zou, Nanhai" <nanhai.zou@intel.com>
Cc: cpufreq@www.linux.org.uk

Hi,

The new patch looks much better to me :-)

Three issues, though:

On Thu, Nov 18, 2004 at 10:41:40AM +0800, Zou, Nanhai wrote:
> +struct cpufreq_frequency_table *cpufreq_frequency_get_table(unsigned
> int cpu)
> +{
> +	        return show_table[cpu];
> +}
> +EXPORT_SYMBOL_GPL(cpufreq_frequency_get_table);
> 
> Please add a comment above this function that it is only safe to use the
> data obtained as long as a reference obtained by cpufreq_cpu_get() is
> held;
> and you need to copy it to a local place __and__ can't be sure it
> doesn't
> change forever.
>
> ...
>
> +config CPU_FREQ_STAT
> +       tristate "CPU frequency translation statistics"
> +       depends on CPU_FREQ_TABLE
> +       default y
> +       help
> +         This driver exports CPU frequency statistics information
> through sysfs
> +         file system
> +
> +config CPU_FREQ_STAT_DETAILS
> +       bool "CPU frequency translation statistics details"
> +       depends on CPU_FREQ_STAT
> +       default n
> +       help
> +         This will show detail CPU frequency translation table in sysfs
> file
> +         system
> 
> I'm pondering two things: 
> a) should we make this dependant on CPU_FREQ_DEBUG?
> b) should we make CPU_FREQ_STAT_DETAILS available unconditionally?


And third: what's the general opinion on whether to merge it
a) into the kernel sources	_or_
b) into cpufrequtils (in debug/kernel/ )

The former means it's available much more easily, as no userspace package is
necessary. The latter has the advantage that interested parties can access
it, but it does not increase the kernel normally.

Thanks,
	Dominik
