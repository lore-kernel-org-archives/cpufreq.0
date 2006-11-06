From: Gary Hade <garyhade@us.ibm.com>
Subject: [PATCH] speedstep-centrino should ignore upper performance control
	bits
Date: Mon, 6 Nov 2006 15:39:23 -0800
Message-ID: <20061106233923.GA15063@us.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk, davej@redhat.com


On some systems such as the IBM x3650 there are bits set in the 
upper half of the control values provided by the _PSS object.  
These bits are only relevant for cpufreq drivers that use IO ports 
which are not currently supported by the speedstep-centrino driver.  
The current MSR oriented code assumes that upper bits are not set 
and thus fails to work correctly when they are.  e.g. the control 
and status value equality check fails even though the ACPI spec 
allows the inequality.

Signed-off-by: Gary Hade <garyh@us.ibm.com>
---

--- linux-2.6.19-rc4/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c.orig	2006-11-06 10:40:03.000000000 -0800
+++ linux-2.6.19-rc4/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2006-11-06 14:23:23.849627864 -0800
@@ -463,6 +463,10 @@
 	}
 
 	for (i=0; i<p->state_count; i++) {
+		/* clear high bits (set by some BIOSes) that are non-relevant and 
+		   problematic for this driver's MSR only frequency transition code */
+		p->states[i].control &= 0xffff; 
+
 		if (p->states[i].control != p->states[i].status) {
 			dprintk("Different control (%llu) and status values (%llu)\n",
 				p->states[i].control, p->states[i].status);
