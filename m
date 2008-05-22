From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH] cpufreq: clarify license of freq_table.c
Date: Thu, 22 May 2008 08:52:05 +0200
Message-ID: <20080522065205.GA1931@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

Dave,

please consider applying this patch.

Thanks and best wishes,
	Dominik

[PATCH] cpufreq: clarify license of freq_table.c

A license statement next to the copyright statement was missing.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index ae6cd60..b64c6bc 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -2,6 +2,11 @@
  * linux/drivers/cpufreq/freq_table.c
  *
  * Copyright (C) 2002 - 2003 Dominik Brodowski
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
  */
 
 #include <linux/kernel.h>
