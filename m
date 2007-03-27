From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH][retry] Report the number of processors in PowerNow-k8
 correctly
Date: Tue, 27 Mar 2007 14:18:58 -0500
Message-ID: <46096E22.7030103@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

The PowerNow! driver for Opteron reports the number of cores
in the system, but claims to report the number of processors.
Fix this minor cosmetic bug.

Signed-Off-By: Bhavana Nagendra <bhavana.nagendra@amd.com>
Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>

--- arch/i386/kernel/cpu/cpufreq/powernow-k8.c.old	2007-03-20 
14:24:41.000000000 -0500
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2007-03-20 
14:32:34.000000000 -0500
@@ -661,7 +661,8 @@ static int fill_powernow_table(struct po

  	dprintk("cfid 0x%x, cvid 0x%x\n", data->currfid, data->currvid);
  	data->powernow_table = powernow_table;
-	print_basics(data);
+	if (first_cpu(cpu_core_map[data->cpu]) == data->cpu)
+		print_basics(data);

  	for (j = 0; j < data->numps; j++)
  		if ((pst[j].fid==data->currfid) && (pst[j].vid==data->currvid))
