From: jy <jy454@yahoo.fr>
Subject: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 00:00:58 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <c5n0ms$7nc$1@sea.gmane.org>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

I have Acer Aspire 1357LMi laptop with AMD Athlon XP 3000+ and of course 
cpufreq don't work

powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00f06f0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: See 
http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml

I've read many interesting threads here and I saw the patch which use 
acpi which would solve my problem I think. If you need volunteer to test 
it on an acer laptop I think I can.

I tried to flash the bios with the one on acer website but it seems that 
it is older than the one I already have, and it doesn't solve the 
problem anyway.

I managed to run at 2200 Mhz max and 800Mhz min under windows

here are some reports

cpuinfo :

processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 6
model		: 10
model name	: Mobile AMD Athlon(tm) XP 3000+
stepping	: 0
cpu MHz		: 796.380
cache size	: 512 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov 
pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips	: 1564.67

dmidecode :
# dmidecode 2.4
SMBIOS 2.3 present.
24 structures occupying 766 bytes.
Table at 0x000D8010.
Handle 0x0000
	DMI type 0, 20 bytes.
	BIOS Information
		Vendor: Acer
		Version: 3A24
		Release Date: 12/01/2003
		Address: 0xE28F0
		Runtime Size: 120592 bytes
		ROM Size: 512 kB
		Characteristics:
			PCI is supported
			PC Card (PCMCIA) is supported
			PNP is supported
			APM is supported
			BIOS is upgradeable
			BIOS shadowing is allowed
			Boot from CD is supported
			Selectable boot is supported
			EDD is supported
			5.25"/1.2 MB floppy services are supported (int 13h)
			Print screen service is supported (int 5h)
			8042 keyboard services are supported (int 9h)
			Serial services are supported (int 14h)
			Printer services are supported (int 17h)
			CGA/mono video services are supported (int 10h)
			ACPI is supported
			USB legacy is supported
			AGP is supported
			Smart battery is supported
			BIOS boot specification is supported
Handle 0x0001
	DMI type 1, 25 bytes.
	System Information
		Manufacturer: Acer,Inc.
		Product Name: Aspire 1350
		Version: 3A24
		Serial Number: LXA1005375405003AEEF15
		UUID: E0F35E22-3E51-D811-8C30-00C09F34DEC1
		Wake-up Type: Power Switch
Handle 0x0002
	DMI type 2, 8 bytes.
	Base Board Information
		Manufacturer: Acer,Inc.
		Product Name: Aspire 1350
		Version: Rev.A
		Serial Number: None
Handle 0x0003
	DMI type 3, 17 bytes.
	Chassis Information
		Manufacturer: Acer,Inc.
		Type: Notebook
		Lock: Not Present
		Version: 3A24
		Serial Number: LXA1005375405003AEEF15
		Asset Tag: ................................
		Boot-up State: Safe
		Power Supply State: Safe
		Thermal State: Safe
		Security Status: None
		OEM Information: 0x00001234
Handle 0x0004
	DMI type 4, 32 bytes.
	Processor Information
		Socket Designation: U23
		Type: Central Processor
		Family: Athlon
		Manufacturer: AMD
		ID: A0 06 00 00 FF F9 83 03
		Signature: Family 6, Model A, Stepping 0
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
			MMX (MMX technology supported)
			FXSR (Fast floating-point save and restore)
			SSE (Streaming SIMD extensions)
		Version: AMD Athlon(tm) pr
		Voltage: 2.2 V
		External Clock: Unknown
		Max Speed: 1000 MHz
		Current Speed: 2200 MHz
		Status: Populated, Enabled
		Upgrade: ZIF Socket
		L1 Cache Handle: 0x0008
		L2 Cache Handle: 0x0009
		L3 Cache Handle: Not Provided
Handle 0x0005
	DMI type 5, 20 bytes.
	Memory Controller Information
		Error Detecting Method: None
		Error Correcting Capabilities:
			None
		Supported Interleave: One-way Interleave
		Current Interleave: One-way Interleave
		Maximum Memory Module Size: 128 MB
		Maximum Total Memory Size: 256 MB
		Supported Speeds:
			70 ns
			60 ns
		Supported Memory Types:
			FPM
			EDO
			DIMM
			SDRAM
		Memory Module Voltage: 3.3 V
		Associated Memory Slots: 2
			0x0000
			0x0001
		Enabled Error Correcting Capabilities:
			Unknown
[...]

x86info patched to dump pst :

