From: linux@brodo.de
Subject: RE: [BUG] 2.6.0: ARM won't build without
	CONFIG_CPU_FREQ_GOV_USERSPACE=y
Date: Fri, 26 Dec 2003 10:57:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AZojC-00049i-00@mrelay00.kundenservices.net>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, rmk@arm.linux.org.uk

Because of "cpufreq_get()" being necessary for SA1100 it is already
special-handled for this architecture. 

A snippet from arch/arm/Kconfig:

# CPUfreq on SA11x0 is special -- it _needs_ the userspace governor

config CPU_FREQ_SA1100
	bool
	depends on CPU_FREQ && SA1100_LART
	default y
	select CPU_FREQ_DEFAULT_GOV_USERSPACE
	select CPU_FREQ_24_API if SYSCTL

config CPU_FREQ_SA1110
	bool
	depends on CPU_FREQ && (SA1100_ASSABET || SA1100_CERF |
SA1100_PT_SYSTEM3)
	default y
	select CPU_FREQ_DEFAULT_GOV_USERSPACE
	select CPU_FREQ_24_API if SYSCTL


IMO this should cause the default governor to be forced to "userspace",
and the deprecated 2.4. API [including cpufreq_get()] to be activated as
well. However, Kconfig thinks different: the default setting for
CPU_FREQ_DEFAULT_GOV (see drivers/cpufreq/Kconfig) is PERFORMANCE, and
this seems to take precedence over the "select". IMHO this is a Kconfig
bug -- can you notify the maintainer of this issue, please?

Else we'd have to change drivers/cpufreq/Kconfig from
default CPU_FREQ_DEFAULT_GOV_PERFORMANCE
to
default CPU_FREQ_DEFAULT_GOV_PERFORMANCE if !CPU_FREQ_SA1100
default CPU_FREQ_DEFAULT_GOV_USERSPACE if !CPU_FREQ_SA1100
or disable the selection for CPU_FREQ_SA1100 completely.

    Dominik
