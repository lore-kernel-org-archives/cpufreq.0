From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.7,1.1.1.8
Date: Thu, 04 Sep 2003 17:19:06 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19uwp8-0005kA-83@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv22075

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
nobody have a brown bag here?

Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.7
retrieving revision 1.1.1.8
diff -u -r1.1.1.7 -r1.1.1.8
--- patch	4 Sep 2003 16:16:48 -0000	1.1.1.7
+++ patch	4 Sep 2003 16:19:03 -0000	1.1.1.8
@@ -222,13 +222,12 @@
  tristate 'Dell laptop support' CONFIG_I8K
  
 --- linux-original/arch/i386/boot/setup.S	Sat Aug  3 02:39:42 2002
-+++ linux/arch/i386/boot/setup.S	Thu Sep  4 18:15:18 2003
-@@ -483,6 +483,19 @@
++++ linux/arch/i386/boot/setup.S	Thu Sep  4 18:18:46 2003
+@@ -483,6 +483,18 @@
  	movw	$0xAA, (0x1ff)			# device present
  no_psmouse:
  
-+#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODUL
-+)
++#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODULE)
 +	movl	$0x0000E980, %eax		# IST Support 
 +	movl	$0x47534943, %edx		# Request value
 +	int	$0x15
