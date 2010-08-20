From: wateenellende <fpblists@gmail.com>
Subject: patch for longhaul; bm_timeout fix
Date: Fri, 20 Aug 2010 09:55:04 +0200
Message-ID: <4C6E34D8.9010904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=bpiIM63iqW/ixA+gDzWFJSRcfPXQbo9WigooAjCDUGs=;
        b=UxdNNjl66ulMyJndgCrFsozabGS+bxpeBQrgbuQOOSJ+ZQvK0sKcXc66w0X/GJkWAz
         BpU9KgXc3Wi+vjwTS363g5xNQEhc4LEfNwK+YytodQni29D6zn3sxMMH7nuLiSaUoKOt
         d/ut6SGmVh1PQZ8y/Y7RPvywvWyuiQp+qf0Co=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org

Hi all,

Here is a patch that addresses an issue in the longhaul driver, namely 
that the kernel keeps saying:
"longhaul: Warning: Timeout while waiting for idle PCI bus."
during file transfers.

The patch changes a few things:
- the timeout is increased from 1000 to 4000
- bm_timout is now a parameter in sysfs so it can be changed at will

The value of 4000 was determined by having the kernel print how long it 
waited, in my system, 2900 was the largest value ever observed. The 4000 
is just to be conservative, anyway, if needed it can be adjusted through 
sysfs.

This patch is against the ubuntu kernel, I hope it applies cleanly to 
the latest vanilla kernel...

Many thanks to Rafal Bilski for his advice and the sysfs change.
Comments, questions etc. are of course welcome!

Best regards,

Fokko Beekhof



--- linux-2.6.32/arch/x86/kernel/cpu/cpufreq/longhaul.c    2009-12-03 
04:51:21.000000000 +0100
+++ linux-2.6.32-new/arch/x86/kernel/cpu/cpufreq/longhaul.c 
2010-08-05 12:01:10.294330811 +0200
@@ -76,6 +76,7 @@
  static int scale_voltage;
  static int disable_acpi_c3;
  static int revid_errata;
+static u32 bm_timeout = 4000; /* Largest observed value was 2900 in 
tests */

  #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
          "longhaul", msg)
@@ -253,8 +254,8 @@
      struct cpufreq_freqs freqs;
      unsigned long flags;
      unsigned int pic1_mask, pic2_mask;
+    u32 bm_timeout_local = bm_timeout;
      u16 bm_status = 0;
-    u32 bm_timeout = 1000;
      unsigned int dir = 0;

      mults_index = longhaul_table[table_index].index;
@@ -291,9 +292,9 @@
          || ((pr != NULL) && pr->flags.bm_control))) {
          bm_status = inw(acpi_regs_addr);
          bm_status &= 1 << 4;
-        while (bm_status && bm_timeout) {
+        while (bm_status && bm_timeout_local) {
              outw(1 << 4, acpi_regs_addr);
-            bm_timeout--;
+            --bm_timeout_local;
              bm_status = inw(acpi_regs_addr);
              bm_status &= 1 << 4;
          }
@@ -392,9 +393,11 @@
      /* Report true CPU frequency */
      cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);

-    if (!bm_timeout)
+    if (!bm_timeout_local)
          printk(KERN_INFO PFX "Warning: Timeout while waiting for "
                  "idle PCI bus.\n");
+/*    else
+        printk(KERN_INFO PFX "Waited %u ticks", bm_timeout - 
bm_timeout_local); */
  }

  /*
@@ -1020,6 +1023,10 @@
   * such. */
  module_param(revid_errata, int, 0644);
  MODULE_PARM_DESC(revid_errata, "Ignore CPU Revision ID");
+/* Before changing frequency, we neet to wait until the PCI bus becomes 
idle.
+ * This timeout controls how long that waiting period will be at most. */
+module_param(bm_timeout, int, 0644);
+MODULE_PARM_DESC(bm_timeout, "Wait for PCI bus idle timeout");

  MODULE_AUTHOR("Dave Jones <davej@redhat.com>");
  MODULE_DESCRIPTION("Longhaul driver for VIA Cyrix processors.");
