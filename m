From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-piix4.c, 1.9,
	1.9.2.1
Date: Thu, 28 Aug 2003 14:32:52 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19sMtQ-0004qQ-8K@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv18613/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	speedstep-piix4.c 
Log Message:
add driver speedstep-piix4 in 2.4 series

Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.9
retrieving revision 1.9.2.1
diff -u -r1.9 -r1.9.2.1
--- speedstep-piix4.c	19 Aug 2003 13:44:59 -0000	1.9
+++ speedstep-piix4.c	28 Aug 2003 13:32:49 -0000	1.9.2.1
@@ -285,7 +285,6 @@
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
-	.owner		= THIS_MODULE,
 };
