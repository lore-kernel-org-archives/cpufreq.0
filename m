From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2.6] remove powernow-k8 warning
Date: Fri, 20 Feb 2004 14:24:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040220132449.GA7782@dominikbrodowski.de>
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
Cc: paul.devriendt@amd.com

It's been tested now -- thanks to Redeeman!

http://lkml.org/lkml/2004/2/19/192

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-18 14:59:24.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-19 22:00:54.187228808 +0100
@@ -34,10 +34,6 @@
 #define VERSION "version 1.00.08a"
 #include "powernow-k8.h"
 
-#ifdef CONFIG_PREEMPT
-#warning this driver has not been tested on a preempt system
-#endif
-
 static u32 vstable;	/* voltage stabalization time, from PSB, units 20 us */
 static u32 plllock;	/* pll lock time, from PSB, units 1 us */
 static u32 numps;	/* number of p-states, from PSB */
