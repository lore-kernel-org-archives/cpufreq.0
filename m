From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] acpi-cpufreq: force setting of P-State upon resume
Date: Tue, 2 Nov 2004 18:20:21 +0100
Message-ID: <20041102172021.GB28981@dominikbrodowski.de>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Upon resuming from sleep or swsusp, the ACPI P-States driver can't determine
the current CPU frequency, as the ACPI specification doesn't contain a method
to determine the current P-State.

Therefore, _always_ re-set the CPU to the P-State it was before suspending,
and don't abort early if this is the same state as the CPU was put to
before (like it does make sense when using the ondemand governor, for example).

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2004-10-29 17:15:46.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2004-10-31 16:20:50.101200632 +0100
@@ -48,6 +48,7 @@
 struct cpufreq_acpi_io {
 	struct acpi_processor_performance	acpi_data;
 	struct cpufreq_frequency_table		*freq_table;
+	unsigned int				resume;
 };
 
 static struct cpufreq_acpi_io	*acpi_io_data[NR_CPUS];
@@ -119,9 +120,14 @@
 	}
 	
 	if (state == data->acpi_data.state) {
-		dprintk("Already at target state (P%d)\n", state);
-		retval = 0;
-		goto migrate_end;
+		if (unlikely(data->resume)) {
+			dprintk("Called after resume, resetting to P%d\n", state);
+			data->resume = 0;
+		} else {
+			dprintk("Already at target state (P%d)\n", state);
+			retval = 0;
+			goto migrate_end;
+		}
 	}
 
 	dprintk("Transitioning from P%d to P%d\n",
@@ -460,6 +466,20 @@
 	return (0);
 }
 
+static int
+acpi_cpufreq_resume (
+	struct cpufreq_policy   *policy)
+{
+	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+
+
+	dprintk("acpi_cpufreq_resume\n");
+
+	data->resume = 1;
+
+	return (0);
+}
+
 
 static struct freq_attr* acpi_cpufreq_attr[] = {
 	&cpufreq_freq_attr_scaling_available_freqs,
@@ -471,6 +491,7 @@
 	.target 	= acpi_cpufreq_target,
 	.init		= acpi_cpufreq_cpu_init,
 	.exit		= acpi_cpufreq_cpu_exit,
+	.resume		= acpi_cpufreq_resume,
 	.name		= "acpi-cpufreq",
 	.owner		= THIS_MODULE,
 	.attr           = acpi_cpufreq_attr,
