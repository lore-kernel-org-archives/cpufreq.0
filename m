From: jy <jy454@yahoo.fr>
Subject: Re: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 17:00:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <c5osds$fed$1@sea.gmane.org>
References: <c5n0ms$7nc$1@sea.gmane.org> <20040416120519.GT8953@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040416120519.GT8953@poupinou.org>
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

Bruno Ducrot wrote:
> On Fri, Apr 16, 2004 at 12:00:58AM +0200, jy wrote:
> 
>>I have Acer Aspire 1357LMi laptop with AMD Athlon XP 3000+ and of course 
>>cpufreq don't work
>>
> 
> 
> Could you please try latest cpufreq?  it's at
> http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/
> 
> with CONFIG_ACPI_PROCESSOR=YES ?


powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB:  48.270 MHz
powernow: Found PSB header at c00f06f0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: acpi:  P0: 2200 MHz 75000 mW 125 uS control 00d058fb SGTC 13334
powernow:    FID: 0x1b (16.5x [796MHz])	VID: 0x7 (1.650V)
powernow: acpi:  P1: 1800 MHz 55000 mW 125 uS control 00d05935 SGTC 13334
powernow:    FID: 0x15 (13.5x [651MHz])	VID: 0x9 (1.550V)
powernow: acpi:  P2: 1467 MHz 32000 mW 125 uS control 00d059c0 SGTC 13334
powernow:    FID: 0x0 (11.0x [530MHz])	VID: 0xe (1.300V)
powernow: acpi:  P3: 1064 MHz 30000 mW 125 uS control 00d059ca SGTC 13334
powernow:    FID: 0xa (8.0x [386MHz])	VID: 0xe (1.300V)
powernow: acpi:  P4: 800 MHz 26000 mW 125 uS control 00d059c6 SGTC 13334
powernow:    FID: 0x6 (6.0x [289MHz])	VID: 0xe (1.300V)
powernow: Minimum speed 289 MHz. Maximum speed 796 MHz.

------

x86info v1.12b.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Need to be root to use specified options.
Found 1 CPU
[...]
PowerNOW! Technology information
Available features:
	Temperature sensing diode present.
	Bus divisor control
	Voltage ID control

Connector type: Socket A (462 Pin PGA)


2.2Ghz processor (estimate).


Thanks, it seems to work according to x86info. But the fsb is wrong.


> I would like also that you test dump_psb.c
> 
> wget http://poup.poupinou.org/cpufreq/powernow-k7/dump_psb.c
> gcc -O2 -Wall dump_psb.c -o dump_psb
> sudo ./dump_psb 9
> 
> in order to check if that model actually do have more PSTs.

