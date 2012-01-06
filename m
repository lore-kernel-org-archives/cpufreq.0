From: Andreas Herrmann <andreas.herrmann3@amd.com>
Subject: [PATCH 3/3] powernow-k8: Update copyright, maintainer and
 documentation information
Date: Fri, 6 Jan 2012 15:59:33 +0100
Message-ID: <20120106145933.GL24451@alberich.amd.com>
References: <20120106145500.GI24451@alberich.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120106145500.GI24451@alberich.amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org


Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
---
 drivers/cpufreq/powernow-k8.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index ad683ec..8f9b2ce 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1,10 +1,11 @@
 /*
- *   (c) 2003-2010 Advanced Micro Devices, Inc.
+ *   (c) 2003-2012 Advanced Micro Devices, Inc.
  *  Your use of this code is subject to the terms and conditions of the
  *  GNU general public license version 2. See "COPYING" or
  *  http://www.gnu.org/licenses/gpl.html
  *
- *  Support : mark.langsdorf@amd.com
+ *  Maintainer:
+ *  Andreas Herrmann <andreas.herrmann3@amd.com>
  *
  *  Based on the powernow-k7.c module written by Dave Jones.
  *  (C) 2003 Dave Jones on behalf of SuSE Labs
@@ -16,12 +17,14 @@
  *  Valuable input gratefully received from Dave Jones, Pavel Machek,
  *  Dominik Brodowski, Jacob Shin, and others.
  *  Originally developed by Paul Devriendt.
- *  Processor information obtained from Chapter 9 (Power and Thermal Management)
- *  of the "BIOS and Kernel Developer's Guide for the AMD Athlon 64 and AMD
- *  Opteron Processors" available for download from www.amd.com
  *
- *  Tables for specific CPUs can be inferred from
- *     http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/30430.pdf
+ *  Processor information obtained from Chapter 9 (Power and Thermal
+ *  Management) of the "BIOS and Kernel Developer's Guide (BKDG) for
+ *  the AMD Athlon 64 and AMD Opteron Processors" and section "2.x
+ *  Power Management" in BKDGs for newer AMD CPU families.
+ *
+ *  Tables for specific CPUs can be inferred from AMD's processor
+ *  power and thermal data sheets, (e.g. 30417.pdf, 30430.pdf, 43375.pdf)
  */
 
 #include <linux/kernel.h>
-- 
1.7.8.1




