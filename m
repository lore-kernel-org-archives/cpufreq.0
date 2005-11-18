From: Luca <luca.foppiano@gmail.com>
Subject: Re: cpufreq on Coppermine
Date: Fri, 18 Nov 2005 20:39:03 +0100
Message-ID: <460afdfa0511181139p40db432fm544e480f554e9a0@mail.gmail.com>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
	<20051118154149.GA2104@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051118154149.GA2104@poupinou.org>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

On 11/18/05, Bruno Ducrot <ducrot@poupinou.org> wrote:

> You could eventually try with
> ftp://ftp.poupinou.org/dont_use/old/speedstep_bx.tar.gz
>
> I don't think it will work with a 2.6 kernel though, but just for
> testing purpose...
>
> You have to explicitely replace line 42:
> /* #define I_WANT_SPEEDSTEP */
> with
> #define I_WANT_SPEEDSTEP
>
> If that work, I will see if I found time to update cpufreq driver then.

pj@cristal:/usr/local/src/speedstep_bx$ sudo make
gcc -D__KERNEL__ -O2 -Wall -Wstrict-prototypes -Wno-trigraphs
-fomit-frame-pointer -fno-strict-aliasing -fno-common
-I/lib/modules/`uname -r`/build/include -D_LINUX  -DMODULE
-DMODVERSIONS -include /lib/modules/`uname
-r`/build/include/linux/modversions.h -c -o speedstep.o speedstep.c
cc1: error: /lib/modules/2.6.14p3.laptop.cfd/build/include/linux/modversion=
s.h:
No such file or directory
In file included from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/irq.h:21,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/asm/hardirq.h:6,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/hardirq.h:7,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/interrupt.h:11,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/rcuref.h:36,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/fs.h:12,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/proc_fs.h:6,
                from speedstep.c:33:
/lib/modules/2.6.14p3.laptop.cfd/build/include/asm/irq.h:16:25: error:
irq_vectors.h: No such file or directory
In file included from
/lib/modules/2.6.14p3.laptop.cfd/build/include/asm/hardirq.h:6,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/hardirq.h:7,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/interrupt.h:11,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/rcuref.h:36,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/fs.h:12,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/proc_fs.h:6,
                from speedstep.c:33:
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/irq.h:84: error:
'NR_IRQS' undeclared here (not in a function)
In file included from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/irq.h:93,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/asm/hardirq.h:6,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/hardirq.h:7,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/interrupt.h:11,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/rcuref.h:36,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/fs.h:12,
                from
/lib/modules/2.6.14p3.laptop.cfd/build/include/linux/proc_fs.h:6,
                from speedstep.c:33:
/lib/modules/2.6.14p3.laptop.cfd/build/include/asm/hw_irq.h:30: error:
'NR_IRQ_VECTORS' undeclared here (not in a function)
speedstep.c: In function 'speedstep_initialize':
speedstep.c:491: warning: implicit declaration of function 'pci_find_subsys=
'
speedstep.c:495: warning: assignment makes pointer from integer without a c=
ast
speedstep.c:502: warning: assignment makes pointer from integer without a c=
ast
make: *** [speedstep.o] Error 1
pj@cristal:/usr/local/src/speedstep_bx$

I think don't work with 2.6 kernel...
>
> BTW, be sure to read carrefully
> http://www.poupinou.org/cpufreq/speedstep-piix4.html
I try to use dmidecode and this is the result:

biosdecode:
# biosdecode 2.7
SMBIOS 2.3 present.
       Structure Table Length: 2000 bytes
       Structure Table Address: 0x000E7010
       Number Of Structures: 49
       Maximum Structure Size: 204 bytes
ACPI 1.0 present.
       OEM Identifier: NEC
       RSD Table 32-bit Address: 0x0FFFB88E
BIOS32 Service Directory present.
       Revision: 0
       Calling Interface Address: 0x000FD8A0
PNP BIOS 1.0 present.
       Event Notification: Not Supported
       Real Mode 16-bit Code Address: F000:8562
       Real Mode 16-bit Data Address: 0040:0000
       16-bit Protected Mode Code Address: 0x000F8580
       16-bit Protected Mode Data Address: 0x00000400
PCI Interrupt Routing 1.0 present.
       Router ID: 00:07.0
       Exclusive IRQs: None
       Compatible Router: 8086:122e
       Slot Entry 1: ID 00:07, on-board
       Slot Entry 2: ID 00:04, on-board
       Slot Entry 3: ID 00:06, on-board
       Slot Entry 4: ID 00:0c, on-board
       Slot Entry 5: ID 00:0d, on-board
       Slot Entry 6: ID 00:01, on-board

