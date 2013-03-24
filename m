From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH v4 0/3] CPUFreq for sh73a0 / kzm9g, using cpufreq-cpu0
Date: Sun, 24 Mar 2013 20:27:32 +0100
Message-ID: <1364153255-20664-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sh@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

The cpufreq-cpu0 CPUFreq driver has been recently been converted to a 
platform driver, which made v3 of this patch set non-functional. This 
version performs the necessary update and also modifies kzm9g-reference 
AS3711 support to be suitable for the mainline by removing LCDC hacks.

Guennadi Liakhovetski (3):
  ARM: shmobile: sh73a0: add support for adjusting CPU frequency
  ARM: shmobile: add framebuffer and backlight support to
    kzm9g-reference
  ARM: shmobile: kzm9g-reference: add CPUFreq support

 arch/arm/boot/dts/sh73a0-kzm9g-reference.dts |   86 +++++++++++++++++++++++
 arch/arm/mach-shmobile/Kconfig               |    2 +
 arch/arm/mach-shmobile/clock-sh73a0.c        |   95 +++++++++++++++++++++++++-
 arch/arm/mach-shmobile/setup-sh73a0.c        |    5 ++
 4 files changed, 186 insertions(+), 2 deletions(-)

-- 
1.7.2.5

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
