From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] acpi-cpufreq: Make cpuinfo_cur_freq work again
Date: Fri, 22 Sep 2006 17:14:10 -0700
Message-ID: <20060922171410.A811@unix-os.sc.intel.com>
References: <20060901141020.H14821@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060901141020.H14821@unix-os.sc.intel.com>;
	from venkatesh.pallipadi@intel.com on Fri, Sep 01, 2006 at
	02:10:20PM -0700
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>


Recent speedstep-centrino unification onto acpi-cpufreq patchset broke
cpuinfo_cur_freq interface in /sys/../cpuinfo/, when MSR was used for
transitions. Attached patch fixes that breakage.

Applies over the patchset with subject
Unify ACPI bits on speedstep-centrino and acpi-cpufreq

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18-rc4.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -102,10 +102,13 @@ static unsigned extract_io(u32 value, st
 static unsigned extract_msr(u32 msr, struct acpi_cpufreq_data *data)
 {
 	int i;
+	struct acpi_processor_performance *perf;
 
 	msr &= INTEL_MSR_RANGE;
+	perf = data->acpi_data;
+
 	for (i = 0; data->freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
-		if (msr == data->freq_table[i].index)
+		if (msr == perf->states[data->freq_table[i].index].status)
 			return data->freq_table[i].frequency;
 	}
 	return data->freq_table[0].frequency;
