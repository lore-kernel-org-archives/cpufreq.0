From: "Jayachandran C." <jchandra@digeo.com>
Subject: [PATCH] cpufreq: Fix issue found by coverity in
	drivers/cpufreq/cpufreq_stats.c
Date: Thu, 27 Oct 2005 15:37:02 -0700
Message-ID: <20051027223702.GC20378@random.pao.digeo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk
Cc: Andrew Morton <akpm@osdl.org>, davej@codemonkey.org.uk

This fixes an issue found in drivers/cpufreq/cpufreq_stats.c by Coverity. Please
review as I'm not sure if -EINVAL is the correct value to return at this point.

Error reported: 
CID: 2642
Checker: NULL_RETURNS (help)
File: /export2/p4-coverity/mc2/linux26/drivers/cpufreq/cpufreq_stats.c
Function: cpufreq_stats_create_table
Description: Dereferencing NULL value "data"

Patch description:
 The return of cpufreq_cpu_get can be NULL, check return code and return
 -EINVAL if it is NULL. 

Signed-off-by: Jayachandran C. <c.jayachandran at gmail.com>

---

 cpufreq_stats.c |    6 ++++++
 1 files changed, 6 insertions(+)

--- linux-2.6.14-rc4-git2.clean/drivers/cpufreq/cpufreq_stats.c	2005-08-28 16:41:01.000000000 -0700
+++ linux-2.6.14-rc4-git2/drivers/cpufreq/cpufreq_stats.c	2005-10-25 18:47:06.639018548 -0700
@@ -197,6 +197,11 @@
 	memset(stat, 0, sizeof (struct cpufreq_stats));
 
 	data = cpufreq_cpu_get(cpu);
+	if (data == NULL) {
+		ret = -EINVAL;
+		goto error_get_fail;
+	}
+
 	if ((ret = sysfs_create_group(&data->kobj, &stats_attr_group)))
 		goto error_out;
 
@@ -244,6 +249,7 @@
 	return 0;
 error_out:
 	cpufreq_cpu_put(data);
+error_get_fail:
 	kfree(stat);
 	cpufreq_stats_table[cpu] = NULL;
 	return ret;
