From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] acpi-cpufreq: force transitions even if driver thinks CPU
	is already at given P-State
Date: Fri, 8 Oct 2004 21:45:58 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041008194558.GB8562@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, venkatesh.pallipadi@intel.com, davej@redhat.com

[applies on top of bk-cpufreq and the 34 patches already pushed]

As it isn't possible to determine whether the P-state last set is
still the one currently active in the platform, transitions shouldn't
abort because the driver thinks the CPU is already at the target state.
Also, it is good to know with what status a transition failed, so print
out that value -- that snipped is from Venkates Pallipadi in his test
patch for bug # 3507.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2004-09-27 23:11:45.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2004-10-08 21:21:46.947060184 +0200
@@ -118,12 +118,6 @@
 		return (-EAGAIN);
 	}
 	
-	if (state == data->acpi_data.state) {
-		dprintk("Already at target state (P%d)\n", state);
-		retval = 0;
-		goto migrate_end;
-	}
-
 	dprintk("Transitioning from P%d to P%d\n",
 		data->acpi_data.state, state);
 
@@ -187,7 +181,7 @@
 		cpufreq_freqs.old = tmp;
 		cpufreq_notify_transition(&cpufreq_freqs, CPUFREQ_PRECHANGE);
 		cpufreq_notify_transition(&cpufreq_freqs, CPUFREQ_POSTCHANGE);
-		printk(KERN_WARNING "acpi-cpufreq: Transition failed\n");
+		printk(KERN_WARNING "acpi-cpufreq: Transition failed with status 0x%x\n", value);
 		retval = -ENODEV;
 		goto migrate_end;
 	}
