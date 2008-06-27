From: Marcin Juszkiewicz <marcin@haerwu.biz>
Subject: [PATCH] unbreak conservative governor
Date: Fri, 27 Jun 2008 19:47:57 +0200
Message-ID: <200806271947.57855.marcin@haerwu.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


I tried to get rid of as much as possible from kernel configuration to
get kernel which will fit in flash partition (1.2MB limit). Tried many
things and then got to cpufreq governors. When "ondemand" was enabled to
be compiled into kernel everything was OK, but with "conservative" (which
is suggested for PDA devices) building failed with this error:

  LD      .tmp_vmlinux1
arch/arm/mach-pxa/built-in.o: In function `pxa_set_target':
corgi_pm.c:(.text+0x1568): undefined reference to `cpufreq_frequency_table_target'
arch/arm/mach-pxa/built-in.o: In function `pxa_verify_policy':
corgi_pm.c:(.text+0x16c4): undefined reference to `cpufreq_frequency_table_verify'
arch/arm/mach-pxa/built-in.o: In function `pxa_cpufreq_init':
corgi_pm.c:(.init.text+0x854): undefined reference to `cpufreq_frequency_table_cpuinfo'
make: *** [.tmp_vmlinux1] Error 1

Patch below fix it for Sharp Zaurus c7x0 line.

Signed-off-by: Marcin Juszkiewicz <openembedded@haerwu.biz>

---
 drivers/cpufreq/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-2.6.25.orig/drivers/cpufreq/Kconfig
+++ linux-2.6.25/drivers/cpufreq/Kconfig
@@ -168,10 +168,11 @@ config CPU_FREQ_GOV_ONDEMAND
          If in doubt, say N.

 config CPU_FREQ_GOV_CONSERVATIVE
        tristate "'conservative' cpufreq governor"
        depends on CPU_FREQ
+       select CPU_FREQ_TABLE
        help
          'conservative' - this driver is rather similar to the 'ondemand'
          governor both in its source code and its purpose, the difference is
          its optimisation for better suitability in a battery powered
          environment.  The frequency is gracefully increased and decreased
