From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] cpufreq: remove CVS keywords
Date: Tue, 20 May 2008 01:03:16 +0300
Message-ID: <20080519220315.GG17716@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1765315AbYESWIA@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

This patch removes CVS keywords that weren't updated for a long time 
from comments.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 arch/x86/kernel/cpu/cpufreq/powernow-k7.h |    1 -
 include/linux/cpufreq.h                   |    3 ---
 2 files changed, 4 deletions(-)

e557db8138882bb0961d6e4b940cd9b59e4dd721 diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k7.h b/arch/x86/kernel/cpu/cpufreq/powernow-k7.h
index f8a63b3..35fb4ea 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k7.h
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k7.h
@@ -1,5 +1,4 @@
 /*
- *  $Id: powernow-k7.h,v 1.2 2003/02/10 18:26:01 davej Exp $
  *  (C) 2003 Dave Jones.
  *
  *  Licensed under the terms of the GNU GPL License version 2.
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index e7e91db..2270ca5 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -4,9 +4,6 @@
  *  Copyright (C) 2001 Russell King
  *            (C) 2002 - 2003 Dominik Brodowski <linux@brodo.de>
  *            
- *
- * $Id: cpufreq.h,v 1.36 2003/01/20 17:31:48 db Exp $
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
