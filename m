From: Lars Weissflog <L@rs-w.de>
Subject: Re: 2.4 kernel patch on debian source 2.4.22
Date: Mon, 20 Oct 2003 01:45:36 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1066607136.1501.16.camel@carryme.shs>
References: <002b01c39676$43910270$0100a8c0@bert>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <002b01c39676$43910270$0100a8c0@bert>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi Stephen,

As far as I remember, all cpufreq-patches are agains the stock kernels
from kernel.org. Go there and download the original linux-2.4.2x.tar.bz2
(whatever version x is at this moment; I stopped with 2.4.20 for now,
waiting to go up to 2.6 when it leaves the -testX state)

Then untar those original sources and try to apply the cpufreq-patches
against that. Should work. Another way might be to check out the
modified kernel sources by Alan Cox. You can get them from the
/people/alan tree on kernel.org. They have an -ac attached to the
version number and normally include - more or less - the latest
acpi-stuff. And maybe they include the cpufreq-stuff as well. 
But in any case you should be fine with the stock 2.4.2x-sources.

Good luck and good night.
Lars

On Sun, 2003-10-19 at 21:21, Stephen English wrote:
> Hi all,
> First, thanks to all that contributed to creating this software - it looks
> great. However, I can't get it to patch the debian kernel sources I
> downloaded. Basically, I get this on a fresh extraction of the kernel:
> 
> bex:/usr/src/cpufreq# ./patchin.sh /usr/src/linux
> patching file Documentation/00-INDEX
> patching file Documentation/Configure.help
> Hunk #1 succeeded at 27057 (offset 80 lines).
> Hunk #2 succeeded at 27458 (offset 80 lines).
> patching file Makefile
> Hunk #1 succeeded at 199 (offset 5 lines).
> patching file arch/i386/config.in
> Hunk #1 succeeded at 195 (offset 1 line).
> patching file arch/i386/boot/setup.S
> patching file arch/i386/kernel/Makefile
> Hunk #2 FAILED at 44.
> 1 out of 2 hunks FAILED -- saving rejects to file
> arch/i386/kernel/Makefile.rej
> patching file arch/i386/kernel/i386_ksyms.c
> patching file arch/i386/kernel/setup.c
> Hunk #3 succeeded at 207 (offset 4 lines).
> Hunk #4 succeeded at 1150 (offset 10 lines).
> patching file arch/i386/kernel/time.c
> patching file drivers/Makefile
> patching file include/asm-i386/ist.h
> patching file include/asm-i386/msr.h
> patching file include/asm-i386/smp.h
> patching file include/linux/smp.h
> bex:/usr/src/cpufreq# cd ..
> bex:/usr/src# cat linux/arch/i386/kernel/Makefile.rej
> ***************
> *** 43,47 ****
>   obj-$(CONFIG_X86_LOCAL_APIC)  += mpparse.o apic.o nmi.o
>   obj-$(CONFIG_X86_IO_APIC)     += io_apic.o
>   obj-$(CONFIG_X86_VISWS_APIC)  += visws_apic.o
> 
>   include $(TOPDIR)/Rules.make
> --- 44,60 ----
>   obj-$(CONFIG_X86_LOCAL_APIC)  += mpparse.o apic.o nmi.o
>   obj-$(CONFIG_X86_IO_APIC)     += io_apic.o
>   obj-$(CONFIG_X86_VISWS_APIC)  += visws_apic.o
> + obj-$(CONFIG_X86_POWERNOW_K6) += powernow-k6.o
> + obj-$(CONFIG_X86_POWERNOW_K7) += powernow-k7.o
> + obj-$(CONFIG_X86_POWERNOW_K8) += powernow-k8.o
> + obj-$(CONFIG_X86_LONGHAUL)    += longhaul.o
> + obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)  += speedstep-centrino.o
> + obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)     += speedstep-piix4.o speedstep-lib.o
> + obj-$(CONFIG_X86_SPEEDSTEP_SMI)       += speedstep-smi.o speedstep-lib.o
> + obj-$(CONFIG_X86_SPEEDSTEP_ICH)       += speedstep-ich.o speedstep-lib.o
> + obj-$(CONFIG_X86_P4_CLOCKMOD) += p4-clockmod.o
> + obj-$(CONFIG_ELAN_CPUFREQ)    += elanfreq.o
> + obj-$(CONFIG_X86_LONGRUN)     += longrun.o
> + obj-$(CONFIG_X86_GX_SUSPMOD)  += gx-suspmod.o
> 
>   include $(TOPDIR)/Rules.make
> 
> Any info on how to remedy this would be greatly appreciated.
> 
> Thanks,
> 
> Stephen English
-- 
LarsWeissflog
L@rs-W dot DE
