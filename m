From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: [PATCH] cpufreq: Warn when cpufreq_register_notifier called before
	pure initcalls
Date: Sat, 16 Feb 2008 08:41:24 -0200
Message-ID: <1203158485-20578-1-git-send-email-cesarb@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: cpufreq@lists.linux.org.uk

If cpufreq_register_notifier is called before pure initcalls,
init_cpufreq_transition_notifier_list will overwrite whatever it did,
causing notifiers to be ignored.

Print some noise to the kernel log if that happens.

Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
---

This actually happened to me when writing the s3c2410 timer cpufreq notifier,
since the timer code is initialized before any initcalls. The WARN_ON() below
wasn't actually tested, since I had already fixed my notifier; however, it's
obviously correct.

 drivers/cpufreq/cpufreq.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 3a92d27..86dee18 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -118,9 +118,11 @@ static void handle_update(struct work_struct *work);
 static BLOCKING_NOTIFIER_HEAD(cpufreq_policy_notifier_list);
 static struct srcu_notifier_head cpufreq_transition_notifier_list;
 
+static bool init_cpufreq_transition_notifier_list_called;
 static int __init init_cpufreq_transition_notifier_list(void)
 {
 	srcu_init_notifier_head(&cpufreq_transition_notifier_list);
+	init_cpufreq_transition_notifier_list_called = true;
 	return 0;
 }
 pure_initcall(init_cpufreq_transition_notifier_list);
@@ -1369,6 +1371,8 @@ int cpufreq_register_notifier(struct notifier_block *nb, unsigned int list)
 {
 	int ret;
 
+	WARN_ON(!init_cpufreq_transition_notifier_list_called);
+
 	switch (list) {
 	case CPUFREQ_TRANSITION_NOTIFIER:
 		ret = srcu_notifier_chain_register(
-- 
1.5.4
