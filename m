From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-lib.c, 1.1.1.1,
	1.1.1.2
Date: Thu, 11 Mar 2004 14:17:42 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1B1R0I-00052X-4i@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv18804/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	speedstep-lib.c 
Log Message:
The PIII-M in a Dell Inspiron 2600 return 7 (instead of 6) in brand id
(Arjan van de Ven)


Index: speedstep-lib.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- speedstep-lib.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ speedstep-lib.c	11 Mar 2004 14:17:39 -0000	1.1.1.2
@@ -169,11 +169,11 @@
 	switch (c->x86_model) {
 	case 0x0B: /* Intel PIII [Tualatin] */
 		/* cpuid_ebx(1) is 0x04 for desktop PIII, 
-		                   0x06 for mobile PIII-M */
+		                   0x06 or 0x07 for mobile PIII-M */
 		ebx = cpuid_ebx(0x00000001);
 
 		ebx &= 0x000000FF;
-		if (ebx != 0x06)
+		if ((ebx != 0x06) && (ebx != 0x07))
 			return 0;
 
 		/* So far all PIII-M processors support SpeedStep. See
