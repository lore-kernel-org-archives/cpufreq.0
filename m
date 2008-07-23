From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: [PATCH] cpufreq: set cpufreq_freqs.flags when not using
	cpufreq_notify_transition()
Date: Tue, 22 Jul 2008 21:20:31 -0300
Message-ID: <1216772431-4559-1-git-send-email-cesarb@cesarb.net>
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
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk

The flags member of struct cpufreq_freqs is set by
cpufreq_notify_transition(). However, on CPUFREQ_SUSPENDCHANGE and
CPUFREQ_RESUMECHANGE, the notifiers and adjust_jiffies() are both called
directly, bypassing cpufreq_notify_transition() and thus leaving junk on the
flags member. This can lead to incorrect behaviour on adjust_jiffies().

Fix by always setting cpufreq_freqs.flags when not using
cpufreq_notify_transition().

Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
---
 drivers/cpufreq/cpufreq.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 79581fa..659471a 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1243,6 +1243,7 @@ static int cpufreq_suspend(struct sys_device * sysdev, pm_message_t pmsg)
 		freqs.cpu = cpu;
 		freqs.old = cpu_policy->cur;
 		freqs.new = cur_freq;
+		freqs.flags = cpufreq_driver->flags;
 
 		srcu_notifier_call_chain(&cpufreq_transition_notifier_list,
 				    CPUFREQ_SUSPENDCHANGE, &freqs);
@@ -1324,6 +1325,7 @@ static int cpufreq_resume(struct sys_device * sysdev)
 			freqs.cpu = cpu;
 			freqs.old = cpu_policy->cur;
 			freqs.new = cur_freq;
+			freqs.flags = cpufreq_driver->flags;
 
 			srcu_notifier_call_chain(
 					&cpufreq_transition_notifier_list,
-- 
1.5.6.4
