From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix panic in powernow_k8_verify on MP but PSB systems
Date: Wed, 26 May 2004 22:33:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040526203347.GA9388@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, paul.devriendt@amd.com

Instead of -ENODEV; powernow_k8_cpu_init returns 0 if it's running on a MP
system but PSB BIOS is tried... this causes a panic in
powernow_k8_verify, as can be seen at
http://forums.gentoo.org/viewtopic.php?t=177423

Signed-off-by: Dominik Brodowski <linux@brodo.de>

--- linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.original	2004-05-24 15:19:13.000000000 +0200
+++ linux-2.6.7-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-05-26 22:30:43.404982920 +0200
@@ -945,7 +945,7 @@
 		if ((num_online_cpus() != 1) || (num_possible_cpus() != 1)) {
 			printk(KERN_INFO PFX "MP systems not supported by PSB BIOS structure\n");
 			kfree(data);
-			return 0;
+			return -ENODEV;
 		}
 		rc = find_psb_table(data);
 		if (rc) {
