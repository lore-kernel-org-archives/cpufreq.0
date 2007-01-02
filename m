From: Guillaume Chazarain <guichaz@yahoo.fr>
Subject: Uninitialized use of cmd.val in
	arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:423
Date: Tue, 02 Jan 2007 16:49:17 +0100
Message-ID: <459A7EFD.2040204@yahoo.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080701080105080409010501"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------080701080105080409010501
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

In arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:acpi_cpufreq_target()
cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;

cmd.val seems to be used uninitialized. So, one of the attached patch
should be needed. Both patches, and no patch at all, work for me though.

This is linux-2.6.20-rc3 and the code is really executed (I traced it) with
my Pentium M.

Thanks.

-- 
Guillaume


--------------080701080105080409010501
Content-Type: text/plain;
 name="acpi-cpufreq-uninitialized-cmd_val1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="acpi-cpufreq-uninitialized-cmd_val1"

diff -r 90710ed1291f arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	Mon Jan 01 01:00:04 2007 +0000
+++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	Tue Jan 02 16:26:29 2007 +0100
@@ -372,7 +372,6 @@ static int acpi_cpufreq_target(struct cp
 	struct cpufreq_freqs freqs;
 	cpumask_t online_policy_cpus;
 	struct drv_cmd cmd;
-	unsigned int msr;
 	unsigned int next_state = 0;
 	unsigned int next_perf_state = 0;
 	unsigned int i;
@@ -417,10 +416,9 @@ static int acpi_cpufreq_target(struct cp
 	case SYSTEM_INTEL_MSR_CAPABLE:
 		cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
 		cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
-		msr =
+		cmd.val =
 		    (u32) perf->states[next_perf_state].
 		    control & INTEL_MSR_RANGE;
-		cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;
 		break;
 	case SYSTEM_IO_CAPABLE:
 		cmd.type = SYSTEM_IO_CAPABLE;

--------------080701080105080409010501
Content-Type: text/plain;
 name="acpi-cpufreq-uninitialized-cmd_val2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="acpi-cpufreq-uninitialized-cmd_val2"

diff -r 90710ed1291f arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	Mon Jan 01 01:00:04 2007 +0000
+++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	Tue Jan 02 16:27:47 2007 +0100
@@ -420,6 +420,7 @@ static int acpi_cpufreq_target(struct cp
 		msr =
 		    (u32) perf->states[next_perf_state].
 		    control & INTEL_MSR_RANGE;
+		cmd.val = get_cur_val(online_policy_cpus);
 		cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;
 		break;
 	case SYSTEM_IO_CAPABLE:

--------------080701080105080409010501
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------080701080105080409010501--

