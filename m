From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: [PATCH] MAINTAINERS: Add myself as the cpufreq maintainer
Date: Fri, 11 May 2012 21:35:45 +0200
Message-ID: <201205112135.46097.rjw@sisk.pl>
References: <20120504160417.GA421@redhat.com> <201205112116.25257.rjw@sisk.pl> <20120511192420.GA10041@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120511192420.GA10041@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Jones <davej@redhat.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, cpufreq@vger.kernel.org

From: Rafael J. Wysocki <rjw@sisk.pl>

Since cpufreq has no official maintainer at the moment, I'm willing
to maintain it along some other power management core code I've been
maintaining already.

Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
---
 MAINTAINERS |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/MAINTAINERS
===================================================================
--- linux.orig/MAINTAINERS
+++ linux/MAINTAINERS
@@ -1970,7 +1970,9 @@ S:	Maintained
 F:	drivers/net/ethernet/ti/cpmac.c
 
 CPU FREQUENCY DRIVERS
+M:	Rafael J. Wysocki <rjw@sisk.pl>
 L:	cpufreq@vger.kernel.org
+L:	linux-pm@vger.kernel.org
 S:	Maintained
 F:	drivers/cpufreq/
 F:	include/linux/cpufreq.h
