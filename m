From: borooty <bpfr83@gmx.de>
Subject: sony vaio pcg-sr11k - intel p3 mobile coppermine problem
Date: Mon, 20 Aug 2007 14:05:02 +0200
Message-ID: <20070820140502.6592b9d6@helium.core.nexus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

dear cpufreq list gurus and members,

i would like to use the speedstep feature on a sony vaio sr11k,
but speedstep-smi does not load.

localhost ~ # modprobe speedstep-smi
FATAL: Error inserting speedstep_smi
(/lib/modules/2.6.22-gentoo-r2/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko):
No such device

even no success with speedstep_lib relaxed_check=1 and speedstep-smi
smi_port=0xb2 smi_cmd=0x82 smi_sig=1

here is some debug-info from dmesg:

localhost ~ # dmesg
speedstep-lib: x86: 6, model: 8
speedstep-lib: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x46c80020, 0x0
speedstep-lib: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x5a560000
speedstep-smi: signature:0x47534943, command:0x008000b2, event:0x000000b3,
perf_level:0x07d00100.
speedstep-smi: trying to obtain ownership with command 47534980 at port b2
speedstep-smi: result is 0
speedstep-smi: trying to determine frequencies with command 47534980 at port
b2
speedstep-smi: result 47534980, low_freq 0, high_freq 4
speedstep-smi: could not detect low and high frequencies by SMI call.
speedstep-lib: trying to determine both speeds
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
speedstep-lib: speed is 600000
speedstep-lib: previous speed is 600000
speedstep-smi: trying to set frequency to state 1 with command 47534980 at
port b2
speedstep-smi: retry 1, previous result 0, waiting...
speedstep-smi: retry 2, previous result 0, waiting...
speedstep-smi: retry 3, previous result 0, waiting...
speedstep-smi: retry 4, previous result 0, waiting...
speedstep-smi: retry 5, previous result 0, waiting...
cpufreq: change failed with new_state 2 and result 0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
speedstep-lib: speed is 600000
speedstep-lib: low speed is 600000
speedstep-smi: trying to set frequency to state 0 with command 47534980 at
port b2
speedstep-smi: retry 1, previous result 0, waiting...
speedstep-smi: retry 2, previous result 0, waiting...
speedstep-smi: retry 3, previous result 0, waiting...
speedstep-smi: retry 4, previous result 0, waiting...
speedstep-smi: retry 5, previous result 0, waiting...
cpufreq: change failed with new_state 2 and result 0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x46c80020 0x0
speedstep-lib: speed is 600000
speedstep-lib: high speed is 600000
speedstep-smi: could not detect two different speeds -- aborting.

and further information:

Gentoo Linux, 2.6.22 and 2.6.23-rc3

localhost ~ # cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 3
cpu MHz         : 599.652
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat
pse36 mmx fxsr sse
bogomips        : 1200.00
clflush size    : 32

localhost ~ # cat /proc/acpi/processor/CPU0/info 
processor id:            0
acpi id:                 0
bus mastering control:   yes
power management:        yes
throttling control:      yes
limit interface:         yes


calhost ~ # dmidecode -t bios
# dmidecode 2.9
SMBIOS 2.1 present.

Handle 0x0000, DMI type 0, 19 bytes
BIOS Information
        Vendor: Phoenix Technologies LTD
        Version: R0205D1
        Release Date: 09/05/00
        Address: 0xE9E40
        Runtime Size: 90560 bytes
        ROM Size: 512 kB
        Characteristics:
                ISA is supported
                PCI is supported
                PC Card (PCMCIA) is supported
                PNP is supported
                APM is supported
                BIOS is upgradeable
                BIOS shadowing is allowed
                ACPI is supported
                USB legacy is supported
                AGP is supported
                IEEE 1394 boot is supported
                Smart battery is supported


localhost ~ # dmidecode -t processor
# dmidecode 2.9
SMBIOS 2.1 present.