dmidecode:
# dmidecode 2.7
SMBIOS 2.3 present.
49 structures occupying 2000 bytes.
Table at 0x000E7010.

Handle 0x0000, DMI type 0, 20 bytes.
BIOS Information
       Vendor: NEC
       Version: NOTE BIOS Version /175A2700
       Release Date: 03/06/2001
       Address: 0xE9720
       Runtime Size: 92384 bytes
       ROM Size: 512 kB
       Characteristics:
               ISA is supported
               PCI is supported
               PC Card (PCMCIA) is supported
               PNP is supported
               APM is supported
               BIOS is upgradeable
               BIOS shadowing is allowed
               ESCD support is available
               Boot from CD is supported
               Selectable boot is supported
               EDD is supported
               Japanese floppy for Toshiba 1.2 MB is supported (int 13h)
               5.25"/1.2 MB floppy services are supported (int 13h)
               Print screen service is supported (int 5h)
               8042 keyboard services are supported (int 9h)
               Serial services are supported (int 14h)
               Printer services are supported (int 17h)
               CGA/mono video services are supported (int 10h)
               ACPI is supported
               USB legacy is supported
               Smart battery is supported
               Function key-initiated network boot is supported

Handle 0x0001, DMI type 1, 25 bytes.
System Information
       Manufacturer: NEC
       Product Name:
       Version:
       Serial Number: SN-123456UVXV218B7O1N1N1K
       UUID: Not Settable
       Wake-up Type: Power Switch

Handle 0x0002, DMI type 2, 8 bytes.
Base Board Information
       Manufacturer: NEC
       Product Name:
       Version:
       Serial Number:

Handle 0x0003, DMI type 3, 17 bytes.
Chassis Information
       Manufacturer: NEC
       Type: Notebook
       Lock: Not Present
       Version:
       Serial Number:
       Asset Tag:
       Boot-up State: Unknown
       Power Supply State: Unknown
       Thermal State: Unknown
       Security Status: Unknown
       OEM Information: 0x00001234

Handle 0x0004, DMI type 4, 32 bytes.
Processor Information
       Socket Designation: Laptop Computer
       Type: Central Processor
       Family: Pentium III
       Manufacturer: Intel Corporation
       ID: 86 06 00 00 FF F9 87 03
       Signature: Type 0, Family 6, Model 8, Stepping 6
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
       Voltage: 1.6 V
       External Clock: 100 MHz
       Max Speed: 700 MHz
       Current Speed: 700 MHz
       Status: Populated, Enabled
       Upgrade: None
       L1 Cache Handle: Not Provided
       L2 Cache Handle: 0x0009
       L3 Cache Handle: Not Provided

Handle 0x0005, DMI type 5, 20 bytes.
Memory Controller Information
       Error Detecting Method: None
       Error Correcting Capabilities:
               None
       Supported Interleave: One-way Interleave
       Current Interleave: One-way Interleave
       Maximum Memory Module Size: 128 MB
       Maximum Total Memory Size: 256 MB
       Supported Speeds: None
       Supported Memory Types:
               DIMM
               SDRAM
       Memory Module Voltage: 3.3 V
       Associated Memory Slots: 2
               0x0007
               0x0008
       Enabled Error Correcting Capabilities:
               Unknown

Handle 0x0006, DMI type 6, 12 bytes.
Memory Module Information
       Socket Designation: Memory Slot 1
       Bank Connections: 1 0
       Current Speed: Unknown
       Type: DIMM SDRAM
       Installed Size: 128 MB (Double-bank Connection)
       Enabled Size: 128 MB (Double-bank Connection)
       Error Status: OK

Handle 0x0007, DMI type 6, 12 bytes.
Memory Module Information
       Socket Designation: Memory Slot 2
       Bank Connections: 3 2
       Current Speed: Unknown
       Type: DIMM SDRAM
       Installed Size: 128 MB (Double-bank Connection)
       Enabled Size: 128 MB (Double-bank Connection)
       Error Status: OK

Handle 0x0008, DMI type 7, 19 bytes.
Cache Information
       Socket Designation: L1 Cache
       Configuration: Enabled, Not Socketed, Level 1
       Operational Mode: Write Back
       Location: Internal
       Installed Size: 32 KB
       Maximum Size: 32 KB
       Supported SRAM Types:
               Other
       Installed SRAM Type: Other
       Speed: Unknown
       Error Correction Type: None
       System Type: Unified
       Associativity: 4-way Set-associative

Handle 0x0009, DMI type 7, 19 bytes.
Cache Information
       Socket Designation: L2 Cache
       Configuration: Enabled, Not Socketed, Level 2
       Operational Mode: Write Back
       Location: Internal
       Installed Size: 256 KB
       Maximum Size: 256 KB
       Supported SRAM Types:
               Pipeline Burst
       Installed SRAM Type: Other
       Speed: Unknown
       Error Correction Type: Multi-bit ECC
       System Type: Unified
       Associativity: Other

