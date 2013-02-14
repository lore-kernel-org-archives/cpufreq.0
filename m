From: dirk.brandewie@gmail.com
Subject: [PATCH] cpufreq/intel_pstate: Add kernel command line option disable intel_pstate.
Date: Thu, 14 Feb 2013 10:38:52 -0800
Message-ID: <1360867132-13004-1-git-send-email-dirk.brandewie@gmail.com>
References: <6075901.uWCJMxDDFf@vostro.rjw.lan>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=3an/omnArT4Nj+uk9lhTHdHf/VXJNR6KV79RCrbWPBo=;
        b=af1P/SyhOUdl1B6fIM/+u/WYUgiU6MbVeTq+O4x5dt5XDJTewOio+f/kN0usGRyaBq
         B3AII3XP92QQQpdD7Ox9/SgnzAF+oHqIEyz9sYgI580U2MaT163Vea5v+G3aRJnt1kc7
         2xsoqQB+55wByLUBKw2jWGrlfDFaLQBcXEnbmxyNX1MLiNWYaKQunCcPFaFfSNhlpByZ
         q+JF3NGpeZw04IVWZG9U1DhJ8S/xqH/fv1g2C0E2U8dhzN+OnThgMonY60pN0HWyBmQB
         ppZo/yJ3ZskJjhypdAXnlQBalq9E9MkGmY7TQRPAOyrm0k8kgIhmolnPh6u5ULDcVrJf
         xRjg==
In-Reply-To: <6075901.uWCJMxDDFf@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

When intel_pstate is configured into the kernel it will become the
perferred scaling driver for processors that is supports.  Allow the
user to override this by adding:
   intel_pstate=disable
on the kernel command line.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 Documentation/kernel-parameters.txt |    5 +++++
 drivers/cpufreq/intel_pstate.c      |   16 ++++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index 6c72381..41c5d9e 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -1131,6 +1131,11 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
 			0	disables intel_idle and fall back on acpi_idle.
 			1 to 6	specify maximum depth of C-state.
 
+	intel_pstate=  [X86]
+		       disable
+		         Do not enable intel_pstate as the default
+		         scaling driver for the supported processors
+
 	intremap=	[X86-64, Intel-IOMMU]
 			on	enable Interrupt Remapping (default)
 			off	disable Interrupt Remapping
diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index e879963..9cbb733 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -773,11 +773,16 @@ static void intel_pstate_exit(void)
 }
 module_exit(intel_pstate_exit);
 
+static int no_load;
+
 static int __init intel_pstate_init(void)
 {
 	int rc = 0;
 	const struct x86_cpu_id *id;
 
+	if (no_load)
+		return -ENODEV;
+
 	id = x86_match_cpu(intel_pstate_cpu_ids);
 	if (!id)
 		return -ENODEV;
@@ -802,6 +807,17 @@ out:
 }
 device_initcall(intel_pstate_init);
 
+static int __init intel_pstate_setup(char *str)
+{
+	if (!str)
+		return -EINVAL;
+
+	if (!strcmp(str, "disable"))
+		no_load = 1;
+	return 0;
+}
+early_param("intel_pstate", intel_pstate_setup);
+
 MODULE_AUTHOR("Dirk Brandewie <dirk.j.brandewie@intel.com>");
 MODULE_DESCRIPTION("'intel_pstate' - P state driver Intel Core processors");
 MODULE_LICENSE("GPL");
-- 
1.7.7.6

