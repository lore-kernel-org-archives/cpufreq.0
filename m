From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93.2.3,
	1.93.2.4
Date: Tue, 09 Dec 2003 09:07:33 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1ATdq9-0006t4-Am@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv26464

Modified Files:
      Tag: LINUX_2_4
	longhaul.c 
Log Message:
2.4 do not have default policy.


Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.3
retrieving revision 1.93.2.4
diff -u -r1.93.2.3 -r1.93.2.4
--- longhaul.c	9 Dec 2003 08:58:33 -0000	1.93.2.3
+++ longhaul.c	9 Dec 2003 09:07:30 -0000	1.93.2.4
@@ -423,7 +423,7 @@
 	if (ret != 0)
 		return ret;
 
- 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+ 	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
  	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = calc_speed (longhaul_get_cpu_mult(), fsb);