Handle 0x000A, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: USB1
       External Connector Type: Access Bus (USB)
       Port Type: USB

Handle 0x000B, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: USB2
       External Connector Type: Access Bus (USB)
       Port Type: USB

Handle 0x000C, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Mic In
       External Connector Type: Mini Jack (headphones)
       Port Type: Audio Port

Handle 0x000D, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Head phone/Line Out
       External Connector Type: Mini Jack (headphones)
       Port Type: Audio Port

Handle 0x000E, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: SPDIF
       External Connector Type: Mini Jack (headphones)
       Port Type: Audio Port

Handle 0x000F, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Line In
       External Connector Type: Mini Jack (headphones)
       Port Type: Audio Port

Handle 0x0010, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Parallel Port
       External Connector Type: DB-25 female
       Port Type: Parallel Port ECP/EPP

Handle 0x0011, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Serial Port
       External Connector Type: DB-9 male
       Port Type: Serial Port 16550A Compatible

Handle 0x0012, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: IEEE 1394 Port
       External Connector Type: IEEE 1394
       Port Type: Firewire (IEEE P1394)

Handle 0x0013, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Telephone Line
       External Connector Type: RJ-11
       Port Type: Modem Port

Handle 0x0014, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Network
       External Connector Type: RJ-45
       Port Type: Network Port

Handle 0x0015, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: Monitor
       External Connector Type: DB-15 male
       Port Type: Video Port

Handle 0x0016, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: TV-OUT/C-Video
       External Connector Type: Other
       Port Type: Video Port

Handle 0x0017, DMI type 8, 9 bytes.
Port Connector Information
       Internal Reference Designator:
       Internal Connector Type: None
       External Reference Designator: PS/2
       External Connector Type: PS/2
       Port Type: Other

Handle 0x0018, DMI type 9, 13 bytes.
System Slot Information
       Designation: Socket 1
       Type: 32-bit PC Card (PCMCIA)
       Current Usage: Unknown
       Length: Other
       ID: Adapter 1, Socket 0
       Characteristics:
               5.0 V is provided
               3.3 V is provided
               PC Card-16 is supported
               Cardbus is supported
               Zoom Video is supported
               Modem ring resume is supported

Handle 0x0019, DMI type 9, 13 bytes.
System Slot Information
       Designation: Socket 2
       Type: 32-bit PC Card (PCMCIA)
       Current Usage: Unknown
       Length: Other
       ID: Adapter 2, Socket 0
       Characteristics:
               5.0 V is provided
               3.3 V is provided
               PC Card-16 is supported
               Cardbus is supported
               Modem ring resume is supported

Handle 0x001A, DMI type 10, 6 bytes.
On Board Device Information
       Type: Video
       Status: Enabled
       Description: Rage Mobility-M/Ati

Handle 0x001B, DMI type 10, 6 bytes.
On Board Device Information
       Type: Other
       Status: Enabled
       Description: PCI1420/Teaxas

Handle 0x001C, DMI type 10, 6 bytes.
On Board Device Information
       Type: Other
       Status: Enabled
       Description: uPD72872/NEC

Handle 0x001D, DMI type 10, 6 bytes.
On Board Device Information
       Type: Other
       Status: Enabled
       Description: Mars3/Lucent

Handle 0x001E, DMI type 11, 5 bytes.
OEM Strings
       String 1: This is the Intel 440ZX
       String 2: Customer Reference Platform
       String 3:
       String 4:
       String 5:
       String 6:

Handle 0x001F, DMI type 13, 22 bytes.
BIOS Language Information
       Installable Languages: 1
               en|US|iso8859-1
       Currently Installed Language: Not Specified

Handle 0x0020, DMI type 16, 15 bytes.
Physical Memory Array
       Location: System Board Or Motherboard
       Use: System Memory
       Error Correction Type: None
       Maximum Capacity: 256 MB
       Error Information Handle: Not Provided
       Number Of Devices: 2

Handle 0x0021, DMI type 16, 15 bytes.
Physical Memory Array
       Location: System Board Or Motherboard
       Use: Flash Memory
       Error Correction Type: None
       Maximum Capacity: 512 kB
       Error Information Handle: Not Provided
       Number Of Devices: 1

Handle 0x0022, DMI type 16, 15 bytes.
Physical Memory Array
       Location: System Board Or Motherboard
       Use: <OUT OF SPEC>
       Error Correction Type: None
       Maximum Capacity: 8 MB
       Error Information Handle: Not Provided
       Number Of Devices: 1

