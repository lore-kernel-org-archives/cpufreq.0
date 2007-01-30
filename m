From: "Joachim Deguara" <joachim.deguara@amd.com>
Subject: [PATCH] fix cpuinfo_cur_freq for CPU_HW_PSTATE
Date: Tue, 30 Jan 2007 16:53:54 +0100
Message-ID: <45BF6A12.9090801@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

This fixes the cpuinfo_cur_freq value by using the correct
find_khz_freq_from_fiddid() when the CPU uses hardware p-states.

Signed-Off-by: Joachim Deguara <joachim.deguara@amd.com>

--- arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig	2007-01-30
16:23:39.000000000 +0100
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2007-01-30
16:26:44.000000000 +0100
@@ -1289,7 +1289,11 @@ static unsigned int powernowk8_get (unsi
 	if (query_current_values_with_pending_wait(data))
 		goto out;

-	khz = find_khz_freq_from_fid(data->currfid);
+	if (cpu_family == CPU_HW_PSTATE)
+		khz = find_khz_freq_from_fiddid(data->currfid, data->currdid);
+	else
+		khz = find_khz_freq_from_fid(data->currfid);
+	

 out:
 	set_cpus_allowed(current, oldmask);
