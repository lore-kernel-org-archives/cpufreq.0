From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH] powernow-k8: reorder the PST table to match the ACPI table
Date: Fri, 15 Jun 2007 16:51:49 -0500
Message-ID: <200706151651.49772.mark.langsdorf@amd.com>
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

The PST code in powernow-k8 orders pstate entries in the opposite order
from the ACPI code.  This can confuse some userspace tools.  Get both
codes to order pstates in the same way.

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

--- powernow-k8.c.orig	2006-08-28 16:14:46.000000000 -0700
+++ powernow-k8.c	2007-06-14 22:35:30.000000000 -0700
@@ -590,10 +590,14 @@
 		return -ENOMEM;
 	}
 
+	/*
+	 * Reverse order of table entries to match ACPI entry order,
+	 * since all userspace utilities depend on that.
+	 */
 	for (j = 0; j < data->numps; j++) {
-		powernow_table[j].index = pst[j].fid; /* lower 8 bits */
-		powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
-		powernow_table[j].frequency = find_khz_freq_from_fid(pst[j].fid);
+		powernow_table[data->numps - j - 1].index = pst[j].fid; /* lower 8 bits */
+		powernow_table[data->numps - j - 1].index |= (pst[j].vid << 8); /* upper 8 bits */
+		powernow_table[data->numps - j - 1].frequency = find_khz_freq_from_fid(pst[j].fid);
 	}
 	powernow_table[data->numps].frequency = CPUFREQ_TABLE_END;
 	powernow_table[data->numps].index = 0;
