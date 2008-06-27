From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: [PATCH] unbreak conservative governor
Date: Fri, 27 Jun 2008 14:16:14 -0400
Message-ID: <20080627181614.GB2027@codemonkey.org.uk>
References: <200806271947.57855.marcin@haerwu.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200806271947.57855.marcin@haerwu.biz>
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
To: Marcin Juszkiewicz <marcin@haerwu.biz>
Cc: cpufreq@lists.linux.org.uk

On Fri, Jun 27, 2008 at 07:47:57PM +0200, Marcin Juszkiewicz wrote:
 > 
 > I tried to get rid of as much as possible from kernel configuration to
 > get kernel which will fit in flash partition (1.2MB limit). Tried many
 > things and then got to cpufreq governors. When "ondemand" was enabled to
 > be compiled into kernel everything was OK, but with "conservative" (which
 > is suggested for PDA devices) building failed with this error:
 > 
 >   LD      .tmp_vmlinux1
 > arch/arm/mach-pxa/built-in.o: In function `pxa_set_target':
 > corgi_pm.c:(.text+0x1568): undefined reference to `cpufreq_frequency_table_target'
 > arch/arm/mach-pxa/built-in.o: In function `pxa_verify_policy':
 > corgi_pm.c:(.text+0x16c4): undefined reference to `cpufreq_frequency_table_verify'
 > arch/arm/mach-pxa/built-in.o: In function `pxa_cpufreq_init':
 > corgi_pm.c:(.init.text+0x854): undefined reference to `cpufreq_frequency_table_cpuinfo'
 > make: *** [.tmp_vmlinux1] Error 1

This looks more like corgi_pm should depend on the table code, not the governor.

	Dave

-- 
http://www.codemonkey.org.uk
