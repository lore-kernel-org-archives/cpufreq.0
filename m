From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq Kconfig,1.3,1.4
Date: Tue, 20 Jan 2004 17:03:35 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AizHr-0007s1-CK@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv30228/linux/drivers/cpufreq

Modified Files:
	Kconfig 
Log Message:
Merge with latest davej cpufreq bk tree.

Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Kconfig,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- Kconfig	5 Nov 2003 18:27:44 -0000	1.3
+++ Kconfig	20 Jan 2004 17:03:32 -0000	1.4
@@ -74,7 +74,7 @@
 	help
 	  This enables the /proc/sys/cpu/ sysctl interface for controlling
 	  the CPUFreq,"userspace" governor. This is the same interface
-	  as known from the.4.-kernel patches for CPUFreq, and offers
+	  as known from the 2.4.-kernel patches for CPUFreq, and offers
 	  the same functionality as long as "userspace" is the
 	  selected governor for the specified CPU.
 	
