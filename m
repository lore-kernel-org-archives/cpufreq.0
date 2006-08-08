From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 4/8] acpi-cpufreq: remove ACPI from speedstep-centrino
	driver -- updated to not revert Jeremy's patch
Date: Mon, 7 Aug 2006 21:42:21 -0400
Message-ID: <20060808014221.GB21822@dominikbrodowski.de>
References: <44CE5015.2090200@linux.intel.com>
	<44D1BBB7.6010903@linux.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44D1BBB7.6010903@linux.intel.com>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>

Hi,

On Thu, Aug 03, 2006 at 01:02:47PM +0400, Alexey Starikovskiy wrote:
>  speedstep-centrino.c |  234 +++------------------------------------------------
>  1 file changed, 17 insertions(+), 217 deletions(-)
> 
> remove ACPI from speedstep-centrino driver

At least two issues with this patch:

a) you leave arch/i386/kernel/cpu/cpufreq/Kconfig alone, even though all
relevant usages of X86_SPEEDSTEP_CENTRINO_ACPI seem to be removed by this
patch.

b) you suggest to remove a "feature" here. (A feature being a functionality
working with a specific .config setting). We shouldn't do that without a
fair warning and a sufficient transition period, unless we have compelling
reasons to do otherwise. Therefore, I'd suggest to first
- Add a warning
	printk(KERN_WARNING "Please use CONFIG_... instead!")
- tweak KCONFIG so that if X86_SPEEDSTEP_CENTRINO_ACPI was set,
  CONFIG_X86_ACPI_CPUFREQ is selected, e.g.

 config X86_SPEEDSTEP_CENTRINO_ACPI
 	bool "Use ACPI tables to decode valid frequency/voltage pairs"
  	depends on X86_SPEEDSTEP_CENTRINO && ACPI_PROCESSOR
 	depends on !(X86_SPEEDSTEP_CENTRINO = y && ACPI_PROCESSOR = m)
 	default y
+	select X86_ACPI_CPUFREQ
 	help
 	  Use primarily the information provided in the BIOS ACPI tables
 	  to determine valid CPU frequency and voltage pairings. It is
 	  required for the driver to work on non-Banias CPUs.

     - add a notice to Documentation/feature-removal-schedule.txt.


and the actual code is only removed in a couple of months (>6) from now.


Also, I wonder how we'll look on this this merge-all-into-one-driver-approach
in a few years. Remember Dave's talk at OLS 2003 about
merge-then-split-up-then-remerging-then-splitting-up-cycles in the
kernel...[*]

	Dominik

[*] http://archive.linuxsymposium.org/ols2003/Proceedings/All-Reprints/Reprint-Jones-OLS2003.pdf
