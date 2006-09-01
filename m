From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 0/5] Unify ACPI bits on speedstep-centrino and acpi-cpufreq
Date: Fri, 1 Sep 2006 14:04:11 -0700
Message-ID: <20060901140411.C14821@unix-os.sc.intel.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>


Grand unification of ACPI based speedstep-centrino and acpi-cpufreq drivers.

ACPI allows P-state transitions in multiple ways. Like using IO ports or using
processor native method (MSR). Without this patch, IO port based P-state
transitions are handled in acpi-cpufreq driver and MSR based transitions on
Intel CPUs are handled in speedstep-centrino driver. Even though most of the
code in these two drivers should be similar, except for final changing/checking
of frequency (one driver does it using IO port and other does it through
MSR), we have duplicated code in these two drivers. There are also issues
around BIOSes supporting both MSR and IO port and which driver should be
loaded first in standard installations.

The patchset combines functionality of these two driver into acpi-cpufreq
driver. ACPI based functionality in speedstep-centrino is marked deprecated
and will be removed in future. speedstep-centrino will continue to work
on systems that depend on older non-ACPI table based P-state chanes.

Patchset contains:
* 1/5 - Patch that reorganizes the code in acpi-cpufreq, cleaning it up
a little and making it easier to add MSR support later.
* 2/5 - Pull in the MSR based transition support into acpi-cpufreq.
* 3/5 - Mark speedstep-centrino deprecated. Change the order in Makefile to
load acpi-cpufreq first and speedstep-centrino later, in cases where both
are configured in.
* 4/5 - lindent acpi-cpufreq.c
* 5/5 - Minor change to eliminate the check of current frequency on
notifications. We can use last set frequency instead.

There will be a patch in future that removes ACPI based support in
speedstep-centrino in coming months.

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
