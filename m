From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] powernow-k8: unregister from ACPI perflib if error during
	->init()
Date: Fri, 8 Oct 2004 21:47:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041008194735.GD8562@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@redhat.com, mark.langsdorf@amd.com

[applies on top of cpufreq-bk and pending 34 patches]

If something fails in the per-CPU initialization in powernow-k8, it should
unregister itself from the ACPI performance library.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-09-27 22:47:15.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-10-08 21:40:05.870998352 +0200
@@ -1023,6 +1023,7 @@
 err_out:
 	set_cpus_allowed(current, oldmask);
 	schedule();
+	powernow_k8_cpu_exit_acpi(data);
 
 	kfree(data);
 	return -ENODEV;
