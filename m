From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-piix4.c,1.4,1.5
Date: Fri, 27 Jun 2003 13:44:00 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19Vsa8-0006wC-Eq@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv26660

Modified Files:
	speedstep-piix4.c 
Log Message:
Stupid typo...


Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- speedstep-piix4.c	27 Jun 2003 12:37:34 -0000	1.4
+++ speedstep-piix4.c	27 Jun 2003 12:43:57 -0000	1.5
@@ -56,7 +56,7 @@
 /* DEBUG
  *   Define it if you want verbose debug output, e.g. for bug reporting
  */
-/#define SPEEDSTEP_DEBUG
+//#define SPEEDSTEP_DEBUG
 
 #ifdef SPEEDSTEP_DEBUG
 #define dprintk(msg...) printk(msg)
