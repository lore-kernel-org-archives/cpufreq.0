From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] speedstep-centrino: ignore 0xffff'ed P-States
Date: Fri, 30 Jul 2004 17:50:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040730155005.GA7759@dominikbrodowski.de>
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
Cc: jeremy@goop.org

Some ACPI tables contain 0xffff'ed entries for "P-States". This is 
obviously incorrect according to the ACPI specifications, nonetheless
it should "just work". So, simply ignore such invalid P-States instead
of aborting. Thanks to Frederik Reiss for testing (and fixing) this 
patch.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-07-28 19:02:28.271709968 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-07-28 19:38:19.307702792 +0200
@@ -347,6 +347,12 @@
 			goto err_unreg;
 		}
 
+		if (p.states[i].core_frequency > p.states[0].core_frequency) {
+			printk(KERN_DEBUG "P%u has larger frequency than P0, skipping\n", i);
+			p.states[i].core_frequency = 0;
+			continue;
+		}
+
 		if (extract_clock(p.states[i].control) != 
 		    (p.states[i].core_frequency * 1000)) {
 			printk(KERN_DEBUG "Invalid encoded frequency\n");
@@ -378,6 +384,8 @@
 		centrino_model->op_points[i].frequency = p.states[i].core_frequency * 1000;
 		if (cur_freq == centrino_model->op_points[i].frequency)
 			p.state = i;
+		if (!p.states[i].core_frequency)
+			centrino_model->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
 	}
 	centrino_model->op_points[p.state_count].frequency = CPUFREQ_TABLE_END;
