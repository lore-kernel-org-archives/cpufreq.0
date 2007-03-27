From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH][retry] Report the number of processors in PowerNow-k8
 correctly [2/2]
Date: Tue, 27 Mar 2007 14:23:11 -0500
Message-ID: <46096F1F.8030201@amd.com>
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

--- linux-2.6.18.x86_64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig	2007-03-22 16:13:04.630175768 -0500
+++ linux-2.6.18.x86_64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2007-03-22 16:19:40.153047152 -0500
@@ -840,7 +840,8 @@ static int powernow_k8_cpu_init_acpi(str
 
 	/* fill in data */
 	data->numps = data->acpi_data.state_count;
-	print_basics(data);
+	if (first_cpu(cpu_core_map[data->cpu]) == data->cpu)
+		print_basics(data);
 	powernow_k8_acpi_pst_values(data, 0);
 
 	/* notify BIOS that we exist */
