From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] ondemand put processors at full speed at startup
Date: Thu, 16 Dec 2004 11:53:55 +0100
Message-ID: <20041216105355.GJ2140@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: venkatesh.pallipadi@intel.com
Cc: cpufreq@www.linux.org.uk

Hi,

dbs_timer_init() will schedule_work(&dbs_work) so that do_dbs_timer()
is likely called very early at same time slice scheduler, and
for each cpu, dbs_check_cpu(cpu) will be called, likely at the same time
slice than dbs_timer_init().
So far, we will get total_idle_ticks == idle_ticks == 0 unconditonaly,
and the processor will be put at full speed even though it's not needed
at startup.

Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>

 drivers/cpufreq/cpufreq_ondemand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

--- linux-2.6.10-rc3/drivers/cpufreq/cpufreq_ondemand.c	2004/12/16 10:19:29	1.1
+++ linux-2.6.10-rc3/drivers/cpufreq/cpufreq_ondemand.c	2004/12/16 10:21:02
@@ -359,7 +359,8 @@ static void do_dbs_timer(void *data)
 static inline void dbs_timer_init(void)
 {
 	INIT_WORK(&dbs_work, do_dbs_timer, NULL);
-	schedule_work(&dbs_work);
+	schedule_delayed_work(&dbs_work,
+			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate));
 	return;
 }
 

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
