From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93.2.1,
	1.93.2.2
Date: Tue, 30 Sep 2003 13:30:08 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1A4Jdo-00076o-2m@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv27307

Modified Files:
      Tag: LINUX_2_4
	longhaul.c 
Log Message:
forgot to remove the .owner line..

Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.1
retrieving revision 1.93.2.2
diff -u -r1.93.2.1 -r1.93.2.2
--- longhaul.c	30 Sep 2003 11:52:08 -0000	1.93.2.1
+++ longhaul.c	30 Sep 2003 12:30:04 -0000	1.93.2.2
@@ -434,7 +434,6 @@
 	.target 	= longhaul_target,
 	.init		= longhaul_cpu_init,
 	.name		= "longhaul",
-	.owner		= THIS_MODULE,
 };
 
 static int __init longhaul_init (void)
