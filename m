From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH]  xen/acpi-processor: C and P-state driver that uploads said data to hypervisor. [v7]
Date: Sat, 10 Mar 2012 11:04:59 -0500
Message-ID: <1331395500-28033-1-git-send-email-konrad.wilk@oracle.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JBeulich@suse.com, linux-kernel@vger.kernel.org, xen-devel@lists.xensource.com, davej@redhat.com, cpufreq@vger.kernel.org
Cc: mike.mcclurg@citrix.com, ke.yu@intel.com, kevin.tian@intel.com

The problem this patch is trying to solve is to provide ACPI power management
information to the hypervisor from the initial domain. The hypervisor lacks the
ACPI DSDT parser so it can't get that data without some help - and the initial
domain can provide that. One approach (https://lkml.org/lkml/2011/11/30/245)
augments the ACPI code to call an external PM code - but there were no comments
about it so I decided to see if another approach could solve it.

It also solves the other problem of CPUfreq scaling drivers running in
the initial domain, changing frequencies without consulting the hypervisor for
the appropiate load information. This means that both the hypervisor and the
initial domain might be changing the P-states at the same time.

This module (xen-acpi-processor)  collects the information the same way that
the cpufreq drivers would utilize ACPI processor code and save everything in
the 'struct acpi_processor' and then uploads it to the hypervisor.

The driver can be either an module or compiled in. If compiled in, it will
launch itself before the CPUfreq scaling drivers to inhibit them. If as a module
then further work is needed in the init script to allow this driver to be loaded
before powernow-k8 or acpi-cpufreq.
