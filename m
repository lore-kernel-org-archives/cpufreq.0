From: Mo <cpufreq-list@mopage.de>
Subject: Celeron M 1.3 Ghz processor not recognized
Date: Sun, 22 May 2005 17:40:44 +0100
Message-ID: <200505221740.44205.cpufreq-list@mopage.de>
Mime-Version: 1.0
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi there,

I have tried several kernels (several 2.6.11.x ones and now 2.6.12-rc4) with 
the same result:

# modprobe acpi-cpufreq
FATAL: Error inserting acpi_cpufreq 
(/lib/modules/2.6.12-rc4/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): 
No such device

#modprobe speedstep-centrino
FATAL: Error inserting speedstep_centrino 
(/lib/modules/2.6.12-rc4/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko): 
No such device

modprobe speetstep-ich
FATAL: Error inserting speedstep_ich 
(/lib/modules/2.6.12-rc4/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-ich.ko): 
No such device

This is the /proc/cpuinfo output:
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Celeron(R) M processor         1300MHz
stepping        : 5
cpu MHz         : 1296.035
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat 
clflush dts acpi mmx fxsr sse sse2
 tm pbe
bogomips        : 2564.09



# lspci
0000:00:00.0 Host bridge: Intel Corp. 82852/855GM Host Bridge (rev 02)
0000:00:00.1 System peripheral: Intel Corp. 855GM/GME GMCH Memory I/O Control 
Registers (rev 02)
0000:00:00.3 System peripheral: Intel Corp. 855GM/GME GMCH Configuration 
Process Registers (rev 02)
0000:00:02.0 VGA compatible controller: Intel Corp. 82852/855GM Integrated 
Graphics Device (rev 02)
0000:00:02.1 Display controller: Intel Corp. 82852/855GM Integrated Graphics 
Device (rev 02)
0000:00:1d.0 USB Controller: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) 
USB UHCI Controller #1 (rev 01)
0000:00:1d.1 USB Controller: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) 
USB UHCI Controller #2 (rev 01)
0000:00:1d.2 USB Controller: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) 
USB UHCI Controller #3 (rev 01)
0000:00:1d.7 USB Controller: Intel Corp. 82801DB/DBM (ICH4/ICH4-M) USB 2.0 
EHCI Controller (rev 01)
0000:00:1e.0 PCI bridge: Intel Corp. 82801 PCI Bridge (rev 81)
0000:00:1f.0 ISA bridge: Intel Corp. 82801DBM LPC Interface Controller (rev 
01)
0000:00:1f.1 IDE interface: Intel Corp. 82801DBM (ICH4) Ultra ATA Storage 
Controller (rev 01)
0000:00:1f.3 SMBus: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) SMBus 
Controller (rev 01)
0000:00:1f.5 Multimedia audio controller: Intel Corp. 82801DB/DBL/DBM 
(ICH4/ICH4-L/ICH4-M) AC'97 Audio Controller (rev 01)
0000:00:1f.6 Modem: Intel Corp. 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) AC'97 
Modem Controller (rev 01)
0000:02:00.0 CardBus bridge: Texas Instruments PCI1510 PC card Cardbus 
Controller
0000:02:08.0 Ethernet controller: Intel Corp. 82801BD PRO/100 VE (MOB) 
Ethernet Controller (rev 81)
0000:03:00.0 Network controller: RaLink Ralink RT2500 802.11 Cardbus Reference 
Card (rev 01)


Any help or hints would be appreciated. This is a IBM Thinkpad R50e this is 
happening on. 

Cheers,
Mo
