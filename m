From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES] cpufreq patches: cleanups, bugfixes, debug infrastructure
Date: Wed, 6 Oct 2004 17:16:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041006151617.GA7556@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

The following quite large number of patches is currently in my queue.
They are mostly trivial bugfixes and/or cleanups; and because of the large
number I won't send them to the list [a few have been sent to the list before,
were marked as RFC, and didn't generate any feedback]. If you are interested
you can take a look at the patches at the specified URL.

The patches apply on current cpufreq-bk, and even though they were created
on top of -rc2, they do apply well on top of -rc3, too.

	Dominik


http://www.brodo.de/patches/2004-10-06/1_cpufreq-2.6.9-rc2-userspace-remember-users-wish

Sometimes, a user or userspace daemon wants a specific frequency is set,
but that frequency is (temporarily) unavailable or becomes unavailable
due to e.g. thermal considerations. As soon as this situation changes,
the user wish should be re-evaluated. The attached patch saves the user
wish in "cpu_set_freq", and re-uses that whenever appropriate.

Thanks to Thomas Renninger for testing.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/2_cpufreq-2.6.9-rc2-speedstep-centrino-dont-break-on-FFFFFFFF-ed-frequencies

Some BIOSes export invalid _PSS entries where all bits are set to one. While
this is totally contrary to the ACPI specification, BIOS vendors try to
tell userspace that these entries should not be considered or used. In order
to not fail on such entries, the speedstep-centrino already contains a
method to ignore these things. However, due to a wrong ordering of checks
the driver aborts nonetheless. So move some checks around.


Signed-off-by: Dominik Brodowski <linux@brodo.de>


<3_ is unused>

http://www.brodo.de/patches/2004-10-06/4_cpufreq-2.6.9-rc2-powernow-k7-static

struct acpi_processor_performance *acpi_processor_perf should be static.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/5_cpufreq-2.6.9-rc2-ondemand-static

dbs_tuners_ins should be static.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/6_cpufreq-2.6.9-rc2-core-static

Attribute definitions in cpufreq core should be static.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/7_cpufreq-2.6.9-rc2-userspace-static

cpufreq_sysctl_table should be static even though it'll be gone soon.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/8_cpufreq-2.6.9-rc2-p4-clockmod-dothan-thinko

Dothan is stepping 13  == 0x0D instead of 0x13 == 19

Thanks to Brian Miles for debugging this issue.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/9_cpufreq-2.6.9-rc2-rename-cpufreq-acpi

NOTE: For this patch to work you need to move the file
arch/i386/kernel/cpu/cpufreq/acpi.c in bitkeeper to
arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c _before_ applying this
patch. I haven't done it by means of diff -ruN so that the file 
history can be kept. END NOTE.

The "acpi" cpufreq driver uses the far too generic module name "acpi".
Fix it by renaming it to "cpufreq-acpi". A MODULE_ALIAS("acpi"); will
allow for backwards-compatible naming until 2005-06-30.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/10_cpufreq-2.6.9-rc2-Kconfig-unify-CPU_FREQ

Unify the CPU_FREQ config option.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


<11_ is unused>


http://www.brodo.de/patches/2004-10-06/12_cpufreq-2.6.9-rc2-clarify-cpufreq-set-will-go

Clarify that cpufreq_set() and cpufreq_setmax() are parts of the 2.4. API 
to the userspace governor which will be removed soon after 2005-01-01.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/13_cpufreq-2.6.9-rc2-debug_infrastructure

Add a unified cpufreq debug infrastructure.

cpufreq_debug_printk will print messages if

a) debugging for the specified part is activated (add 
	1 for core, 
	2 for drivers, 
	4 for governors 
   and pass value as
	cpufreq.debug=<value> 
   on the kernel command line). 

b) and either
	b1) printk_ratelimit() allows it to be printed,
	b2) the user disables ratelimit'ing by passing
		cpufreq.debug_ratelimit=0
	    on the kernel command line, _or_
	b3) during driver initialization [unless a different
	    driver has been initialized successfully] and
	    unloading, and whenever a new policy is set.

	    The last point may cause for numerous messages
	    if an userspace-based dynamic governor is used
	    which mis-uses the policy interface to set specific
	    frequencies. Oh, the ACPI processor.c interface
	    to the file "performance" uses the same trick,
	    but that interface is marked deprecated as well,
	    so I don't care. And debugging isn't activated
	    normally, you know...

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/14_cpufreq-2.6.9-rc2-debug-speedstep-lib

Use the unified cpufreq debug infrastructure in the speedstep library.
Modified existing dprintks and added a few which might be / have been
of interest.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/15_cpufreq-2.6.9-rc2-debug-speedstep-smi

