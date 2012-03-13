From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH] mechanism to disable built in cpu frequency drivers/governors. (v1)
Date: Tue, 13 Mar 2012 19:18:38 -0400
Message-ID: <1331680720-18268-1-git-send-email-konrad.wilk@oracle.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, JBeulich@suse.com

The purpose of these patches is two-fold:
 1) Remove weird performance issues encountered in the field where the
    Linux kernel cpufreq scaling drivers would change the P-states while the
    Xen hypervisor would do the same.
 2) Provide a runtime knob from within the kernel to disable the cpu frequency
    API (akin to the behavior of "#CONFIG_CPU_CPUFREQ is not set").

The patches are based on the mechanism that Len Brown came up for the cpuidle
drivers - where there is a disable_cpuidle() call. His patches also provided
a module parameter - but I wasn't sure whether that is something you would want.
(for reference, Len's patch is d91ee5863b71e8c90eaf6035bff3078a85e2e7b5)

The other way of disabling the cpufreq scaling drivers from being invoked
is by thwarting the cpufreq drivers from loading by influencing their startup
checks.  For powernow-k8 that is easy - disallow the RDMSR (and that is currently
happening). For acpi-cpufreq I am not sure what could be done - the calls it
makes are to the ACPI libraries which we need for other uses.

Another solution I thought off was to provide a cpufreq governor that would
be a nop, and hence end up not calling the cpufreq scaling drivers. But that
just seems heavy-handed and I am not sure how the decision of when to load it
(and set it) would be done.

 arch/x86/xen/setup.c      |    1 +
 drivers/cpufreq/cpufreq.c |   24 ++++++++++++++++++++++++
 include/linux/cpufreq.h   |    2 ++
 3 files changed, 27 insertions(+), 0 deletions(-)
