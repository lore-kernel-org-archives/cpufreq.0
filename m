From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/Documentation/cpufreq cpu-drivers.txt,1.4,1.5
Date: Wed, 05 Nov 2003 18:28:13 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AHSO5-0000ZV-SG@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq
In directory flint:/tmp/cvs-serv2114/linux/Documentation/cpufreq

Modified Files:
	cpu-drivers.txt 
Log Message:
Merge with davej cpufreq bk tree.

Index: cpu-drivers.txt
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/Documentation/cpufreq/cpu-drivers.txt,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- cpu-drivers.txt	19 Aug 2003 13:38:31 -0000	1.4
+++ cpu-drivers.txt	5 Nov 2003 18:27:41 -0000	1.5
@@ -64,6 +64,12 @@
 
 cpufreq_driver.exit -		A pointer to a per-CPU cleanup function.
 
+cpufreq_driver.resume -		A pointer to a per-CPU resume function
+				which is called with interrupts disabled
+				and _before_ the pre-suspend frequency
+				and/or policy is restored by a call to
+				->target or ->setpolicy.
+
 cpufreq_driver.attr -		A pointer to a NULL-terminated list of
 				"struct freq_attr" which allow to
 				export values to sysfs.
@@ -119,7 +125,7 @@
 
 You need to make sure that at least one valid frequency (or operating
 range) is within policy->min and policy->max. If necessary, increase
-policy->max fist, and only if this is no solution, decreas policy->min.
+policy->max first, and only if this is no solution, decrease policy->min.
 
 
 1.4 target or setpolicy?
