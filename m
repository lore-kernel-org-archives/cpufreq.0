From: Russell King <rmk@arm.linux.org.uk>
Subject: [BUG] 2.6.0: ARM won't build without CONFIG_CPU_FREQ_GOV_USERSPACE=y
Date: Thu, 25 Dec 2003 16:00:16 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031225160016.B9029@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

Trying to build ARM for assabet with 2.6.0, CONFIG_CPU_FREQ_GOV_USERSPACE
unset or as a module causes the following errors:

cpufreq_get() is rather central to ARM support since several drivers,
including SDRAM drivers need to know the CPU core clock rate in other
to function.

We therefore can not have this function in a module.

arch/arm/mach-sa1100/built-in.o(.init.text+0x32c): In function `sa1110_clk_init':
: undefined reference to `cpufreq_gov_userspace_init'
drivers/built-in.o(.text+0x3e1fc): In function `sa1100fb_check_var':
: undefined reference to `cpufreq_get'
drivers/built-in.o(.text+0x3e524): In function `sa1100fb_activate_var':
: undefined reference to `cpufreq_get'
drivers/built-in.o(.text+0x4fe84): In function `sa1100_pcmcia_set_io_map':
: undefined reference to `cpufreq_get'
drivers/built-in.o(.text+0x4ff74): In function `sa1100_pcmcia_set_mem_map':
: undefined reference to `cpufreq_get'
drivers/built-in.o(.text+0x5006c): In function `show_status':
: undefined reference to `cpufreq_get'
drivers/built-in.o(.text+0x50540): more undefined references to `cpufreq_get' follow
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [zImage] Error 2

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
