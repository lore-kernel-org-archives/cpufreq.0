From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES 2/5] speedstep-lib: frequency calculation on
	early P4s
Date: Sat, 29 Jan 2005 20:43:03 +0100
Message-ID: <20050129194303.GB9382@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

From: Matthias-Christian Ott <matthias.christian@tiscali.de>

The Pentium4 models 0&1 have a longer MSR_EBC_FREQUENCY_ID register as
the models 2&3, so the bit shift must be bigger.

Signed-off-by: Matthias-Christian Ott <matthias.christian@tiscali.de>
Signed-off-by: Dominik Brodowski <linux@brodo.de> (coding style cleanups)

Index: 2.6.11-rc2+/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
===================================================================
--- 2.6.11-rc2+.orig/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-12-25 09:59:47.000000000 +0100
+++ 2.6.11-rc2+/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2005-01-29 20:19:02.000000000 +0100
@@ -160,7 +160,10 @@
 		printk(KERN_DEBUG "speedstep-lib: couldn't detect FSB speed. Please send an e-mail to <linux@brodo.de>\n");
 
 	/* Multiplier. */
-	mult = msr_lo >> 24;
+	if (c->x86_model < 2)
+		mult = msr_lo >> 27;
+	else
+	        mult = msr_lo >> 24;
 
 	dprintk("P4 - FSB %u kHz; Multiplier %u; Speed %u kHz\n", fsb, mult, (fsb * mult));
