From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.55,1.56
Date: Wed, 27 Aug 2003 11:42:21 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19rxkr-0007Xw-7a@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv28992

Modified Files:
	patch 
Log Message:
Dominik Brodowski: Let's put all cross-arch cpufreq files in one location.
                   Also, remove the $Id$ tag.


Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.55
retrieving revision 1.56
diff -u -r1.55 -r1.56
--- patch	28 Feb 2003 16:01:31 -0000	1.55
+++ patch	27 Aug 2003 10:42:18 -0000	1.56
@@ -0,0 +1,11 @@
+diff -ruN linux-original/kernel/Makefile linux/kernel/Makefile
+--- linux-original/kernel/Makefile	2003-08-26 23:40:13.000000000 +0200
++++ linux/kernel/Makefile	2003-08-26 23:44:24.000000000 +0200
+@@ -15,7 +15,6 @@
+ obj-$(CONFIG_MODULES) += ksyms.o module.o
+ obj-$(CONFIG_KALLSYMS) += kallsyms.o
+ obj-$(CONFIG_PM) += power/
+-obj-$(CONFIG_CPU_FREQ) += cpufreq.o
+ obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
+ obj-$(CONFIG_COMPAT) += compat.o
+ obj-$(CONFIG_IKCONFIG) += configs.o
