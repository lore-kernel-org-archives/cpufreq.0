From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-lib.c, 1.1.1.2,
	1.1.1.3
Date: Mon, 15 Mar 2004 16:32:57 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1B2v1N-0003HY-DR@flint.arm.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv12595

Modified Files:
      Tag: LINUX_2_4
	speedstep-lib.c 
Log Message:
revert arjan' patch.  It's was actually a centrino, not a p3.


Index: speedstep-lib.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c,v
retrieving revision 1.1.1.2
retrieving revision 1.1.1.3
diff -u -r1.1.1.2 -r1.1.1.3
--- speedstep-lib.c	11 Mar 2004 14:17:39 -0000	1.1.1.2
+++ speedstep-lib.c	15 Mar 2004 16:32:53 -0000	1.1.1.3
@@ -169,11 +169,11 @@
 	switch (c->x86_model) {
 	case 0x0B: /* Intel PIII [Tualatin] */
 		/* cpuid_ebx(1) is 0x04 for desktop PIII, 
-		                   0x06 or 0x07 for mobile PIII-M */
+		                   0x06 for mobile PIII-M */
 		ebx = cpuid_ebx(0x00000001);
 
 		ebx &= 0x000000FF;
-		if ((ebx != 0x06) && (ebx != 0x07))
+		if (ebx != 0x06)
 			return 0;
 
 		/* So far all PIII-M processors support SpeedStep. See
