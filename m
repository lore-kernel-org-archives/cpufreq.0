From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH][2/3] ondemand governor store the idle ticks for all cpus
Date: Wed, 11 May 2005 14:27:09 +0200
Message-ID: <4281FA1D.102@tremplin-utc.net>
References: <200503140829.04750.lkml@kcore.org>	<42354400.7070500@tremplin-utc.net>	<20050511013334.GB8039@redhat.com>
	<20050511023448.GA25506@redhat.com>
	<4281F837.5070608@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040001090601050406030805"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <4281F837.5070608@tremplin-utc.net>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.net

This is a multi-part message in MIME format.
--------------040001090601050406030805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ondemand governor did not store prev_cpu_idle_up into prev_cpu_idle_down 
for other CPUs than the current CPU.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
--

--------------040001090601050406030805
Content-Type: text/x-patch;
	name="ondemand-save-idle-up-for-all-cpu-2.6.11-20050511.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-save-idle-up-for-all-cpu-2.6.11-20050511.patch"

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.cpufreq-20050501-1	2005-05-11 13:22:18.000000000 +0200
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-05-11 13:30:59.000000000 +0200
@@ -276,7 +276,12 @@ static void dbs_check_cpu(int cpu)
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
 

--------------040001090601050406030805
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------040001090601050406030805--

