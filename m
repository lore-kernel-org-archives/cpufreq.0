From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq Kconfig,1.5,1.6
Date: Fri, 27 Jun 2003 11:22:06 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19VqMo-0005cg-Qf@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv21610

Modified Files:
	Kconfig 
Log Message:
fix compilation failure if speedstep-piix4 is build as a non-module.


Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Kconfig,v
retrieving revision 1.5
retrieving revision 1.6
diff -u -r1.5 -r1.6
--- Kconfig	17 Jun 2003 13:32:34 -0000	1.5
+++ Kconfig	27 Jun 2003 10:22:03 -0000	1.6
@@ -138,8 +138,8 @@
 
 config X86_SPEEDSTEP_LIB
        tristate
-       depends on X86_SPEEDSTEP_ICH
-       default X86_SPEEDSTEP_ICH
+       depends on X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4
+       default X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4
 
 config X86_P4_CLOCKMOD
 	tristate "Intel Pentium 4 clock modulation"
