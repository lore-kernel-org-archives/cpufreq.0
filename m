From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k6.c, 1.1.1.1,
	1.1.1.2
Date: Tue, 31 Aug 2004 10:35:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C252j-00022h-BM@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv7827

Modified Files:
      Tag: LINUX_2_4
	powernow-k6.c 
Log Message:
cleanup a comment


Index: powernow-k6.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k6.c,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- powernow-k6.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ powernow-k6.c	31 Aug 2004 09:35:05 -0000	1.1.1.2
@@ -118,7 +118,9 @@
 
 /**
  * powernow_k6_setpolicy - sets a new CPUFreq policy
- * @policy - new policy
+ * @policy: new policy
+ * @target_freq: the target frequency
+ * @relation: how that frequency relates to achieved frequency (CPUFREQ_RELATION_L or CPUFREQ_RELATION_H)
  *
  * sets a new CPUFreq policy
  */
