From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH][2/2] ondemand governor store the idle ticks for all cpus
Date: Sun, 06 Mar 2005 19:52:22 +0100
Message-ID: <422B5166.5040906@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080301070404070606040704"
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@zenii.linux.org.uk

This is a multi-part message in MIME format.
--------------080301070404070606040704
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

While doing the previous cleanup I noticed that until now only the 
prev_cpu_idle_up of the current CPU would be stored to 
prev_cpu_idle_down. In case of several associated CPUs, all the 
measurement is based on looking every CPU statistic. Therefore it is 
necessary to also save the prev_cpu_idle_up of the other associated CPUs.

This patch fixes this by adding a small loop. As the previous patch, 
it's against 2.6.11 and only tested on a monoprocessor PC.

Eric

PS: I couldn't find any documentation concerning the implementation of 
several CPUs with a frequency attached, is there any reference?

--
Ondemand governor did not store prev_cpu_idle_up into prev_cpu_idle_down 
for other CPUs than the current CPU.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
--

--------------080301070404070606040704
Content-Type: text/x-patch;
	name="ondemand-save-idle-up-for-all-cpu-2.6.11.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-save-idle-up-for-all-cpu-2.6.11.patch"

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.clean2	2005-03-06 19:04:12.000000000 +0100
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-03-06 19:09:52.000000000 +0100
@@ -277,7 +277,12 @@
 		__cpufreq_driver_target(policy, policy->max, 
 			CPUFREQ_RELATION_H);
 		down_skip[cpu] = 0;
-		this_dbs_info->prev_cpu_idle_down = this_dbs_info->prev_cpu_idle_up;
+		for_each_cpu_mask(j, policy->cpus) {
+			struct cpu_dbs_info_s *j_dbs_info;
+
+			j_dbs_info = &per_cpu(cpu_dbs_info, j);
+			j_dbs_info->prev_cpu_idle_down = j_dbs_info->prev_cpu_idle_up;
+		}
 		return;
 	}
 

--------------080301070404070606040704
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------080301070404070606040704--

