From: joe@perches.com
Subject: [PATCH] [135/2many] MAINTAINERS - CPU FREQUENCY DRIVERS
Date: Sun, 12 Aug 2007 23:25:38 -0700
Message-ID: <46bff962.fBD4aAz2pZsNqDAn%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S941724AbXHMHhq@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index a51b89e..60e6fb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1309,6 +1309,9 @@ L:	cpufreq@lists.linux.org.uk
 W:	http://www.codemonkey.org.uk/projects/cpufreq/
 T:	git kernel.org/pub/scm/linux/kernel/git/davej/cpufreq.git
 S:	Maintained
+F:	arch/i386/kernel/cpu/cpufreq/
+F:	drivers/cpufreq/
+F:	include/linux/cpufreq.h
 
 CPUID/MSR DRIVER
 P:	H. Peter Anvin
