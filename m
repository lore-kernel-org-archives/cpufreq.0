From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/include/linux cpufreq.h,1.1.1.2,1.1.1.3
Date: Thu, 28 Aug 2003 14:42:01 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19sN2H-0004wh-4m@flint.arm.linux.org.uk>
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
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/include/linux
In directory flint:/tmp/cvs-serv18999/linux/include/linux

Modified Files:
      Tag: LINUX_2_4
	cpufreq.h 
Log Message:
fix smp build

Index: cpufreq.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/include/linux/cpufreq.h,v
retrieving revision 1.1.1.2
retrieving revision 1.1.1.3
diff -u -r1.1.1.2 -r1.1.1.3
--- cpufreq.h	25 Aug 2003 14:58:47 -0000	1.1.1.2
+++ cpufreq.h	28 Aug 2003 13:41:58 -0000	1.1.1.3
@@ -16,6 +16,7 @@
 
 #include <linux/config.h>
 #include <linux/notifier.h>
+#include <linux/sched.h>
 #include <linux/threads.h>
 #include <asm/semaphore.h>
