From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: writing a cpufreq driver
Date: Fri, 22 Sep 2006 17:39:49 +0200
Message-ID: <20060922153948.GN4945@poupinou.org>
References: <20060921184833.GC1216@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060921184833.GC1216@dbz.icequake.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nemesis@icequake.net
Cc: Cpufreq@lists.linux.org.uk

On Thu, Sep 21, 2006 at 01:48:33PM -0500, Ryan Underwood wrote:
> 
> I wrote a cpufreq target driver for older Toshiba laptops.  It uses SMM
> to change between a "fast" and a "slow" processing speed.  I have two
> remaining bugs.  Any comments would be appreciated.
> 
> 1.  The first time cpufreq changes speed, I get the whole "Losing some
> ticks... checking if CPU frequency changed." then eventually "Losing too
> many ticks!" and timer switches to PIT.  This does not happen when I use
> the /dev/toshiba driver to change speeds from userspace.  Not sure what
> is going on here...  SMI handler latency is between 6 and 7 ms.
> 
> 2.  The current CPU frequency is stored in NVRAM by the SMI handler.
> Unfortunately, this means if cpufreq throttles the CPU and the system is
> then rebooted, the boot process is exceedingly slow.  Is there some sane
> way to hook into the shutdown process to restore the appropriate values,
> or is this something I have to live with?

That may indicate TSC frequency is constant.  Try to add a
.flags = CPUFREQ_CONST_LOOPS
onto the driver like this:

> static struct cpufreq_driver toshiba_freq_driver = {
> 	.get	= toshiba_freq_get_cpu_frequency,
> 	.verify	= toshiba_freq_verify,
> 	.target	= toshiba_freq_target,
> 	.init	= toshiba_freq_cpu_init,
> 	.exit	= toshiba_freq_cpu_exit,
> 	.name	= "toshiba_freq",
> 	.owner	= THIS_MODULE,
> 	.attr	= toshiba_freq_attr,
        .flags	= CPUFREQ_CONST_LOOPS,
	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	HERE
> };
> 


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
