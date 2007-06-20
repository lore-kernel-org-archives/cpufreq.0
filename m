From: Venki Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] Keep userspace governor quiet when it is not being used
Date: Wed, 20 Jun 2007 14:24:00 -0700
Message-ID: <20070620212400.GA2109@linux-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>



Userspace governor registers a frequency change notifier at init time, even
when no CPU is set to userspace governor. Make it register only when
atleast one CPU is using userspace.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.22-rc-mm/drivers/cpufreq/cpufreq_userspace.c
===================================================================
--- linux-2.6.22-rc-mm.orig/drivers/cpufreq/cpufreq_userspace.c
+++ linux-2.6.22-rc-mm/drivers/cpufreq/cpufreq_userspace.c
@@ -37,6 +37,7 @@ static unsigned int	cpu_set_freq[NR_CPUS
 static unsigned int	cpu_is_managed[NR_CPUS];
 
 static DEFINE_MUTEX	(userspace_mutex);
+static int cpus_using_userspace_governor;
 
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_GOVERNOR, "userspace", msg)
 
@@ -47,7 +48,11 @@ userspace_cpufreq_notifier(struct notifi
 {
         struct cpufreq_freqs *freq = data;
 
-	dprintk("saving cpu_cur_freq of cpu %u to be %u kHz\n", freq->cpu, freq->new);
+	if (!cpu_is_managed[freq->cpu])
+		return 0;
+
+	dprintk("saving cpu_cur_freq of cpu %u to be %u kHz\n",
+			freq->cpu, freq->new);
 	cpu_cur_freq[freq->cpu] = freq->new;
 
         return 0;
@@ -142,6 +147,13 @@ static int cpufreq_governor_userspace(st
 		if (rc)
 			goto start_out;
 
+		if (cpus_using_userspace_governor == 0) {
+			cpufreq_register_notifier(
+					&userspace_cpufreq_notifier_block,
+					CPUFREQ_TRANSITION_NOTIFIER);
+		}
+		cpus_using_userspace_governor++;
+
 		cpu_is_managed[cpu] = 1;
 		cpu_min_freq[cpu] = policy->min;
 		cpu_max_freq[cpu] = policy->max;
@@ -153,6 +165,13 @@ start_out:
 		break;
 	case CPUFREQ_GOV_STOP:
 		mutex_lock(&userspace_mutex);
+		cpus_using_userspace_governor--;
+		if (cpus_using_userspace_governor == 0) {
+        		cpufreq_unregister_notifier(
+					&userspace_cpufreq_notifier_block,
+					CPUFREQ_TRANSITION_NOTIFIER);
+		}
+
 		cpu_is_managed[cpu] = 0;
 		cpu_min_freq[cpu] = 0;
 		cpu_max_freq[cpu] = 0;
@@ -198,7 +217,6 @@ EXPORT_SYMBOL(cpufreq_gov_userspace);
 
 static int __init cpufreq_gov_userspace_init(void)
 {
-	cpufreq_register_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
 	return cpufreq_register_governor(&cpufreq_gov_userspace);
 }
 
@@ -206,7 +224,6 @@ static int __init cpufreq_gov_userspace_
 static void __exit cpufreq_gov_userspace_exit(void)
 {
 	cpufreq_unregister_governor(&cpufreq_gov_userspace);
-        cpufreq_unregister_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
 }