x86info v1.13.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
Family: 6 Model: 10 Stepping: 0
CPU Model : Mobile Athlon XP (Barton)
PowerNOW! Technology information
Available features:
	Temperature sensing diode present.
	Bus divisor control
	Voltage ID control

MSR: 0xc0010041=0x0000000000110706 : 00000000 00000000 00000000 00000000
            00000000 00010001 00000111 00000110
MSR: 0xc0010042=0x00070707001b0606 : 00000000 00000111 00000111 00000111
            00000000 00011011 00000110 00000110

FID changes will happen
VID changes won't happen
Current FSB multiplier code: 6.0
Voltage ID codes: Maximum=1.650V Startup=1.650V Currently=1.650V
Frequency ID codes: Maximum=16.5x Startup=6.0x Currently=6.0x
Decoding BIOS PST tables (maxfid=1b, startvid=7)
Found PSB header at 0x4018f6f0
Table version: 0x12
Flags: 0x0 (Mobile voltage regulator)
numpst= 8
Settling Time: 100 microseconds.
Has 8 PST tables. (Only dumping ones relevant to this CPU).
  --DEBUG: 7a0 ?= 7a0 && 27 ?= 21, 7 ?= 8
  PST:0 (@0x4018f700)
  cpuid: 0x7a0	  fsb: 133	  maxFID: 0x15	  startvid: 0x8
   num of p states in this table: 7
     FID: 0xd (9.5x [1264MHz])	VID: 0xe (1.300V)
     FID: 0xe (10.0x [1330MHz])	VID: 0xd (1.350V)
     FID: 0xf (10.5x [1396MHz])	VID: 0xc (1.400V)
     FID: 0x0 (11.0x [1463MHz])	VID: 0xb (1.450V)
     FID: 0x1 (11.5x [1530MHz])	VID: 0xa (1.500V)
     FID: 0x2 (12.0x [1596MHz])	VID: 0x9 (1.550V)
     FID: 0x15 (13.5x [1796MHz])	VID: 0x8 (1.600V)

  --DEBUG: 7a0 ?= 7a0 && 27 ?= 22, 7 ?= 7
  PST:1 (@0x4018f716)
  cpuid: 0x7a0	  fsb: 133	  maxFID: 0x16	  startvid: 0x7
   num of p states in this table: 8
     FID: 0xc (9.0x [1197MHz])	VID: 0xe (1.300V)
     FID: 0xd (9.5x [1264MHz])	VID: 0xd (1.350V)
     FID: 0xe (10.0x [1330MHz])	VID: 0xc (1.400V)
     FID: 0xf (10.5x [1396MHz])	VID: 0xb (1.450V)
     FID: 0x0 (11.0x [1463MHz])	VID: 0xa (1.500V)
     FID: 0x1 (11.5x [1530MHz])	VID: 0x9 (1.550V)
     FID: 0x3 (12.5x [1662MHz])	VID: 0x8 (1.600V)
     FID: 0x16 (14.0x [1862MHz])	VID: 0x7 (1.650V)

  --DEBUG: 7a0 ?= 7a0 && 27 ?= 24, 7 ?= 7
  PST:2 (@0x4018f72e)
  cpuid: 0x7a0	  fsb: 133	  maxFID: 0x18	  startvid: 0x7
   num of p states in this table: 8
     FID: 0xf (10.5x [1396MHz])	VID: 0xe (1.300V)
     FID: 0x0 (11.0x [1463MHz])	VID: 0xd (1.350V)
     FID: 0x1 (11.5x [1530MHz])	VID: 0xc (1.400V)
     FID: 0x2 (12.0x [1596MHz])	VID: 0xb (1.450V)
     FID: 0x3 (12.5x [1662MHz])	VID: 0xa (1.500V)
     FID: 0x14 (13.0x [1729MHz])	VID: 0x9 (1.550V)
     FID: 0x15 (13.5x [1796MHz])	VID: 0x8 (1.600V)
     FID: 0x18 (15.0x [1995MHz])	VID: 0x7 (1.650V)

  --DEBUG: 7a0 ?= 7a0 && 27 ?= 26, 7 ?= 7
  PST:3 (@0x4018f746)
  cpuid: 0x7a0	  fsb: 133	  maxFID: 0x1a	  startvid: 0x7
   num of p states in this table: 8
     FID: 0x0 (11.0x [1463MHz])	VID: 0xe (1.300V)
     FID: 0x1 (11.5x [1530MHz])	VID: 0xd (1.350V)
     FID: 0x2 (12.0x [1596MHz])	VID: 0xc (1.400V)
     FID: 0x3 (12.5x [1662MHz])	VID: 0xb (1.450V)
     FID: 0x14 (13.0x [1729MHz])	VID: 0xa (1.500V)
     FID: 0x15 (13.5x [1796MHz])	VID: 0x9 (1.550V)
     FID: 0x18 (15.0x [1995MHz])	VID: 0x8 (1.600V)
     FID: 0x1a (16.0x [2128MHz])	VID: 0x7 (1.650V)

  --DEBUG: 7a0 ?= 780 && 27 ?= 3, 7 ?= 8
  PST:4 (@0x4018f75e)
  cpuid: 0x780	  fsb: 133	  maxFID: 0x3	  startvid: 0x8
   num of p states in this table: 7
     FID: 0x9 (7.5x [998MHz])	VID: 0xe (1.300V)
     FID: 0xc (9.0x [1197MHz])	VID: 0xd (1.350V)
     FID: 0xd (9.5x [1264MHz])	VID: 0xc (1.400V)
     FID: 0xe (10.0x [1330MHz])	VID: 0xb (1.450V)
     FID: 0xf (10.5x [1396MHz])	VID: 0xa (1.500V)
     FID: 0x0 (11.0x [1463MHz])	VID: 0x9 (1.550V)
     FID: 0x3 (12.5x [1662MHz])	VID: 0x8 (1.600V)

  --DEBUG: 7a0 ?= 780 && 27 ?= 21, 7 ?= 8
  PST:5 (@0x4018f774)
  cpuid: 0x780	  fsb: 133	  maxFID: 0x15	  startvid: 0x8
   num of p states in this table: 7
     FID: 0xd (9.5x [1264MHz])	VID: 0xe (1.300V)
     FID: 0xe (10.0x [1330MHz])	VID: 0xd (1.350V)
     FID: 0xf (10.5x [1396MHz])	VID: 0xc (1.400V)
     FID: 0x0 (11.0x [1463MHz])	VID: 0xb (1.450V)
     FID: 0x1 (11.5x [1530MHz])	VID: 0xa (1.500V)
     FID: 0x2 (12.0x [1596MHz])	VID: 0x9 (1.550V)
     FID: 0x15 (13.5x [1796MHz])	VID: 0x8 (1.600V)

  --DEBUG: 7a0 ?= 780 && 27 ?= 24, 7 ?= 7
  PST:6 (@0x4018f78a)
  cpuid: 0x780	  fsb: 133	  maxFID: 0x18	  startvid: 0x7
   num of p states in this table: 8
     FID: 0xf (10.5x [1396MHz])	VID: 0xe (1.300V)
     FID: 0x0 (11.0x [1463MHz])	VID: 0xd (1.350V)
     FID: 0x1 (11.5x [1530MHz])	VID: 0xc (1.400V)
     FID: 0x2 (12.0x [1596MHz])	VID: 0xb (1.450V)
     FID: 0x3 (12.5x [1662MHz])	VID: 0xa (1.500V)
     FID: 0x14 (13.0x [1729MHz])	VID: 0x9 (1.550V)
     FID: 0x15 (13.5x [1796MHz])	VID: 0x8 (1.600V)
     FID: 0x18 (15.0x [1995MHz])	VID: 0x7 (1.650V)

  --DEBUG: 7a0 ?= 780 && 27 ?= 26, 7 ?= 7
  PST:7 (@0x4018f7a2)
  cpuid: 0x780	  fsb: 133	  maxFID: 0x1a	  startvid: 0x7
   num of p states in this table: 8
     FID: 0x0 (11.0x [1463MHz])	VID: 0xe (1.300V)
     FID: 0x1 (11.5x [1530MHz])	VID: 0xd (1.350V)
     FID: 0x2 (12.0x [1596MHz])	VID: 0xc (1.400V)
     FID: 0x3 (12.5x [1662MHz])	VID: 0xb (1.450V)
     FID: 0x14 (13.0x [1729MHz])	VID: 0xa (1.500V)
     FID: 0x15 (13.5x [1796MHz])	VID: 0x9 (1.550V)
     FID: 0x18 (15.0x [1995MHz])	VID: 0x8 (1.600V)
     FID: 0x1a (16.0x [2128MHz])	VID: 0x7 (1.650V)

Sorry for my bad english
Thanks
JY
