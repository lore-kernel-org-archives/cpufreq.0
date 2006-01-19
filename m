From: Thomas Renninger <mail@renninger.de>
Subject: [PATCH 1/2] PPC frequency change issues
Date: Thu, 19 Jan 2006 19:12:13 +0100
Message-ID: <43CFD67D.4080204@renninger.de>
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
Cc: Dominik Brodowski <linux@dominikbrodowski.de>

Author: Thomas Renninger <trenn@suse.de>

BIOS might change frequency behind our back
when BIOS changes allowed frequencies via _PPC
in this case cpufreq core got out of sync.
-> ask driver for current freq and notify
   governors about a change

 cpufreq.c |   10 ++++++++++
 1 files changed, 10 insertions(+)

Index: linux-2.6.15/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.15.orig/drivers/cpufreq/cpufreq.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/drivers/cpufreq/cpufreq.c	2006-01-19 18:22:55.000000000 +0100
@@ -1402,6 +1402,16 @@
 	policy.policy = data->user_policy.policy;
 	policy.governor = data->user_policy.governor;
 
+	/* BIOS might change freq behind our back 
+	   -> ask driver for current freq and notify
+	      governors about a change
+	*/
+	if (cpufreq_driver->get){
+		policy.cur = cpufreq_driver->get(cpu);
+		if (data->cur != policy.cur)
+			cpufreq_out_of_sync(cpu, data->cur, policy.cur);
+	}
+
 	ret = __cpufreq_set_policy(data, &policy);
 
 	up(&data->lock);
