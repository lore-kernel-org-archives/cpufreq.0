From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-centrino.c,1.1,1.2
Date: Tue, 24 Jun 2003 13:22:54 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19Ump4-000484-2M@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv15869

Modified Files:
	speedstep-centrino.c 
Log Message:
Disable boring debug output (J. Fitzhardinge)


Index: speedstep-centrino.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-centrino.c,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -r1.1 -r1.2
--- speedstep-centrino.c	16 Jun 2003 20:36:58 -0000	1.1
+++ speedstep-centrino.c	24 Jun 2003 12:22:51 -0000	1.2
@@ -29,7 +29,7 @@
 #define PFX		"speedstep-centrino: "
 #define MAINTAINER	"Jeremy Fitzhardinge <jeremy@goop.org>"
 
-#define CENTRINO_DEBUG
+/* #define CENTRINO_DEBUG */
 
 #ifdef CENTRINO_DEBUG
 #define dprintk(msg...) printk(msg)
