From: Mattia Dongili <malattia@linux.it>
Subject: Re: linux-2.6.19-rc6-g1b9bb3c1 build #128 failed
Date: Fri, 17 Nov 2006 20:37:59 +0100
Message-ID: <20061117193759.GD12979@inferi.kami.home>
References: <200611171353.36458.toralf.foerster@gmx.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200611171353.36458.toralf.foerster@gmx.de>
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
To: Toralf F???rster <toralf.foerster@gmx.de>
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk

On Fri, Nov 17, 2006 at 01:53:34PM +0100, Toralf F???rster wrote:
...
>   LD      .tmp_vmlinux1
> drivers/built-in.o: In function `powersave_bias_target':
> cpufreq_ondemand.c:(.text+0x58000): undefined reference to
>  `cpufreq_frequency_table_target' cpufreq_ondemand.c:(.text+0x5804c):
>  undefined reference to `cpufreq_frequency_table_target'
>  cpufreq_ondemand.c:(.text+0x58074): undefined reference to
>  `cpufreq_frequency_table_target' drivers/built-in.o: In function
>  `ondemand_powersave_bias_init':
> cpufreq_ondemand.c:(.text+0x58103): undefined reference to
>  `cpufreq_frequency_get_table' make: *** [.tmp_vmlinux1] Error 1
> 
> Here's the config:
...
> CONFIG_CPU_FREQ_TABLE=m
...
> CONFIG_CPU_FREQ_GOV_ONDEMAND=y

This seems to needed to allow CONFIG_CPU_FREQ_GOV_ONDEMAND=y

Signed-off-by: Mattia Dongili <malattia@linux.it>
---

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 2cc71b6..491779a 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -107,6 +107,7 @@ config CPU_FREQ_GOV_USERSPACE
 
 config CPU_FREQ_GOV_ONDEMAND
 	tristate "'ondemand' cpufreq policy governor"
+	select CPU_FREQ_TABLE
 	help
 	  'ondemand' - This driver adds a dynamic cpufreq policy governor.
 	  The governor does a periodic polling and 
