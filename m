From: linux@brodo.de
Subject: [PATCH] cpufreq: remove $Id$ tags, update filenames
Date: Tue, 9 Sep 2003 22:34:56 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030909203456.GA17910@brodo.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2003-09-09 21:34:04.786193976 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2003-09-09 22:33:52.930713096 +0200
@@ -1,11 +1,9 @@
 /*
- *  linux/kernel/cpufreq.c
+ *  linux/drivers/cpufreq/cpufreq.c
  *
  *  Copyright (C) 2001 Russell King
  *            (C) 2002 - 2003 Dominik Brodowski <linux@brodo.de>
  *
- *  $Id: cpufreq.c,v 1.59 2003/01/20 17:31:48 db Exp $
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2003-09-09 21:34:04.786193976 +0200
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2003-09-09 22:33:52.931712944 +0200
@@ -1,11 +1,9 @@
 /*
- *  drivers/cpufreq/userspace.c
+ *  linux/drivers/cpufreq/cpufreq_userspace.c
  *
  *  Copyright (C)  2001 Russell King
  *            (C)  2002 - 2003 Dominik Brodowski <linux@brodo.de>
  *
- * $Id:$
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
