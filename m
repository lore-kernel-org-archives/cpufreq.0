From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Best CPU and Chipset for cpufreq?
Date: Fri, 16 Jan 2004 14:09:37 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040116140937.1wetc08gksogsokw@carlthompson.net>
References: <20040114163958.GB1774@acheron.the-domination.com>
	<20040116113649.p3iyo4gg408gc8c8@carlthompson.net>
	<20040116210134.GC11919@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_5suemcjc93b4"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040116210134.GC11919@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

This message is in MIME format.

--=_5suemcjc93b4
Content-Type: text/plain; charset="ISO-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Quoting Dave Jones <davej@redhat.com>:

> On Fri, Jan 16, 2004 at 11:36:49AM -0800, Carl Thompson wrote:
> > My current main laptop is an eMachines M5305 and it has been fantastic.
> > It has an Athlon XP 2200+ that can throttle all the way down to 532MHz.
>
> Interesting, I've received reports that model has broken PST tables.
> What BIOS revision do you have ? (dmidecode output would be useful)

I'm running the original BIOS that came on the laptop and have had no problems.
Everything works fine.  (dmidecode output attached.)


> > Plus, the eMachines laptops are very Linux-friendly, have a widescreen
> > aspect ratio (1280x800) and are very cheap despite being very powerful.
>
> eMachines have been extremely unhelpful in some cases too.
> When someone pointed out to them they had broken PST tables, they got
> quite annoyed, and blamed it on "Linux not being a real operating system".

Well, I don't seem to have the PST table problem and I think I have their first
laptop (?).  So perhaps that's a mistake?

And, of course, no company that sells machines that cheap is going to have
stellar support, but this laptop does seem to be an excellent value anyway
(lots of features, good quality and low price).

> 		Dave

Carl


--=_5suemcjc93b4
Content-Type: text/plain; charset="UTF-8"; name="dmidecode.txt"
Content-Disposition: attachment; filename="dmidecode.txt"
Content-Transfer-Encoding: 7bit

# dmidecode 2.2
SMBIOS 2.3 present.
18 structures occupying 684 bytes.
Table at 0x000DF010.
Handle 0x0000
	DMI type 0, 20 bytes.
	BIOS Information
		Vendor: Phoenix
		Version: 0009
		Release Date: 03/02/2003
		Address: 0xE5F40
		Runtime Size: 106688 bytes
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
			BIOS ROM is socketed
			ACPI is supported
			USB legacy is supported
			AGP is supported
			Smart battery is supported
			BIOS boot specification is supported
			Function key-initiated network boot is supported
Handle 0x0001
	DMI type 1, 25 bytes.
	System Information
		Manufacturer: eMachines. Inc.
		Product Name: M5305
		Version: 0009
		Serial Number: N7036 100 00785                         
		UUID: 80C20E72-DD63-0010-A787-7F0F04138EC7
		Wake-up Type: Power Switch
Handle 0x0002
	DMI type 2, 8 bytes.
	Base Board Information
		Manufacturer: Arima 
		Product Name: W720K7
		Version: KBC Revision: 1911
		Serial Number: None                                    
Handle 0x0003
	DMI type 3, 17 bytes.
	Chassis Information
		Manufacturer: Arima 
		Type: Notebook
		Lock: Not Present
		Version: N/A
		Serial Number: None
		Asset Tag:                               
		Boot-up State: Unknown
		Power Supply State: Unknown
		Thermal State: Unknown
		Security Status: Unknown
		OEM Information: 0x00001234
Handle 0x0004
	DMI type 4, 32 bytes.
	Processor Information
		Socket Designation: U23
		Type: Central Processor
		Family: Athlon
		Manufacturer: AuthenticAMD
		ID: 81 06 00 00 FF F9 83 03
		Signature: Type 0, Family 6, Model 8, Stepping 1
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
		Version: Mobile AMD Athlon(tm) XP processor 2200+
		Voltage: 1.4 V
		External Clock: 133 MHz
		Max Speed: 1800 MHz
		Current Speed: 1800 MHz
		Status: Populated, Enabled
		Upgrade: ZIF Socket
		L1 Cache Handle: 0x0005
		L2 Cache Handle: 0x0006
		L3 Cache Handle: Not Provided
