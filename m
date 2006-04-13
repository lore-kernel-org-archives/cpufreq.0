From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] drivers/cpufreq/cpufreq.c: static functions mustn't be exported
Date: Thu, 13 Apr 2006 13:58:02 +0200
Message-ID: <20060413115802.GC8171@stusta.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964893AbWDML6E@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

This patch removes the EXPORT_SYMBOL_GPL of the static function 
cpufreq_parse_governor().

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.17-rc1-mm2-full/drivers/cpufreq/cpufreq.c.old	2006-04-13 10:48:13.000000000 +0200
+++ linux-2.6.17-rc1-mm2-full/drivers/cpufreq/cpufreq.c	2006-04-13 10:48:19.000000000 +0200
@@ -319,7 +319,6 @@
 	}
 	return -EINVAL;
 }
-EXPORT_SYMBOL_GPL(cpufreq_parse_governor);
 
 
 /* drivers/base/cpu.c */
