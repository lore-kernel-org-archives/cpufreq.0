From: omv <omv@danhartman.org>
Subject: 2.4 patch and powernow-k8
Date: Thu, 02 Dec 2004 14:13:31 -0800
Message-ID: <41AF938B.4080204@danhartman.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

I've been trying to patch cpufreq into a recent 2.4 kernel and having 
some problems.  When I've config'ed powernow-k8 to be static linked, I 
get the below errors.  Compiling as a module works, but yields 
unresolvable symbols when trying to load the module.

The speedstep-centrino seems to build fine (though I can't test it on my 
laptop), and I'm guessing there is a build issue in which symbols are 
exported.  However, I don't actually understand the build process enough 
to make any headway...

BTW:  I've tried on kernels 2.4.25 -> 2.4.28, and tried a couple 
different snapshots from ftp://ftp.linux.org.uk/pub/linux/cpufreq/ as 
well as the latest stuff in the cvs repository.

Any help would be appreciated,

-dan


make[1]: Leaving directory `/usr/src/linux-2.4.28/arch/i386/lib'
ld -m elf_i386 -T /usr/src/linux-2.4.28/arch/i386/vmlinux.lds -e stext 
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o 
init/version.o init/do_mounts.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o 
mm/mm.o fs/fs.o ipc/ipc.o \
         drivers/acpi/acpi.o drivers/char/char.o drivers/block/block.o 
drivers/misc/misc.o drivers/net/net.o drivers/char/agp/agp.o 
drivers/char/drm/drm.o drivers/ide/idedriver.o drivers/scsi/scsidrv.o 
drivers/cdrom/driver.o drivers/pci/driver.o drivers/pcmcia/pcmcia.o 
drivers/pnp/pnp.o drivers/video/video.o drivers/media/media.o 
drivers/input/inputdrv.o drivers/cpufreq/built-in.o \
        net/network.o \
        /usr/src/linux-2.4.28/arch/i386/lib/lib.a 
/usr/src/linux-2.4.28/lib/lib.a /usr/src/linux-2.4.28/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
arch/i386/kernel/kernel.o(.data+0x1d80): In function `trampoline_end':
: undefined reference to `local symbols in discarded section .text.exit'
make: *** [vmlinux] Error 1
[root@queue38 linux-2.4.28]#
