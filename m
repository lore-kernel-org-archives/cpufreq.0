From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: [GIT PULL] More power management updates for 2.6.39
Date: Fri, 25 Mar 2011 23:51:54 +0100
Message-ID: <201103252351.54825.rjw@sisk.pl>
References: <201103100131.58206.rjw@sisk.pl> <20110322103258.GC4448@elte.hu> <201103222133.14054.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201103222133.14054.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@elte.hu>, Linux PM mailing list <linux-pm@lists.linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>, Kay Sievers <kay.sievers@suse.de>, Jesse Barnes <jbarnes@virtuousgeek.org>, "H. Peter Anvin" <hpa@zytor.com>, mingo@redhat.com, tglx@linutronix.de, Dave Jones <davej@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, Avi Kivity <avi@redhat.com>, David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org, iommu@lists.linux-foundation.org, cpufreq@vger.kernel.org

Hi Linus,

Please pull additional power management updates for 2.6.39 from:

git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-2.6.git syscore

They make subsystems that x86 depends on use struct syscore_ops objects instead
of sysdevs for "core" power management, which reduces the code size and kernel
memory footprint a bit and sipmlifies the "core" suspend/resume and shutdown
code paths.


 arch/x86/Kconfig                 |    1 +
 arch/x86/kernel/amd_iommu_init.c |   26 ++--------
 arch/x86/kernel/apic/apic.c      |   33 ++++---------
 arch/x86/kernel/apic/io_apic.c   |   97 ++++++++++++++++++--------------------
 arch/x86/kernel/cpu/mcheck/mce.c |   21 +++++----
 arch/x86/kernel/cpu/mtrr/main.c  |   10 ++--
 arch/x86/kernel/i8237.c          |   30 +++---------
 arch/x86/kernel/i8259.c          |   33 ++++---------
 arch/x86/kernel/microcode_core.c |   34 ++++++--------
 arch/x86/kernel/pci-gart_64.c    |   32 +++----------
 arch/x86/oprofile/nmi_int.c      |   44 +++++------------
 drivers/base/Kconfig             |    7 +++
 drivers/base/sys.c               |    3 +-
 drivers/cpufreq/cpufreq.c        |   66 ++++++++++----------------
 drivers/pci/intel-iommu.c        |   38 ++++-----------
 include/linux/device.h           |    4 ++
 include/linux/pm.h               |   10 +++-
 include/linux/sysdev.h           |    7 ++-
 kernel/time/timekeeping.c        |   27 +++-------
 virt/kvm/kvm_main.c              |   34 +++----------
 20 files changed, 206 insertions(+), 351 deletions(-)

---------------

Rafael J. Wysocki (6):
      x86: Use syscore_ops instead of sysdev classes and sysdevs
      timekeeping: Use syscore_ops instead of sysdev class and sysdev
      PCI / Intel IOMMU: Use syscore_ops instead of sysdev class and sysdev
      KVM: Use syscore_ops instead of sysdev class and sysdev
      cpufreq: Use syscore_ops for boot CPU suspend/resume (v2)
      Introduce ARCH_NO_SYSDEV_OPS config option (v2)

