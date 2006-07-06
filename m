From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH 2/2] cpufreq: demand load governor modules
Date: Thu, 06 Jul 2006 12:32:01 -0700
Message-ID: <44AD6531.7050803@goop.org>
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
To: cpufreq@lists.linux.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Demand-load cpufreq governor modules if needed.

Signed-off-by: Jeremy Fitzhardinge <jeremy@goop.org>

---
 drivers/cpufreq/cpufreq.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)


diff -r 4650553b3f11 drivers/cpufreq/cpufreq.c
--- a/drivers/cpufreq/cpufreq.c	Wed Jul 05 15:21:25 2006 -0700
+++ b/drivers/cpufreq/cpufreq.c	Wed Jul 05 15:25:52 2006 -0700
@@ -320,6 +320,23 @@ static int cpufreq_parse_governor (char 
 		mutex_lock(&cpufreq_governor_mutex);
 
 		t = __find_governor(str_governor);
+
+		if (t == NULL) {
+			char *name = kasprintf(GFP_KERNEL, "cpufreq_%s", str_governor);
+
+			if (name) {
+				int ret;
+
+				mutex_unlock(&cpufreq_governor_mutex);
+				ret = request_module(name);
+				mutex_lock(&cpufreq_governor_mutex);
+
+				if (ret == 0)
+					t = __find_governor(str_governor);
+			}
+
+			kfree(name);
+		}
 
 		if (t != NULL) {
 			*governor = t;
