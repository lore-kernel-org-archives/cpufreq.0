From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] cpufreq: set policy->curfreq on initialization
Date: Fri, 15 Dec 2006 19:52:45 +0100
Message-ID: <20061215185245.GD5980@inferi.kami.home>
References: <20061213231653.GQ2418@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061213231653.GQ2418@redhat.com>
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
Cc: cpufreq@lists.linux.org.uk

Check the correct variable and set policy->cur upon acpi-cpufreq
initialization to allow the userspace governor to be used as default.

Signed-off-by: Mattia Dongili <malattia@linux.it>
Acked-by: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Signed-off-by: Andrew Morton <akpm@osdl.org>
---

 arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c~cpufreq-set-policy-curfreq-on-initialization arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c~cpufreq-set-policy-curfreq-on-initialization
+++ a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -699,14 +699,14 @@ static int acpi_cpufreq_cpu_init(struct 
 	if (result)
 		goto err_freqfree;
 
-	switch (data->cpu_feature) {
+	switch (perf->control_register.space_id) {
 	case ACPI_ADR_SPACE_SYSTEM_IO:
 		/* Current speed is unknown and not detectable by IO port */
 		policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
 		break;
 	case ACPI_ADR_SPACE_FIXED_HARDWARE:
 		acpi_cpufreq_driver.get = get_cur_freq_on_cpu;
-		get_cur_freq_on_cpu(cpu);
+		policy->cur = get_cur_freq_on_cpu(cpu);
 		break;
 	default:
 		break;
_
