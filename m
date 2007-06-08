From: "Joachim Deguara" <joachim.deguara@amd.com>
Subject: [PATCH] powernow-k8 typos
Date: Fri, 8 Jun 2007 11:33:08 +0200
Message-ID: <200706081133.08650.joachim.deguara@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

typos fixed

Signed-off-by: Joachim.Deguara <joachim.deguara@amd.com>
Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>

Index: 2.6-vanilla/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
===================================================================
--- 2.6-vanilla.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
+++ 2.6-vanilla/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
@@ -599,7 +599,7 @@ static void print_basics(struct powernow
 	for (j = 0; j < data->numps; j++) {
 		if (data->powernow_table[j].frequency != CPUFREQ_ENTRY_INVALID) {
 			if (cpu_family == CPU_HW_PSTATE) {
-			printk(KERN_INFO PFX "   %d : fid 0x%x gid 0x%x (%d MHz)\n", j, 
(data->powernow_table[j].index & 0xff00) >> 8,
+			printk(KERN_INFO PFX "   %d : fid 0x%x did 0x%x (%d MHz)\n", j, 
(data->powernow_table[j].index & 0xff00) >> 8,
 				(data->powernow_table[j].index & 0xff0000) >> 16,
 				data->powernow_table[j].frequency/1000);
 			} else {
@@ -1084,7 +1084,7 @@ static int powernowk8_target(struct cpuf
 
 	if (cpu_family == CPU_HW_PSTATE)
 		dprintk("targ: curr fid 0x%x, did 0x%x\n",
-			data->currfid, data->currvid);
+			data->currfid, data->currdid);
 	else {
 		dprintk("targ: curr fid 0x%x, vid 0x%x\n",
 		data->currfid, data->currvid);
