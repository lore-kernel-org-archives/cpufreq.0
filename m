From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 4/4] speedstep-centrino: properly set current state in ACPI
	struct
Date: Fri, 20 Feb 2004 09:44:57 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040220084457.GD10473@dominikbrodowski.de>
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
To: davej@redhat.com, jeremy@goop.org
Cc: cpufreq@www.linux.org.uk

Properly set the current state in the ACPI data so that it reflects the actual CPU speed.

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    5 +++++
 1 files changed, 5 insertions(+)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-02-19 20:41:17.087846464 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-02-19 21:02:49.218412760 +0100
@@ -263,6 +263,7 @@
 	union acpi_object		arg0 = {ACPI_TYPE_BUFFER};
 	u32				arg0_buf[3];
 	struct acpi_object_list 	arg_list = {1, &arg0};
+	unsigned long			cur_freq;
 	int				result = 0, i;
 
 	/* _PDC settings */
@@ -329,9 +330,13 @@
                 goto err_kfree;
         }
 
+	cur_freq = get_cur_freq();
+
         for (i=0; i<p.state_count; i++) {
 		centrino_model->op_points[i].index = p.states[i].control;
 		centrino_model->op_points[i].frequency = p.states[i].core_frequency * 1000;
+		if (cur_freq == centrino_model->op_points[i].frequency)
+			p.state = i;
 	}
 	centrino_model->op_points[p.state_count].frequency = CPUFREQ_TABLE_END;
