From: Sebastian Witt <hasw@hasw.net>
Subject: [PATCH] cpufreq-nforce2 divider
Date: Sun, 04 Jun 2006 19:42:16 +0200
Message-ID: <44831B78.6050407@hasw.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Patch against 2.6.16. Sets minimum PLL divider to 2. No negative impact when 
tested with two nForce2 based boards. (Updates also the (C) year)

Signed-off-by: Sebastian Witt <se.witt <at> gmx net>
---

--- linux-2.6.16-gentoo-r7.orig/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c 
2006-06-04 19:32:29.000000000 +0200
+++ linux-2.6.16-gentoo-r7/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c 
2006-06-04 19:32:42.000000000 +0200                     @@ -1,5 +1,5 @@
  /*
- * (C) 2004  Sebastian Witt <se.witt@gmx.net>
+ * (C) 2004-2006  Sebastian Witt <se.witt@gmx.net>
   *
   *  Licensed under the terms of the GNU GPL License version 2.
   *  Based upon reverse engineered information
@@ -90,7 +90,7 @@

         /* Try to calculate multiplier and divider up to 4 times */
         while (((mul == 0) || (div == 0)) && (tried <= 3)) {
-               for (xdiv = 1; xdiv <= 0x80; xdiv++)
+               for (xdiv = 2; xdiv <= 0x80; xdiv++)
                         for (xmul = 1; xmul <= 0xfe; xmul++)
                                 if (nforce2_calc_fsb(NFORCE2_PLL(xmul, xdiv)) ==
                                     fsb + tried) {
