From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix compilation of speedstep-lib with DEBUG set
Date: Wed, 31 Mar 2004 09:33:00 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040331073300.GA7893@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@redhat.com

A type caused a compilation error if SPEEDSTEP_DEBUG was set.

--- 2.6.5-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c~	2004-02-18 10:16:51.000000000 +0100
+++ 2.6.5-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-31 09:31:15.335365688 +0200
@@ -210,7 +210,7 @@
 		ebx = cpuid_ebx(0x00000001);
 		ebx &= 0x000000FF;
 
-		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->86_mask);
+		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->x86_mask);
 
 		switch (c->x86_mask) {
 		case 4: 
