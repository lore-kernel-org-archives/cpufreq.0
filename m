From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Fix for longrun.c for degenerate case
Date: Fri, 07 May 2004 19:06:49 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <409C40B9.6000603@zytor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040202040203070404040904"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk, linux@brodo.de

This is a multi-part message in MIME format.
--------------040202040203070404040904
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I ran into a system the other day which had a Transmeta processor, but 
configured in a degenerate, fixed-frequency configuration.  It crashed 
booting Fedora Core 2 test 3 due to a division by zero in the longrun 
cpufreq driver.  The attached patch fixes this.

	-hpa

--------------040202040203070404040904
Content-Type: text/plain;
 name="linux-2.6.5-longrun.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-2.6.5-longrun.patch"

Index: linux-2.5/arch/i386/kernel/cpu/cpufreq/longrun.c
===================================================================
RCS file: /home/hpa/kernel/bkcvs/linux-2.5/arch/i386/kernel/cpu/cpufreq/longrun.c,v
retrieving revision 1.19
diff -u -r1.19 longrun.c
--- linux-2.5/arch/i386/kernel/cpu/cpufreq/longrun.c	13 Apr 2004 15:52:00 -0000	1.19
+++ linux-2.5/arch/i386/kernel/cpu/cpufreq/longrun.c	6 May 2004 05:32:50 -0000
@@ -46,11 +46,16 @@
 	rdmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
 	msr_lo &= 0x0000007F;
 	msr_hi &= 0x0000007F;
-
-	policy->min = longrun_low_freq + msr_lo * 
-		((longrun_high_freq - longrun_low_freq) / 100);
-	policy->max = longrun_low_freq + msr_hi * 
-		((longrun_high_freq - longrun_low_freq) / 100);
+	
+	if ( longrun_high_freq <= longrun_low_freq ) {
+		/* Assume degenerate Longrun table */
+		policy->min = policy->max = longrun_high_freq;
+	} else {
+		policy->min = longrun_low_freq + msr_lo * 
+			((longrun_high_freq - longrun_low_freq) / 100);
+		policy->max = longrun_low_freq + msr_hi * 
+			((longrun_high_freq - longrun_low_freq) / 100);
+	}
 	policy->cpu = 0;
 }
 
@@ -70,10 +75,15 @@
 	if (!policy)
 		return -EINVAL;
 
-	pctg_lo = (policy->min - longrun_low_freq) / 
-		((longrun_high_freq - longrun_low_freq) / 100);
-	pctg_hi = (policy->max - longrun_low_freq) / 
-		((longrun_high_freq - longrun_low_freq) / 100);
+	if ( longrun_high_freq <= longrun_low_freq ) {
+		/* Assume degenerate Longrun table */
+		pctg_lo = pctg_hi = 100;
+	} else {
+		pctg_lo = (policy->min - longrun_low_freq) / 
+			((longrun_high_freq - longrun_low_freq) / 100);
+		pctg_hi = (policy->max - longrun_low_freq) / 
+			((longrun_high_freq - longrun_low_freq) / 100);
+	}
 
 	if (pctg_hi > 100)
 		pctg_hi = 100;

--------------040202040203070404040904
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------040202040203070404040904--

