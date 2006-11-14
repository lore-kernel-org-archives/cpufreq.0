From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] Fix the bug in duplicate freq elimination code in
	acpi-cpufreq
Date: Mon, 13 Nov 2006 17:47:44 -0800
Message-ID: <20061113174744.A24785@unix-os.sc.intel.com>
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
To: cpufreq <cpufreq@www.linux.org.uk>, Dave Jones <davej@redhat.com>, Andrew Morton <akpm@osdl.org>
Cc: alexey.y.starikovskiy@intel.com


Fix the bug in duplicate states elimination in acpi-cpufreq.

Bug: Due to duplicate state elimiation in the loop earlier, the number
of valid_states can be less than perf->state_count, in which case
freq_table was ending up with some garbage/uninitialized entries
in the table.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
From:  Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>


---

 arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
index 60d20cf..18f4715 100644
--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -693,7 +693,7 @@ #endif
 		    perf->states[i].core_frequency * 1000;
 		valid_states++;
 	}
-	data->freq_table[perf->state_count].frequency = CPUFREQ_TABLE_END;
+	data->freq_table[valid_states].frequency = CPUFREQ_TABLE_END;
 
 	result = cpufreq_frequency_table_cpuinfo(policy, data->freq_table);
 	if (result)
