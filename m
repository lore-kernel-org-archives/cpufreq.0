From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] If a CPU gets onlined set the governor to the one that is
	run on other CPUs
Date: Thu, 23 Nov 2006 16:37:17 +0100
Message-ID: <1164296237.3721.395.camel@queen.suse.de>
Reply-To: trenn@suse.de
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: Dave Jones <davej@redhat.com>

Hi,

I wonder whether there is any real use to allow userspace to
run different governors on different CPUs?
This complicates things (in kernel and userspace) and
if not really needed I'd link up all
sys/../cpu*/cpufreq/scaling_governor files?





If a CPU gets onlined set the governor to the one that is run on other CPUs

If you offline a CPU and online it again (as done by swsusp on SMP),
the cpufreq governor jumps back to performance (or compiled in default
governor).

With this patch it's working like (if CPU is onlined):

check governor of other CPUs, if

  a) all run with the same governor, set governor of CPU that
     gets onlined to the same governor that is run on the others
  b) if different governors are running on different CPUs, set
     the CPU that got onlined to default governor

That means for userspace progs accessing/controlling cpufreq stuff, they should
*never ever* run different governors on the same machine at the same time (on
different CPUs). IMO this feature should be disabled by kernel anyway, but
there might be cases where it makes sense, don't know.

This fix is necessary as any prog is allowed to offline the CPU and cpufreq
must still work. Hal/powersaved or other userspace apps that control suspend
triggering and cpufreq control might be able to workaround the swsuspend resume
case, others that only care about cpufreq, e.g. cpufreqd cannot.
Especially ondemand governor should IMO always just work out of the box by simply
doing: echo ondemand >/sys/../scaling_governor (unfortunately this has to be done
for each cpu currently...).

Thanks,

    Thomas


Signed-off-by: Thomas Renninger <trenn@suse.de>

 drivers/cpufreq/cpufreq.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+)

Index: linux-2.6.18_cpufreq_debug_i386/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.18_cpufreq_debug_i386.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.18_cpufreq_debug_i386/drivers/cpufreq/cpufreq.c
@@ -623,6 +623,7 @@ static int cpufreq_add_dev (struct sys_d
 	unsigned int j;
 #ifdef CONFIG_SMP
 	struct cpufreq_policy *managed_policy;
+	struct cpufreq_governor *governor = NULL;
 #endif
 
 	if (cpu_is_offline(cpu))
@@ -743,6 +744,30 @@ static int cpufreq_add_dev (struct sys_d
 				  * run in cpufreq_set_policy */
 	mutex_unlock(&policy->lock);
 
+#ifdef CONFIG_SMP
+	/* Set governor of added CPU to the same governor running on other CPUs
+	   If different governors are run on differnt CPUs default gov
+	   will be taken */
+	for (j=0; j<NR_CPUS; j++){
+		if (j == cpu)
+			continue;
+		if (cpufreq_cpu_data[j]){
+			if (!governor)
+				governor = cpufreq_cpu_data[j]->governor;
+			else{
+				if (governor != cpufreq_cpu_data[j]->governor)
+					/* different governors running on
+					   different CPUs -> we will start
+					   default governor on this one... */
+					governor = NULL;
+				break;
+			}
+		}
+	}
+	if (governor)
+		new_policy.governor = governor;
+#endif
+
 	/* set default policy */
 	ret = cpufreq_set_policy(&new_policy);
 	if (ret) {
