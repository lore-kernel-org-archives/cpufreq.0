From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH/RFC v2 0/2] CPUFreq for kzm9g
Date: Mon, 25 Feb 2013 18:16:23 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1302251644010.3030@axis700.grange>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sh@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

In v2 of this patch-set I dropped patches 1 and 3, because #1 is a bug-fix 
and can go in separately, #3 is more of a debugging help, than a real 
patch for mainlining. Of the remaining 2 patches the main difference to v1 
is the omission of the PLL0 manipulation. More is explained in respective 
patches.

Guennadi Liakhovetski (2):
  ARM: shmobile: sh73a0: add support for adjusting CPU frequency
  ARM: shmobile: kzm9g-reference: add CPUFreq support

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
