From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-ich.c, 1.5,
	1.6 speedstep-piix4.c, 1.9, 1.10
Date: Wed, 03 Sep 2003 08:42:34 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19uSHi-0004jV-MD@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv18189/linux/arch/i386/kernel/cpufreq

Modified Files:
	speedstep-ich.c speedstep-piix4.c 
Log Message:
give correct name to the driver

Index: speedstep-ich.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-ich.c,v
retrieving revision 1.5
retrieving revision 1.6
diff -u -r1.5 -r1.6
--- speedstep-ich.c	19 Aug 2003 13:38:32 -0000	1.5
+++ speedstep-ich.c	3 Sep 2003 07:42:31 -0000	1.6
@@ -309,7 +309,7 @@
 
 
 static struct cpufreq_driver speedstep_driver = {
-	.name		= "speedstep",
+	.name		= "speedstep-ich",
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,

Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.9
retrieving revision 1.10
diff -u -r1.9 -r1.10
--- speedstep-piix4.c	19 Aug 2003 13:44:59 -0000	1.9
+++ speedstep-piix4.c	3 Sep 2003 07:42:31 -0000	1.10
@@ -281,7 +281,7 @@
 
 
 static struct cpufreq_driver speedstep_driver = {
-	.name		= "speedstep",
+	.name		= "speedstep-piix4",
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