Handle 0x0004, DMI type 4, 32 bytes
Processor Information
        Socket Designation: MMO Con1
        Type: Central Processor
        Family: Pentium III
        Manufacturer: GenuineIntel
        ID: 83 06 00 00 FF F9 87 03
        Signature: Type 0, Family 6, Model 8, Stepping 3
        Flags:
                FPU (Floating-point unit on-chip)
                VME (Virtual mode extension)
                DE (Debugging extension)
                PSE (Page size extension)
                TSC (Time stamp counter)
                MSR (Model specific registers)
                PAE (Physical address extension)
                MCE (Machine check exception)
                CX8 (CMPXCHG8 instruction supported)
                SEP (Fast system call)
                MTRR (Memory type range registers)
                PGE (Page global enable)
                MCA (Machine check architecture)
                CMOV (Conditional move instruction supported)
                PAT (Page attribute table)
                PSE-36 (36-bit page size extension)
                PSN (Processor serial number present and enabled)
                MMX (MMX technology supported)
                FXSR (Fast floating-point save and restore)
                SSE (Streaming SIMD extensions)
        Version: Pentium(R) III
        Voltage: 2.9 V
        External Clock: Unknown
        Max Speed: 300 MHz                                      // FALSE 
        Current Speed: 600 MHz
        Status: Populated, Enabled
        Upgrade: ZIF Socket
        L1 Cache Handle: No L1 Cache
        L2 Cache Handle: 0x000A
        L3 Cache Handle: No L3 Cache


localhost ~ # lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host
bridge [8086:7190] (rev 03)
00:01.0 PCI bridge [0604]: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP
bridge [8086:7191] (rev 03)
00:07.0 ISA bridge [0601]: Intel Corporation 82371AB/EB/MB PIIX4 ISA
[8086:7110] (rev 02)
00:07.1 IDE interface [0101]: Intel Corporation 82371AB/EB/MB PIIX4 IDE
[8086:7111] (rev 01)
00:07.2 USB Controller [0c03]: Intel Corporation 82371AB/EB/MB PIIX4 USB
[8086:7112] (rev 01)
00:07.3 Bridge [0680]: Intel Corporation 82371AB/EB/MB PIIX4 ACPI [8086:7113]
(rev 03)
00:08.0 FireWire (IEEE 1394) [0c00]: Sony Corporation CXD3222 i.LINK
Controller [104d:8039] (rev 02)
00:09.0 Multimedia audio controller [0401]: Yamaha Corporation YMF-754 [DS-1E
Audio Controller] [1073:0012]
00:0a.0 Communication controller [0780]: Conexant HSF 56k Data/Fax Modem (Mob
WorldW SmartDAA) [14f1:2443] (rev 01)
00:0c.0 CardBus bridge [0607]: Ricoh Co Ltd RL5c475 [1180:0475] (rev 80)
01:00.0 VGA compatible controller [0300]: S3 Inc. 86C270-294 Savage/IX-MV
[5333:8c12] (rev 11)

localhost ~ # cat /proc/ioports 
0000-001f : dma1
0020-0021 : pic1
0022-0022 : ACPI PM2_CNT_BLK
0040-0043 : timer0
0050-0053 : timer1
0060-006f : keyboard
0070-0077 : rtc
0080-008f : dma page reg
00a0-00a1 : pic2
00c0-00df : dma2
00f0-00ff : fpu
0170-0177 : 0000:00:07.1
01f0-01f7 : 0000:00:07.1
01f0-01f7 : ide0
0300-031f : pcmcia_socket0
0376-0376 : 0000:00:07.1
0398-0399 : pnp 00:01
03c0-03df : vga+
03c0-03df : vesafb
03f6-03f6 : 0000:00:07.1
03f6-03f6 : ide0
04d0-04d1 : pnp 00:01
0cf8-0cff : PCI conf1
1040-104f : 0000:00:07.3
1040-104f : pnp 00:01
1800-14ff : PCI CardBus #02
1800-18ff : PCI CardBus #02
8000-803f : 0000:00:07.3
  8000-8003 : ACPI PM1a_EVT_BLK
  8008-800b : ACPI PM_TMR
  800c-800f : ACPI GPE0_BLK
  8010-8015 : ACPI CPU throttle
8042-8043 : ACPI PM1a_CNT_BLK
fc40-fc7f : 0000:00:09.0
fcc0-fcdf : 0000:00:07.2
fcc0-fcdf : uhci_hcd
fce0-fce7 : 0000:00:0a.0
fcec-fcef : 0000:00:09.0
fcf0-fcff : 0000:00:07.1
fcf0-fcf7 : ide0
fcf8-fcff : ide1

have already fixed the broken DSDT table but that was not usefull in that case.

from the BIOS point of view the CPU is an intel pentium 3 mobile.
is there are chance to get things working w/o the official intel cpu specs?

regards
netzpython

germany/bavaria
