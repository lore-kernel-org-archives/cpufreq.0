From: Arjan van de Ven <arjanv@redhat.com>
Subject: add new p3m model
Date: Mon, 8 Mar 2004 12:15:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040308111531.GD14593@devserv.devel.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

the patch below adds support for my laptop (Dell Inspiron 2600) which has
ebx return 7 for the p3 mobile in it....

Greetings,
    Arjan van de Ven


--- linux-2.6.3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c~	2004-03-07 15:31:51.305251000 +0100
+++ linux-2.6.3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-07 15:31:51.305251000 +0100
@@ -265,10 +265,10 @@
 	case 0x0B: /* Intel PIII [Tualatin] */
 		/* cpuid_ebx(1) is 0x04 for desktop PIII, 
-		                   0x06 for mobile PIII-M */
+		                   0x06 and 0x07 for mobile PIII-M */
 		ebx = cpuid_ebx(0x00000001);
 
 		ebx &= 0x000000FF;
-		if (ebx != 0x06)
+		if ((ebx != 0x06) && (ebx != 0x07))
 			return 0;
 
 		/* So far all PIII-M processors support SpeedStep. See
