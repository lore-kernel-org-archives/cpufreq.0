From: Pavel Machek <pavel@ucw.cz>
Subject: Re: powernow-k8 frequency fix
Date: Mon, 23 Feb 2004 20:29:17 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040223192917.GD269@elf.ucw.cz>
References: <20040223165248.GA19487@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040223165248.GA19487@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

Hi!

> Thanks for the patch, but please CC cpufreq@www.linux.org.uk in future.

Oops, sorry.

BTW I'd like to push two following changes. (second hunk is probably
already queued with trivial patch monkey -- someone did test it :-). I
hope that's okay with you.

								Pavel

--- tmp/linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-23 20:25:06.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-23 00:16:04.000000000 +0100
@@ -8,6 +8,8 @@
  *
  *  Based on the powernow-k7.c module written by Dave Jones.
  *  (C) 2003 Dave Jones <davej@codemonkey.ork.uk> on behalf of SuSE Labs
+ *  (C) 2004 Dominik Brodowski <linux@brodo.de>
+ *  (C) 2004 Pavel Machek <pavel@suse.cz>
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
  *
@@ -34,10 +36,6 @@
 #define VERSION "version 1.00.08a"
 #include "powernow-k8.h"
 
-#ifdef CONFIG_PREEMPT
-#warning this driver has not been tested on a preempt system
-#endif
-
 static u32 vstable;	/* voltage stabalization time, from PSB, units 20 us */
 static u32 plllock;	/* pll lock time, from PSB, units 1 us */
 static u32 numps;	/* number of p-states, from PSB */


								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