Handle 0x0005
	DMI type 7, 19 bytes.
	Cache Information
		Socket Designation: L1 Cache
		Configuration: Enabled, Not Socketed, Level 1
		Operational Mode: Write Back
		Location: Internal
		Installed Size: 128 KB
		Maximum Size: 128 KB
		Supported SRAM Types:
			Burst
			Pipeline Burst
		Installed SRAM Type: Synchronous
		Speed: Unknown
		Error Correction Type: Parity
		System Type: Other
		Associativity: 4-way Set-associative
Handle 0x0006
	DMI type 7, 19 bytes.
	Cache Information
		Socket Designation: L2 Cache
		Configuration: Enabled, Socketed, Level 2
		Operational Mode: Write Back
		Location: Internal
		Installed Size: 256 KB
		Maximum Size: 256 KB
		Supported SRAM Types:
			Burst
			Pipeline Burst
		Installed SRAM Type: Synchronous
		Speed: Unknown
		Error Correction Type: Unknown
		System Type: Other
		Associativity: Unknown
Handle 0x0007
	DMI type 16, 15 bytes.
	Physical Memory Array
		Location: System Board Or Motherboard
		Use: Flash Memory
		Error Correction Type: None
		Maximum Capacity: 512 kB
		Error Information Handle: Not Provided
		Number Of Devices: 1
Handle 0x0008
	DMI type 16, 15 bytes.
	Physical Memory Array
		Location: System Board Or Motherboard
		Use: System Memory
		Error Correction Type: None
		Maximum Capacity: 1 GB
		Error Information Handle: Not Provided
		Number Of Devices: 2
Handle 0x0009
	DMI type 17, 23 bytes.
	Memory Device
		Array Handle: 0x0008
		Error Information Handle: Not Provided
		Total Width: 64 bits
		Data Width: 64 bits
		Size: 512 MB
		Form Factor: DIMM
		Set: 1
		Locator: U5
		Bank Locator: Bank 0
		Type: DRAM
		Type Detail: Synchronous
		Speed: 266 MHz (3.8 ns)
Handle 0x000A
	DMI type 17, 23 bytes.
	Memory Device
		Array Handle: 0x0008
		Error Information Handle: Not Provided
		Total Width: 64 bits
		Data Width: 64 bits
		Size: 256 MB
		Form Factor: DIMM
		Set: 1
		Locator: U6
		Bank Locator: Bank 1
		Type: DRAM
		Type Detail: Synchronous
		Speed: 266 MHz (3.8 ns)
Handle 0x000B
	DMI type 17, 23 bytes.
	Memory Device
		Array Handle: 0x0007
		Error Information Handle: Not Provided
		Total Width: 16 bits
		Data Width: 16 bits
		Size: 512 kB
		Form Factor: Chip
		Set: None
		Locator: System Board
		Bank Locator: Null
		Type: Flash
		Type Detail: Non-Volatile
		Speed: 8 MHz (125.0 ns)
Handle 0x000C
	DMI type 19, 15 bytes.
	Memory Array Mapped Address
		Starting Address: 0x00000000000
		Ending Address: 0x000000003FF
		Range Size: 1 kB
		Physical Array Handle: 0x0008
		Partition Width: 0
Handle 0x000D
	DMI type 19, 15 bytes.
	Memory Array Mapped Address
		Starting Address: 0x00000000000
		Ending Address: 0x000000003FF
		Range Size: 1 kB
		Physical Array Handle: 0x0008
		Partition Width: 0
Handle 0x000E
	DMI type 20, 19 bytes.
	Memory Device Mapped Address
		Starting Address: 0x00000000000
		Ending Address: 0x000000003FF
		Range Size: 1 kB
		Physical Device Handle: 0x0009
		Memory Array Mapped Address Handle: 0x000C
		Partition Row Position: 1
Handle 0x000F
	DMI type 20, 19 bytes.
	Memory Device Mapped Address
		Starting Address: 0x00000000000
		Ending Address: 0x000000003FF
		Range Size: 1 kB
		Physical Device Handle: 0x000A
		Memory Array Mapped Address Handle: 0x000D
		Partition Row Position: 1
Handle 0x0010
	DMI type 32, 20 bytes.
	System Boot Information
		Status: <OUT OF SPEC>
Handle 0x0011
	DMI type 127, 4 bytes.
	End Of Table

--=_5suemcjc93b4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=_5suemcjc93b4--


