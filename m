From: Guillaume Chazarain <guichaz@yahoo.fr>
Subject: [PATCH] Uninitialized use of cmd.val in
	arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:acpi_cpufreq_target()
Date: Tue, 02 Jan 2007 19:58:13 +0100
Message-ID: <459AAB45.2000909@yahoo.fr>
References: <EB12A50964762B4D8111D55B764A8454010D1506@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020605060103070403030505"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454010D1506@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com

This is a multi-part message in MIME format.
--------------020605060103070403030505
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Fix for uninitialized use.

Thanks.

-- 
Guillaume


--------------020605060103070403030505
Content-Type: text/x-patch;
 name="acpi-cpufreq-uninitialized-cmd_val.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="acpi-cpufreq-uninitialized-cmd_val.diff"

cmd.val was used uninitialized on the line below.

Signed-off-by: Guillaume Chazarain <guichaz@yahoo.fr>
Acked-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
---

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

--------------020605060103070403030505
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------020605060103070403030505--

