From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: 2.4 patch and powernow-k8
Date: Fri, 3 Dec 2004 10:09:55 +0100
Message-ID: <20041203090955.GC9288@dominikbrodowski.de>
References: <41AF938B.4080204@danhartman.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41AF938B.4080204@danhartman.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: omv <omv@danhartman.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Dec 02, 2004 at 02:13:31PM -0800, omv wrote:
> make[1]: Leaving directory `/usr/src/linux-2.4.28/arch/i386/lib'
> ld -m elf_i386 -T /usr/src/linux-2.4.28/arch/i386/vmlinux.lds -e stext 
> arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o 
> init/version.o init/do_mounts.o \
>        --start-group \
>        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o 
> mm/mm.o fs/fs.o ipc/ipc.o \
>         drivers/acpi/acpi.o drivers/char/char.o drivers/block/block.o 
> drivers/misc/misc.o drivers/net/net.o drivers/char/agp/agp.o 
> drivers/char/drm/drm.o drivers/ide/idedriver.o drivers/scsi/scsidrv.o 
> drivers/cdrom/driver.o drivers/pci/driver.o drivers/pcmcia/pcmcia.o 
> drivers/pnp/pnp.o drivers/video/video.o drivers/media/media.o 
> drivers/input/inputdrv.o drivers/cpufreq/built-in.o \
>        net/network.o \
>        /usr/src/linux-2.4.28/arch/i386/lib/lib.a 
> /usr/src/linux-2.4.28/lib/lib.a /usr/src/linux-2.4.28/arch/i386/lib/lib.a \
>        --end-group \
>        -o vmlinux
> arch/i386/kernel/kernel.o(.data+0x1d80): In function `trampoline_end':
> : undefined reference to `local symbols in discarded section .text.exit'
> make: *** [vmlinux] Error 1
> [root@queue38 linux-2.4.28]#

Could you try out removing the "__devexit_p" in 
static struct cpufreq_driver cpufreq_amd64_driver = {
        .verify = powernowk8_verify,
        .target = powernowk8_target,
        .init = powernowk8_cpu_init,
        .exit = __devexit_p(powernowk8_cpu_exit),
        .get = powernowk8_get,
, i.e. modifying the .exit line to
	.exit = powernowk8_cpu_exit

and remove the __devexit from
static int __devexit powernowk8_cpu_exit (struct cpufreq_policy *pol)

in powernow-k8.c

Thanks,
	Dominik
