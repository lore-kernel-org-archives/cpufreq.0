From: Holger Macht <hmacht@suse.de>
Subject: [PATCH] Use sampling_rate_min/max if value beyond limit is written
	to ondemand/sampling_rate
Date: Tue, 30 May 2006 20:14:17 +0200
Message-ID: <20060530181417.GB2374@linux-ersb>
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

If a value lower then sampling_rate_min or greater than sampling_rate_max
is written to ondemand/sampling_rate, the request ist ignored and a write
error is thrown. Patch takes sampling_rate_min/max into account if a value
beyond the limit is written.

This leads to consistent behaviour between ondemand/sampling_rate and the
userspace governor scaling_setspeed interface, where one can write a
frequency lower than scaling_min_freq and scaling_min_freq is actually
used instead of the setting being ignored.

Signed-off-by: Holger Macht <hmacht@suse.de>
---
 cpufreq_ondemand.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--- linux-2.6.17-rc5.orig/drivers/cpufreq/cpufreq_ondemand.c	2006-05-30 14:11:38.000000000 +0200
+++ linux-2.6.17-rc5/drivers/cpufreq/cpufreq_ondemand.c	2006-05-27 17:58:09.000000000 +0200
@@ -155,11 +155,16 @@ static ssize_t store_sampling_rate(struc
 	ret = sscanf (buf, "%u", &input);
 
 	mutex_lock(&dbs_mutex);
-	if (ret != 1 || input > MAX_SAMPLING_RATE || input < MIN_SAMPLING_RATE) {
+	if (ret != 1) {
 		mutex_unlock(&dbs_mutex);
 		return -EINVAL;
 	}
 
+	if (input > MAX_SAMPLING_RATE)
+		input = MAX_SAMPLING_RATE;
+	else if (input < MIN_SAMPLING_RATE)
+		input = MIN_SAMPLING_RATE;
+
 	dbs_tuners_ins.sampling_rate = input;
 	mutex_unlock(&dbs_mutex);
