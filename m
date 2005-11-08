From: "Gabriel A. Devenyi" <ace@staticwave.ca>
Subject: [RESEND] [PATCH] arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
Date: Tue, 08 Nov 2005 07:38:35 -0500
Message-ID: <43709C4B.5010607@staticwave.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S965008AbVKHMik@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Thanks to LinuxICC (http://linuxicc.sf.net), a comparison of a u32 less than 0 was found, this patch changes the variable to a signed int so that comparison is meaningful.

This patch applies to linus' git tree as of 02.11.2005

Signed-off-by: Gabriel A. Devenyi <ace@staticwave.ca>

--
diff --git a/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c b/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
index 04a4053..039297b 100644
--- a/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
+++ b/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
@@ -177,9 +177,9 @@ static unsigned int nforce2_fsb_read(int
   */
  static int nforce2_set_fsb(unsigned int fsb)
  {
-	u32 pll, temp = 0;
+	u32 temp = 0;
  	unsigned int tfsb;
-	int diff;
+	int diff, pll = 0;

  	if ((fsb > max_fsb) || (fsb < NFORCE2_MIN_FSB)) {
  		printk(KERN_ERR "cpufreq: FSB %d is out of range!\n", fsb);


-- 
Gabriel A. Devenyi
ace@staticwave.ca
