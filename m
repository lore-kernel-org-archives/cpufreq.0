From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.6,1.1.1.7
Date: Thu, 04 Sep 2003 17:16:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19uwmx-0005ji-AQ@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv22046

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
- *ouch* I forgot the int15 call..


Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.6
retrieving revision 1.1.1.7
diff -u -r1.1.1.6 -r1.1.1.7
--- patch	4 Sep 2003 10:54:29 -0000	1.1.1.6
+++ patch	4 Sep 2003 16:16:48 -0000	1.1.1.7
@@ -221,6 +221,28 @@
  tristate 'Toshiba Laptop support' CONFIG_TOSHIBA
  tristate 'Dell laptop support' CONFIG_I8K
  
+--- linux-original/arch/i386/boot/setup.S	Sat Aug  3 02:39:42 2002
++++ linux/arch/i386/boot/setup.S	Thu Sep  4 18:15:18 2003
+@@ -483,6 +483,19 @@
+ 	movw	$0xAA, (0x1ff)			# device present
+ no_psmouse:
+ 
++#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODUL
++)
++	movl	$0x0000E980, %eax		# IST Support 
++	movl	$0x47534943, %edx		# Request value
++	int	$0x15
++
++	movl	%eax, (96)
++	movl	%ebx, (100)
++	movl	%ecx, (104)
++	movl	%edx, (108)
++#endif
++
++
+ #if defined(CONFIG_APM) || defined(CONFIG_APM_MODULE)
+ # Then check for an APM BIOS...
+ 						# %ds points to the bootsector
 --- linux-original/arch/i386/kernel/Makefile	Mon Aug 25 13:44:39 2003
 +++ linux/arch/i386/kernel/Makefile	Thu Sep  4 12:14:03 2003
 @@ -14,7 +14,8 @@
