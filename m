From: Bryan O'Sullivan <bos@serpentine.com>
Subject: RE: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 10:59:50 -0700
Message-ID: <1158775190.25199.23.camel@sardonyx>
References: <EB12A50964762B4D8111D55B764A84549CCEE1@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84549CCEE1@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

On Wed, 2006-09-20 at 09:24 -0700, Pallipadi, Venkatesh wrote:

> Yes. As Dave said your processor supports speedstep. Whether your
> platform (BIOS) supports it or not is the next question. 
> 
> The patch will make acpi-cpufreq either succeed or fail cleanly rather
> than hanging in there without doing anything.

I built 2.6.18 and booted into it with cpufreq.debug=3, and got not a
squeak out of it.  There's no cpufreq-related info in /var/log/messages
at all.

>  And again as Dave
> mentioned, try both acpi-cpufreq and speedstep-centrino drivers.

I'm using the Fedora kernel config, which builds acpi-cpufreq as a
module and speedstep-centrino built-in, but no joy.

I'll try building the lot as modules, and see how that goes.

Here's what's in my .config with the setup that prints nothing at all:

CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
CONFIG_CPU_FREQ_DEBUG=y
CONFIG_CPU_FREQ_STAT=m
CONFIG_CPU_FREQ_STAT_DETAILS=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
CONFIG_X86_POWERNOW_K8=y
CONFIG_X86_POWERNOW_K8_ACPI=y
CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
# CONFIG_X86_SPEEDSTEP_LIB is not set

	<b
