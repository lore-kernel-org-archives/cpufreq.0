From: Christian Flamm <alcc@gmx.de>
Subject: I haven't been able to set the chosen policy for CPU0
Date: Mon, 19 May 2008 12:31:56 +0200
Message-ID: <200805191231.56508.alcc@gmx.de>
Reply-To: alcc@gmx.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk

"I haven't been able to set the chosen policy for CPU0._I set 
1667000-1000000-ondemand_System says 1000000-1000000-ondemand_"

That's what the log files says. CPU's frequenzy randomly falls to minimum 
(1000000). Sometimes I can manually correct that, but more often I can't and 
the above message appears.

$ zcat /proc/config.gz | grep -i freq
	# CPU Frequency scaling
	CONFIG_CPU_FREQ=y
	CONFIG_CPU_FREQ_TABLE=y
	# CONFIG_CPU_FREQ_DEBUG is not set
	CONFIG_CPU_FREQ_STAT=y
	# CONFIG_CPU_FREQ_STAT_DETAILS is not set
	CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
	# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
	# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
	# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
	CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
	CONFIG_CPU_FREQ_GOV_POWERSAVE=y
	CONFIG_CPU_FREQ_GOV_USERSPACE=y
	CONFIG_CPU_FREQ_GOV_ONDEMAND=y
	CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
	# CPUFreq processor drivers
	CONFIG_X86_ACPI_CPUFREQ=m
	# CONFIG_X86_CPUFREQ_NFORCE2 is not set
	# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set

$ cat /etc/cpufreqd.conf
	[General]
	pidfile=/var/run/cpufreqd.pid
	poll_interval=2
	verbosity=7
	double_check=1
	#enable_plugins=apci_ac,cpu,acpi_battery
	enable_remote=1
	remote_group=wheel
	[/General]
	
	[Profile]
	name=Halbgas
	minfreq=1000000
	maxfreq=1667000
	policy=ondemand
	[/Profile]
	
	[Profile]
	name=Vollgas
	minfreq=1667000
	maxfreq=1667000
	policy=performance
	[/Profile]
	
	[Rule]
	name=none
	ac=on
	profile=Vollgas
	[/Rule]

	[Rule]
	name=battery
	ac=off
	profile=Halbgas
	[/Rule]

Already upgraded to kernel 2.6.25-gentoo-r2 and cpufreqd 2.2.1... nothing 
changes. Processor is an Intel(R) Core(TM) Duo CPU L2400 @ 1.66GHz. Would you 
say thats probably a broken kernel or a broken bios?

Regards,
alcCapone.