Use the unified cpufreq debug infrastructure in the speedstep-smi driver.
Modified existing dprintks and added a few which might be / have been
of interest.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/16_cpufreq-2.6.9-rc2-debug-speedstep-ich

Use the unified cpufreq debug infrastructure in the speedstep-ich driver.
Modified existing dprintks and added a few which might be / have been
of interest.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/17_cpufreq-2.6.9-rc2-debug-speedstep-centrino

Use the unified cpufreq debug infrastructure in the speedstep-centrino
driver. Modified existing dprintks and added a few which might be / have 
been of interest, and cleared some whitespace/tab confusion. The big
comment regarding which frequency to pass as "old" value wasn't up to
date any longer in two regards: the driver's behaviour had changed, and
the core is know able to handle such things... anyways, the comment could
be removed.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/18_cpufreq-2.6.9-rc2-debug-p4-clockmod

Use the unified cpufreq debug infrastructure in the p4-clockmod driver.
Modified existing dprintks and added a few which might be / have been
of interest.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/19_cpufreq-2.6.9-rc2-debug-longrun

Use the unified cpufreq debug infrastructure in the longrun driver,
and add some dprintks which might be / have been of interest.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/20_cpufreq-2.6.9-rc2-debug-powernow-k8

Use the unified cpufreq debug infrastructure in the powernow-k8 driver.
Modified existing dprintks.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/21_cpufreq-2.6.9-rc2-debug-powernow-k7

Use the unified cpufreq debug infrastructure in the powernow-k7 driver.
Modified existing dprintks, and removed the driver-only debug module
parameter.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/22_cpufreq-2.6.9-rc2-debug-longhaul

Use the unified cpufreq debug infrastructure in the longhaul driver.
Modified existing dprintks, and removed the driver-only debug module
parameter.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/23_cpufreq-2.6.9-rc2-debug-gx-suspmod

Use the unified cpufreq debug infrastructure in the gx-suspmod driver.
Modified existing dprintks.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/24_cpufreq-2.6.9-rc2-debug-acpi-cpufreq

Use the unified cpufreq debug infrastructure in the acpi-cpufreq driver,
and convert the driver's ACPI debug messages to cpufreq debug messages.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/25_cpufreq-2.6.9-rc2-debug-performance-and-powersave

Add (one each) dprintk for the performance and powersave cpufreq governors.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/26_cpufreq-2.6.9-rc2-debug-userspace

Add a few dprintks for the userspace cpufreq governor.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/27_cpufreq-2.6.9-rc2-debug-freq-table

Add a few useful dprintks in the frequency table helpers.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/28_cpufreq-2.6.9-rc2-debug-core

Add a few useful dprintks to the cpufreq core

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/29_cpufreq-2.6.9-rc2-export-affected_cpus

Show the CPUs which can only change frequencies at the same time
in a sysfs file named "affected_cpus". The usefulness of such a file
was first noted by Zwane Mwaikambo.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/30_cpufreq-2.6.9-rc2-powernow-k7-mobile-vid-table-is-only-needed-in-case-of-debug

module_vid_table is only used if DEBUG isn't set, so put #ifdefs around it.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/31_cpufreq-2.6.9-rc2-longhaul-print-speed-only-needed-in-case-of-debug

print_speed and speedbuffer are only used if DEBUG isn't set, so put 
#ifdefs around them.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/32_cpufreq-2.6.9-rc2-core-sysfs--use__ATTR

Use __ATTR in cpufreq.c attribute definitions. Fixes the lack
of MODULE_OWNER setting [can't cause problems yet because cpufreq can only
be built into the kernel], and allows for code recuction.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/33_cpufreq-2.6.9-rc2-userspace-sysfs-refcnt

Set .owner in cpufreq_userspace.c sysfs attribute definition.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/34_cpufreq-2.6.9-rc2-ondemand-sysfs-use__ATTR

Use __ATTR in cpufreq_ondemand.c attribute definitions. Fixes the lack
of MODULE_OWNER setting, and allows for code recuction.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/35_cpufreq-2.6.9-rc2-freq_table-sysfs-refcnt

Set .owner in freq_table's sysfs definition.

Signed-off-by: Dominik Brodowski <linux@brodo.de>


http://www.brodo.de/patches/2004-10-06/36_cpufreq-2.6.9-rc2-ondemand-return-EINVAL-on-errors

Return -EINVAL instead of a non-error-value if the user echo'es something
bad into attributes generated by the ondemand cpufreq governor.

Signed-off-by: Dominik Brodowski <linux@brodo.de>
