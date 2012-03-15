From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Lost fixes?
Date: Thu, 15 Mar 2012 10:28:45 +0000
Message-ID: <20120315102845.GB16389@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:Content-Type:MIME-Version:Message-ID:Subject:To:From:Date; bh=n7z5ZX4eoyjJOyRT0T1qtDCwrZJz9dGnNtHJgBfo75g=;
	b=AK5bs79AR5FV75vAP5t34pvIjsCmh1wsmqKk8OA05B38jyANS/EC+5onbaFJltnM+2KSW6oOBy37hv4t7I950koE61B+SGz99YVIPy1y8RQjBTYn59AuI+tGIVnKBaosrJepN14NfjwYdyDQ2tlMkNGPUwuxNhuTCP8GlBXu5dc=;
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Samuel Ortiz <sameo@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>

These fixes are a collection from other people which resolve various
issues found with the new kautobuilder.  They're now a month old, and
as far as I can see, have not been merged into Linus' tree.

What's the status of them, and when are they going to be merged?

Thanks.

 arch/arm/mach-omap2/Makefile                 |    5 +----
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c |    2 +-
 arch/arm/mach-omap2/clock.c                  |    2 +-
 arch/arm/mach-omap2/clock.h                  |    2 +-
 arch/arm/mach-omap2/smartreflex.c            |    2 +-
 arch/arm/plat-omap/clock.c                   |    2 +-
 arch/arm/plat-omap/dma.c                     |    2 +-
 arch/arm/plat-omap/include/plat/clock.h      |    4 ++--
 drivers/cpufreq/Kconfig.arm                  |    6 ++++++
 drivers/cpufreq/Makefile                     |    2 +-
 drivers/mfd/da9052-spi.c                     |    4 ++--
 kernel/irq/chip.c                            |    3 +--
 12 files changed, 19 insertions(+), 17 deletions(-)

