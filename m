From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] speedstep-centrino: don't break on FFFFFFFF'ed
	frequencies
Date: Wed, 29 Sep 2004 23:42:14 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040929214214.GA18564@dominikbrodowski.de>
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

Some BIOSes export invalid _PSS entries where all bits are set to one. While
this is totally contrary to the ACPI specification, BIOS vendors try to
tell userspace that these entries should not be considered or used. In order
to not fail on such entries, the speedstep-centrino already contains a
method to ignore these things. However, due to a wrong ordering of checks
the driver aborts nonetheless. So move some checks around.


Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-09-19 13:48:21.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-09-23 18:21:44.637668048 +0200
@@ -415,6 +415,11 @@
 	cur_freq = get_cur_freq(policy->cpu);
 
 	for (i=0; i<p.state_count; i++) {
+		if (!p.states[i].core_frequency) {
+			centrino_model->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
+			continue;
+		}
+		
 		if (extract_clock(centrino_model->op_points[i].index) !=
 		    (centrino_model->op_points[i].frequency)) {
 			printk(KERN_DEBUG "Invalid encoded frequency\n");
@@ -424,8 +429,6 @@
 
 		if (cur_freq == centrino_model->op_points[i].frequency)
 			p.state = i;
-		if (!p.states[i].core_frequency)
-			centrino_model->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
 	}
 
 	return 0;
