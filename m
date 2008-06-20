From: Ben Slusky <sluskyb@paranoiacs.org>
Subject: [PATCH] use deferrable delayed work init in conservative
	governor
Date: Fri, 20 Jun 2008 11:23:13 -0400
Message-ID: <200806201532.m5KFWYmg009676@grey17.paranoiacs.org>
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
To: Cpufreq <cpufreq@lists.linux.org.uk>

Venki Pallipadi made a similar change to the ondemand governor a while
back (in commit 28287033e12463c8ff89f1ea8038783d0360391c). It seems to
work just as well in the conservative governor, leading to fewer wakeups
as reported by powertop.

Signed-off-by: Ben Slusky <sluskyb@paranoiacs.org>
---
 drivers/cpufreq/cpufreq_conservative.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 5d3a04b..e0397e5 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -460,6 +460,7 @@ static void do_dbs_timer(struct work_struct *work)
 
 static inline void dbs_timer_init(void)
 {
+	init_timer_deferrable(&dbs_work.timer);
 	schedule_delayed_work(&dbs_work,
 			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	return;
-- 
1.5.3.6
