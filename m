From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] speedstep-centrino: fix cpu_cur_freq when resume.
Date: Fri, 24 Sep 2004 21:40:14 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040924194014.GA7732@dominikbrodowski.de>
References: <87acvh7e15.wl%miura@da-cha.org>
	<20040923080207.GA14010@dominikbrodowski.de>
	<874qlnpy4t.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <874qlnpy4t.wl%miura@da-cha.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hiroshi Miura <miura@da-cha.org>
Cc: cpufreq@www.linux.org.uk

On Fri, Sep 24, 2004 at 10:58:10PM +0900, Hiroshi Miura wrote:
> In my patch, .resume function calls get_cur_freq(0) and set internal 
> state variable 'p.state' to proper value.
> 
> p.state is only for depricated /proc/acpi/.../performance interface.
> so what we need is just calling  get_cur_freq(0).

Actually, the problem lies in the userspace governor, and I'd prefer to fix
it instead of all drivers. I'll push this change to Dave once he gets his
computers back up and running.

Thanks,
	Dominik


Sometimes, a user or userspace daemon wants a specific frequency is set,
but that frequency is (temporarily) unavailable or becomes unavailable
due to e.g. thermal considerations. As soon as this situation changes,
the user wish should be re-evaluated. The attached patch saves the user
wish in "cpu_set_freq", and re-uses that whenever appropriate.

Thanks to Thomas Renninger for testing.

Signed-off-by: Dominik Brodowski <linuxbrodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2004-09-19 13:48:34.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-09-23 18:06:23.536696680 +0200
@@ -68,7 +68,8 @@
  */
 static unsigned int	cpu_max_freq[NR_CPUS];
 static unsigned int	cpu_min_freq[NR_CPUS];
-static unsigned int	cpu_cur_freq[NR_CPUS];
+static unsigned int	cpu_cur_freq[NR_CPUS]; /* current CPU freq */
+static unsigned int	cpu_set_freq[NR_CPUS]; /* CPU freq desired by userspace */
 static unsigned int	cpu_is_managed[NR_CPUS];
 static struct cpufreq_policy current_policy[NR_CPUS];
 
@@ -82,13 +83,6 @@
 {
         struct cpufreq_freqs *freq = data;
 
-	/* Don't update cur_freq if CPU is managed and we're
-	 * waking up: else we won't remember what frequency 
-	 * we need to set the CPU to.
-	 */
-	if (cpu_is_managed[freq->cpu] && (val == CPUFREQ_RESUMECHANGE))
-		return 0;
-
 	cpu_cur_freq[freq->cpu] = freq->new;
 
         return 0;
@@ -114,6 +108,8 @@
 	if (!cpu_is_managed[cpu])
 		goto err;
 
+	cpu_set_freq[cpu] = freq;
+
 	if (freq < cpu_min_freq[cpu])
 		freq = cpu_min_freq[cpu];
 	if (freq > cpu_max_freq[cpu])
@@ -523,6 +519,7 @@
 		cpu_min_freq[cpu] = policy->min;
 		cpu_max_freq[cpu] = policy->max;
 		cpu_cur_freq[cpu] = policy->cur;
+		cpu_set_freq[cpu] = policy->cur;
 		sysfs_create_file (&policy->kobj, &freq_attr_scaling_setspeed.attr);
 		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
 		up(&userspace_sem);
@@ -532,6 +529,7 @@
 		cpu_is_managed[cpu] = 0;
 		cpu_min_freq[cpu] = 0;
 		cpu_max_freq[cpu] = 0;
+		cpu_set_freq[cpu] = 0;
 		sysfs_remove_file (&policy->kobj, &freq_attr_scaling_setspeed.attr);
 		up(&userspace_sem);
 		break;
@@ -539,15 +537,16 @@
 		down(&userspace_sem);
 		cpu_min_freq[cpu] = policy->min;
 		cpu_max_freq[cpu] = policy->max;
-		if (policy->max < cpu_cur_freq[cpu])
+		if (policy->max < cpu_set_freq[cpu]) {
 			__cpufreq_driver_target(&current_policy[cpu], policy->max, 
 			      CPUFREQ_RELATION_H);
-		else if (policy->min > cpu_cur_freq[cpu])
+		} else if (policy->min > cpu_set_freq[cpu]) {
 			__cpufreq_driver_target(&current_policy[cpu], policy->min, 
 			      CPUFREQ_RELATION_L);
-		else
-			__cpufreq_driver_target(&current_policy[cpu], cpu_cur_freq[cpu],
+		} else {
+			__cpufreq_driver_target(&current_policy[cpu], cpu_set_freq[cpu],
 			      CPUFREQ_RELATION_L);
+		}
 		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
 		up(&userspace_sem);
 		break;
