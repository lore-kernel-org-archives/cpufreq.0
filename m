From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.11,1.1.1.12
Date: Tue, 31 Aug 2004 10:59:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C25Pq-0002J4-Hw@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv8835

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
rediffing against vanilla 2.4.27


Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.11
retrieving revision 1.1.1.12
diff -u -r1.1.1.11 -r1.1.1.12
--- patch	9 Jul 2004 22:02:10 -0000	1.1.1.11
+++ patch	31 Aug 2004 09:58:55 -0000	1.1.1.12
@@ -9,9 +9,9 @@
  cpqarray.txt
  	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
  devices.txt
---- linux.original/Documentation/Configure.help	2004-04-14 15:05:24.000000000 +0200
-+++ linux/Documentation/Configure.help	2004-07-09 14:30:15.000000000 +0200
-@@ -28178,16 +28178,6 @@ CONFIG_CPU_ARM926T
+--- linux.original/Documentation/Configure.help	2004/08/31 09:55:20
++++ linux/Documentation/Configure.help	2004/08/31 09:55:38
+@@ -28322,16 +28322,6 @@
    Say Y if you want support for the ARM926T processor.
    Otherwise, say N.
  
@@ -28,7 +28,7 @@
  SiS
  CONFIG_DRM_SIS
    Choose this option if you have a SIS graphics card. AGP support is
-@@ -28603,6 +28593,154 @@ IPMI Watchdog Timer
+@@ -28747,6 +28737,154 @@
  CONFIG_IPMI_WATCHDOG
    This enables the IPMI watchdog timer.