Handle 0x0023, DMI type 17, 23 bytes.
Memory Device
       Array Handle: 0x0022
       Error Information Handle: Not Provided
       Total Width: 8 bits
       Data Width: 8 bits
       Size: 512 kB
       Form Factor: Other
       Set: None
       Locator: U30
       Bank Locator:
       Type: Flash
       Type Detail: Non-Volatile
       Speed: Unknown

Handle 0x0024, DMI type 17, 23 bytes.
Memory Device
       Array Handle: 0x0022
       Error Information Handle: Not Provided
       Total Width: 64 bits
       Data Width: 64 bits
       Size: 512 kB
       Form Factor: Other
       Set: None
       Locator: U23
       Bank Locator:
       Type: Other
       Type Detail: Fast-paged
       Speed: 83 MHz (12.0 ns)

Handle 0x0025, DMI type 17, 23 bytes.
Memory Device
       Array Handle: 0x0022
       Error Information Handle: Not Provided
       Total Width: 64 bits
       Data Width: 64 bits
       Size: 64 MB
       Form Factor: DIMM
       Set: None
       Locator: P20
       Bank Locator:
       Type: SDRAM
       Type Detail: Synchronous
       Speed: 100 MHz (10.0 ns)

Handle 0x0026, DMI type 17, 23 bytes.
Memory Device
       Array Handle: 0x0022
       Error Information Handle: Not Provided
       Total Width: 64 bits
       Data Width: 64 bits
       Size: 64 MB
       Form Factor: DIMM
       Set: 1
       Locator: P21
       Bank Locator:
       Type: SDRAM
       Type Detail: Synchronous
       Speed: 100 MHz (10.0 ns)

Handle 0x0027, DMI type 19, 15 bytes.
Memory Array Mapped Address
       Starting Address: 0x00000000000
       Ending Address: 0x0000007FFFF
       Range Size: 512 kB
       Physical Array Handle: 0x0022
       Partition Width: 0

Handle 0x0028, DMI type 19, 15 bytes.
Memory Array Mapped Address
       Starting Address: 0x00000000000
       Ending Address: 0x000003FFFFF
       Range Size: 4 MB
       Physical Array Handle: 0x0022
       Partition Width: 0

Handle 0x0029, DMI type 19, 15 bytes.
Memory Array Mapped Address
       Starting Address: 0x00000000000
       Ending Address: 0x00007FFFFFF
       Range Size: 128 MB
       Physical Array Handle: 0x0022
       Partition Width: 0

Handle 0x002A, DMI type 20, 19 bytes.
Memory Device Mapped Address
       Starting Address: 0x00000000000
       Ending Address: 0x000000003FF
       Range Size: 1 kB
       Physical Device Handle: 0x0023
       Memory Array Mapped Address Handle: 0x0029
       Partition Row Position: 254
       Interleave Position: 254
       Interleaved Data Depth: 254

Handle 0x002B, DMI type 20, 19 bytes.
Memory Device Mapped Address
       Starting Address: 0x00000000000
       Ending Address: 0x000000003FF
       Range Size: 1 kB
       Physical Device Handle: 0x0024
       Memory Array Mapped Address Handle: 0x0029
       Partition Row Position: 254
       Interleave Position: 254
       Interleaved Data Depth: 254

Handle 0x002C, DMI type 21, 7 bytes.
Built-in Pointing Device
       Type: Glide Point
       Interface: PS/2
       Buttons: 2

Handle 0x002D, DMI type 22, 26 bytes.
Portable Battery
       Location: on the right-hand side
       Manufacturer: NEC
       Name: NEC
       Chemistry: Nickel Metal Hydride
       Design Capacity: 364800 mWh
       Design Voltage: 9600 mV
       SBDS Version: Bat123
       Maximum Error: Unknown
       SBDS Serial Number: 0000
       SBDS Manufacture Date: 1985-08-25
       OEM-specific Information: 0x00000000

Handle 0x002E, DMI type 22, 26 bytes.
Portable Battery
       Location: on the right-hand side
       Manufacturer: NEC
       Name: NEC
       Chemistry: Lithium Ion
       Design Capacity: 547200 mWh
       Design Voltage: 13440 mV
       SBDS Version: Bat123
       Maximum Error: Unknown
       SBDS Serial Number: 0000
       SBDS Manufacture Date: 1985-08-25
       OEM-specific Information: 0x00000000

Handle 0x002F, DMI type 32, 20 bytes.
System Boot Information
       Status: <OUT OF SPEC>

Handle 0x0030, DMI type 127, 4 bytes.
End Of Table


vpddecode:
# vpddecode 2.7
# No VPD structure found, sorry.

Do you need some info?

tnks you very much

Luca
