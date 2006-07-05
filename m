From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] return error when failing to set minfreq
Date: Wed, 5 Jul 2006 23:12:20 +0200
Message-ID: <20060705211220.GE13602@inferi.kami.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
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
To: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>
Cc: davej@codemonkey.org.uk, Dominik Brodowski <linux@dominikbrodowski.de>


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I'm resending this patch that probably has been lost in deep space.
It got the signed-off by Dominik before:
http://lists.linux.org.uk/mailman/private/cpufreq/2006-June/005916.html
The same message contains a detailed explanation of the problem it
fixes.
Rediffed against 2.6.17-mm6.

Description:
return -EINVAL if trying to increase frequencies starting from
scaling_min_freq and documents the correct ordering of writes.

Signed-off-by: Mattia Dongili <malattia@linux.it>
-- 
mattia
:wq!

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq_error_when_increasing_minfreq_before_maxfreq.diff"

diff --git a/Documentation/cpu-freq/user-guide.txt b/Documentation/cpu-freq/user-guide.txt
index 7fedc00..555c8cf 100644
--- a/Documentation/cpu-freq/user-guide.txt
+++ b/Documentation/cpu-freq/user-guide.txt
@@ -153,10 +153,13 @@ scaling_governor,		and by "echoing" the 
 				that some governors won't load - they only
 				work on some specific architectures or
 				processors.
-scaling_min_freq and 
+scaling_min_freq and
 scaling_max_freq		show the current "policy limits" (in
 				kHz). By echoing new values into these
 				files, you can change these limits.
+				NOTE: when setting a policy you need to
+				first set scaling_max_freq, then
+				scaling_min_freq.
 
 
 If you have selected the "userspace" governor which allows you to
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 1ba4039..deea3e0 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1348,6 +1348,11 @@ static int __cpufreq_set_policy(struct c
 
 	memcpy(&policy->cpuinfo, &data->cpuinfo, sizeof(struct cpufreq_cpuinfo));
 
+	if (policy->min > data->min && policy->min > policy->max) {
+		ret = -EINVAL;
+		goto error_out;
+	}
+
 	/* verify the cpu speed can be set within this limit */
 	ret = cpufreq_driver->verify(policy);
 	if (ret)

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Nq2Wo0NMKNjxTN9z--

