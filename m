From: Venki Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] acpi-cpufreq: Proper ReadModifyWrite of PERF_CTL MSR
Date: Wed, 23 May 2007 15:42:13 -0700
Message-ID: <20070523224213.GA15887@linux-os.sc.intel.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Len Brown <len.brown@intel.com>, cpufreq <cpufreq@www.linux.org.uk>


During recent acpi-cpufreq changes, writing to PERF_CTL msr
changed from RMW of entire 64 bit to RMW of low 32 bit and clearing of
upper 32 bit. Fix it back to do a proper RMW of the MSR.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.22-rc-mm/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.22-rc-mm.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.22-rc-mm/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -167,11 +167,13 @@ static void do_drv_read(struct drv_cmd *
 
 static void do_drv_write(struct drv_cmd *cmd)
 {
-	u32 h = 0;
+	u32 lo, hi;
 
 	switch (cmd->type) {
 	case SYSTEM_INTEL_MSR_CAPABLE:
-		wrmsr(cmd->addr.msr.reg, cmd->val, h);
+		rdmsr(cmd->addr.msr.reg, lo, hi);
+		lo = (lo & ~INTEL_MSR_RANGE) | (cmd->val & INTEL_MSR_RANGE);
+		wrmsr(cmd->addr.msr.reg, lo, hi);
 		break;
 	case SYSTEM_IO_CAPABLE:
 		acpi_os_write_port((acpi_io_address)cmd->addr.io.port,
@@ -372,7 +374,6 @@ static int acpi_cpufreq_target(struct cp
 	struct cpufreq_freqs freqs;
 	cpumask_t online_policy_cpus;
 	struct drv_cmd cmd;
-	unsigned int msr;
 	unsigned int next_state = 0; /* Index into freq_table */
 	unsigned int next_perf_state = 0; /* Index into perf table */
 	unsigned int i;
@@ -417,11 +418,7 @@ static int acpi_cpufreq_target(struct cp
 	case SYSTEM_INTEL_MSR_CAPABLE:
 		cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
 		cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
-		msr =
-		    (u32) perf->states[next_perf_state].
-		    control & INTEL_MSR_RANGE;
-		cmd.val = get_cur_val(online_policy_cpus);
-		cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;
+		cmd.val = (u32) perf->states[next_perf_state].control;
 		break;
 	case SYSTEM_IO_CAPABLE:
 		cmd.type = SYSTEM_IO_CAPABLE;
