From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] speedstep-smi: GET_SPEEDSTEP_FREQS may return bogus values
Date: Tue, 27 Jul 2004 22:34:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040727203438.GA9438@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

On at least one system, the GET_SPEEDSTEP_FREQS call to the BIOS
returns obviously incorrect data (0 and 4 MHz...). So, check whether
the results look sane, if not, use the already existing workaround
for ancient speedstep systems. Thanks to Pierre Maziere for reporting
this issue and testing the fix.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-07-16 10:07:10.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-07-27 22:26:57.477962728 +0200
@@ -115,6 +115,11 @@
 		: "=a" (result), "=b" (high_mhz), "=c" (low_mhz), "=d" (state), "=D" (edi)
 		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
 	);
+
+	/* abort if results are obviously incorrect... */
+	if ((high_mhz + low_mhz) < 600)
+		return -EINVAL;
+
 	*high = high_mhz * 1000;
 	*low  = low_mhz  * 1000;
 
@@ -180,7 +185,7 @@
 	local_irq_restore(flags);
 
 	if (new_state == state) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded after %u tries with result %u\n", (freqs.new / 1000), retry, result);
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded after %u tries with result %u\n", (speedstep_freqs[new_state].frequency / 1000), retry, result);
 	} else {
 		printk(KERN_ERR "cpufreq: change failed with new_state %u and result %u\n", new_state, result);
 	}
