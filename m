From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.1,1.1.1.2
Date: Wed, 27 Aug 2003 11:53:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19rxvJ-0007do-Iq@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv29369

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
config does'nt like quotation marks	(Bas Mevissen)


Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- patch	25 Aug 2003 14:58:44 -0000	1.1.1.1
+++ patch	27 Aug 2003 10:53:06 -0000	1.1.1.2
@@ -180,7 +180,7 @@
 +   bool ' CPU frequency table helpers' CONFIG_CPU_FREQ_TABLE
 +   define_bool CONFIG_CPU_FREQ_PROC_INTF y
 +   comment 'CPUFreq governors'
-+   bool ' "userspace" for userspace frequency scaling' CONFIG_CPU_FREQ_GOV_USERSPACE
++   bool ' Support for governing from userspace' CONFIG_CPU_FREQ_GOV_USERSPACE
 +   define_bool CONFIG_CPU_FREQ_24_API y
 +   comment 'CPUFreq processor drivers'
 +   dep_tristate ' AMD Mobile K6-2/K6-3 PowerNow!' CONFIG_X86_POWERNOW_K6 $CONFIG_CPU_FREQ_TABLE