PSB version: 12 flags: 0 settling time 100us res1 0 num pst 8
Overriding number of pst :9
   PST 1  cpuid 7a0 fsb 133 mfid 15 svid 8 numberstates 7
     0  1263500kHz  FID 0d ( 9.5)  VID 0e (1300mV)
     1  1330000kHz  FID 0e (10.0)  VID 0d (1350mV)
     2  1396500kHz  FID 0f (10.5)  VID 0c (1400mV)
     3  1463000kHz  FID 00 (11.0)  VID 0b (1450mV)
     4  1529500kHz  FID 01 (11.5)  VID 0a (1500mV)
     5  1596000kHz  FID 02 (12.0)  VID 09 (1550mV)
     6  1795500kHz  FID 15 (13.5)  VID 08 (1600mV)
   PST 2  cpuid 7a0 fsb 133 mfid 16 svid 7 numberstates 8
     0  1197000kHz  FID 0c ( 9.0)  VID 0e (1300mV)
     1  1263500kHz  FID 0d ( 9.5)  VID 0d (1350mV)
     2  1330000kHz  FID 0e (10.0)  VID 0c (1400mV)
     3  1396500kHz  FID 0f (10.5)  VID 0b (1450mV)
     4  1463000kHz  FID 00 (11.0)  VID 0a (1500mV)
     5  1529500kHz  FID 01 (11.5)  VID 09 (1550mV)
     6  1662500kHz  FID 03 (12.5)  VID 08 (1600mV)
     7  1862000kHz  FID 16 (14.0)  VID 07 (1650mV)
   PST 3  cpuid 7a0 fsb 133 mfid 18 svid 7 numberstates 8
     0  1396500kHz  FID 0f (10.5)  VID 0e (1300mV)
     1  1463000kHz  FID 00 (11.0)  VID 0d (1350mV)
     2  1529500kHz  FID 01 (11.5)  VID 0c (1400mV)
     3  1596000kHz  FID 02 (12.0)  VID 0b (1450mV)
     4  1662500kHz  FID 03 (12.5)  VID 0a (1500mV)
     5  1729000kHz  FID 14 (13.0)  VID 09 (1550mV)
     6  1795500kHz  FID 15 (13.5)  VID 08 (1600mV)
     7  1995000kHz  FID 18 (15.0)  VID 07 (1650mV)
   PST 4  cpuid 7a0 fsb 133 mfid 1a svid 7 numberstates 8
     0  1463000kHz  FID 00 (11.0)  VID 0e (1300mV)
     1  1529500kHz  FID 01 (11.5)  VID 0d (1350mV)
     2  1596000kHz  FID 02 (12.0)  VID 0c (1400mV)
     3  1662500kHz  FID 03 (12.5)  VID 0b (1450mV)
     4  1729000kHz  FID 14 (13.0)  VID 0a (1500mV)
     5  1795500kHz  FID 15 (13.5)  VID 09 (1550mV)
     6  1995000kHz  FID 18 (15.0)  VID 08 (1600mV)
     7  2128000kHz  FID 1a (16.0)  VID 07 (1650mV)
   PST 5  cpuid 780 fsb 133 mfid 3 svid 8 numberstates 7
     0   997500kHz  FID 09 ( 7.5)  VID 0e (1300mV)
     1  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
     2  1263500kHz  FID 0d ( 9.5)  VID 0c (1400mV)
     3  1330000kHz  FID 0e (10.0)  VID 0b (1450mV)
     4  1396500kHz  FID 0f (10.5)  VID 0a (1500mV)
     5  1463000kHz  FID 00 (11.0)  VID 09 (1550mV)
     6  1662500kHz  FID 03 (12.5)  VID 08 (1600mV)
   PST 6  cpuid 780 fsb 133 mfid 15 svid 8 numberstates 7
     0  1263500kHz  FID 0d ( 9.5)  VID 0e (1300mV)
     1  1330000kHz  FID 0e (10.0)  VID 0d (1350mV)
     2  1396500kHz  FID 0f (10.5)  VID 0c (1400mV)
     3  1463000kHz  FID 00 (11.0)  VID 0b (1450mV)
     4  1529500kHz  FID 01 (11.5)  VID 0a (1500mV)
     5  1596000kHz  FID 02 (12.0)  VID 09 (1550mV)
     6  1795500kHz  FID 15 (13.5)  VID 08 (1600mV)
   PST 7  cpuid 780 fsb 133 mfid 18 svid 7 numberstates 8
     0  1396500kHz  FID 0f (10.5)  VID 0e (1300mV)
     1  1463000kHz  FID 00 (11.0)  VID 0d (1350mV)
     2  1529500kHz  FID 01 (11.5)  VID 0c (1400mV)
     3  1596000kHz  FID 02 (12.0)  VID 0b (1450mV)
     4  1662500kHz  FID 03 (12.5)  VID 0a (1500mV)
     5  1729000kHz  FID 14 (13.0)  VID 09 (1550mV)
     6  1795500kHz  FID 15 (13.5)  VID 08 (1600mV)
     7  1995000kHz  FID 18 (15.0)  VID 07 (1650mV)
   PST 8  cpuid 780 fsb 133 mfid 1a svid 7 numberstates 8
     0  1463000kHz  FID 00 (11.0)  VID 0e (1300mV)
     1  1529500kHz  FID 01 (11.5)  VID 0d (1350mV)
     2  1596000kHz  FID 02 (12.0)  VID 0c (1400mV)
     3  1662500kHz  FID 03 (12.5)  VID 0b (1450mV)
     4  1729000kHz  FID 14 (13.0)  VID 0a (1500mV)
     5  1795500kHz  FID 15 (13.5)  VID 09 (1550mV)
     6  1995000kHz  FID 18 (15.0)  VID 08 (1600mV)
     7  2128000kHz  FID 1a (16.0)  VID 07 (1650mV)
   PST 9  cpuid 000 fsb 0 mfid 0 svid eb numberstates 7
     0        0kHz  FID ffffffc1 ( 3.8)  VID 08 (1600mV)
     1        0kHz  FID 1c (17.0)  VID 0e (1300mV)
     2        0kHz  FID fffffff1 (23.2)  VID 0e (1300mV)
     3        0kHz  FID fffffffe ( 0.0)  VID 21 (622879794mV)
     4        0kHz  FID ffffffb7 (16.0)  VID 00 (2000mV)
     5        0kHz  FID ffffff96 (64936692.8)  VID 06 (1700mV)
     6        0kHz  FID fffffff4 (-7373406.-2)  VID 6e (  13mV)
