From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq userspace.c,1.1.1.1,1.1.1.2
Date: Thu, 28 Aug 2003 14:42:00 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19sN2G-0004wa-IZ@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv18999/linux/drivers/cpufreq

Modified Files:
      Tag: LINUX_2_4
	userspace.c 
Log Message:
fix smp build

Index: userspace.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/userspace.c,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- userspace.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ userspace.c	28 Aug 2003 13:41:57 -0000	1.1.1.2
@@ -17,9 +17,9 @@
 #include <linux/smp.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
+#include <linux/cpufreq.h>
 #include <linux/interrupt.h>
 #include <linux/ctype.h>
-#include <linux/cpufreq.h>
 #include <linux/sysctl.h>
 #include <linux/types.h>
 #include <linux/fs.h>
