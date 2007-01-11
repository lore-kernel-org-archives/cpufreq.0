From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] CPU_FREQ_TABLE shouldn't be a def_tristate
Date: Thu, 11 Jan 2007 14:48:48 +0100
Message-ID: <20070111134848.GB20027@stusta.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030444AbXAKNsp@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

CPU_FREQ_TABLE enables helper code and gets select'ed when it's 
required.

Building it as a module when it's not required doesn't seem to make much 
sense.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.20-rc3-mm1/drivers/cpufreq/Kconfig.old	2007-01-11 07:56:13.000000000 +0100
+++ linux-2.6.20-rc3-mm1/drivers/cpufreq/Kconfig	2007-01-11 07:56:25.000000000 +0100
@@ -16,7 +16,7 @@
 if CPU_FREQ
 
 config CPU_FREQ_TABLE
-       def_tristate m
+       tristate
 
 config CPU_FREQ_DEBUG
 	bool "Enable CPUfreq debugging"
