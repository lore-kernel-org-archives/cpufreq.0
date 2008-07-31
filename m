From: Mark Langsdorf <mark.langsdorf@amd.com>
Subject: [PATCH][1/2] 2.6.26 whitespace fix for powernow-k8
Date: Thu, 31 Jul 2008 12:39:05 -0500
Message-ID: <200807311239.05873.mark.langsdorf@amd.com>
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
To: cpufreq@lists.linux.org.uk

Trivial whitespace fix for powernow-k8.

-Mark Langsdorf
Operating System Research Center
AMD

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

diff -r 7a06c648a279 arch/x86/kernel/cpu/cpufreq/powernow-k8.c
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	Fri Jul 25 11:08:14 2008 -0500
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	Fri Jul 25 14:45:18 2008 -0500
@@ -66,7 +66,6 @@ static u32 find_freq_from_fid(u32 fid)
 	return 800 + (fid * 100);
 }
 
-
 /* Return a frequency in KHz, given an input fid */
 static u32 find_khz_freq_from_fid(u32 fid)
 {
@@ -77,7 +76,6 @@ static u32 find_khz_freq_from_pstate(str
 {
 	return data[pstate].frequency;
 }
-
 
 /* Return the vco fid for an input fid
  *
@@ -165,7 +163,6 @@ static void fidvid_msr_init(void)
 	dprintk("cpu%d, init lo 0x%x, hi 0x%x\n", smp_processor_id(), lo, hi);
 	wrmsr(MSR_FIDVID_CTL, lo, hi);
 }
-
 
 /* write the new fid value along with the other control fields to the msr */
 static int write_new_fid(struct powernow_k8_data *data, u32 fid)
