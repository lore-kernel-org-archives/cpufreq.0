From: Elias Oltmanns <eo@nebensachen.de>
Subject: Re: [Bug 8581] acpi-cpufreq gets very confused on suspend to ram
Date: Mon, 22 Oct 2007 09:50:13 +0200
Message-ID: <87640zr3ka.fsf@denkblock.local>
References: <bug-8581-3570@http.bugzilla.kernel.org/>
	<20071022002423.3FC91108014@picon.linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20071022002423.3FC91108014@picon.linux-foundation.org>
	(bugme-daemon@bugzilla.kernel.org's message of "Sun, 21 Oct 2007
	17:24:23 -0700 (PDT)")
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

--=-=-=

bugme-daemon@bugzilla.kernel.org wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=8581
>
>
> davej@codemonkey.org.uk changed:
[...]
> ------- Comment #8 from davej@codemonkey.org.uk  2007-10-21 17:24 -------
> there's some whitespace damage in this patch (spaces instead of tabs).
> Asides from that though, it looks like the right thing to do.
> Can you fix that up, and bounce a copy to cpufreq@www.linux.org.uk please?

Well, since this patch was mainly a copy-and-paste job from
cpufreq_userspace.c, the whitespace damages have been inherited once. In
fact, I have stumbled upon some more whitespace issues in in the cpufreq
subsystem and there are also some problems with lacking whitespace
causing misprinted debugging messages. If you're interested, I can come
up with a patch fixing all those problems I've accidentally come across.

Here is the patch fixing cpufreq_conservative.c anyway. It applies to
2.6.23.

Regards,

Elias

--------

--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline; filename=conservative-handle-resume-2.patch

Make cpufreq_conservative handle out-of-sync events properly

Currently, the cpufreq_conservative governor doesn't get notified when the
actual frequency the cpu is running at differs from what cpufreq thought it
was. As a result the cpu may stay at the maximum frequency after a s2ram /
resume cycle even though the system is idle.

Signed-off-by: Elias Oltmanns <eo@nebensachen.de>
---

 drivers/cpufreq/cpufreq_conservative.c |   32 ++++++++++++++++++++++++++++++--
 1 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 26f440c..7ad91d2 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -116,6 +116,27 @@ static inline unsigned int get_cpu_idle_
 	return ret;
 }
 
+/* keep track of frequency transitions */
+static int
+dbs_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
+		     void *data)
+{
+	struct cpufreq_freqs *freq = data;
+	struct cpu_dbs_info_s *this_dbs_info = &per_cpu(cpu_dbs_info,
+							freq->cpu);
+
+	if (!this_dbs_info->enable)
+		return 0;
+
+	this_dbs_info->requested_freq = freq->new;
+
+	return 0;
+}
+
+static struct notifier_block dbs_cpufreq_notifier_block = {
+	.notifier_call = dbs_cpufreq_notifier
+};
+
 /************************** sysfs interface ************************/
 static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char *buf)
 {
@@ -514,6 +535,9 @@ static int cpufreq_governor_dbs(struct c
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
 
 			dbs_timer_init();
+			cpufreq_register_notifier(
+					&dbs_cpufreq_notifier_block,
+					CPUFREQ_TRANSITION_NOTIFIER);
 		}
 		
 		mutex_unlock(&dbs_mutex);
@@ -528,9 +552,13 @@ static int cpufreq_governor_dbs(struct c
 		 * Stop the timerschedule work, when this governor
 		 * is used for first time
 		 */
-		if (dbs_enable == 0) 
+		if (dbs_enable == 0) {
 			dbs_timer_exit();
-		
+			cpufreq_unregister_notifier(
+					&dbs_cpufreq_notifier_block,
+					CPUFREQ_TRANSITION_NOTIFIER);
+		}
+
 		mutex_unlock(&dbs_mutex);
 
 		break;

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--=-=-=--

