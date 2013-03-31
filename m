From: Simon Kalteis <skalteis@kernelspace.de>
Subject: Intel Core2 Duo E6600 reports max-frequency of just 900 MHz instead
 of 2.4 GHz
Date: Sun, 31 Mar 2013 01:20:53 +0100
Message-ID: <20130331012053.220de31f@intellistation.kalteis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Hello!

I discovered that my IBM Intellistation M Pro 9229Y with its Intel
Core2 Duo E6600 is reported to clock only at a max frequency of 900.000
MHz instead of 2.4 GHz.


There is an old bug report on cpufreq@vger.kernel.org dating 29 Mar
2011 from Patrick McLean here
http://www.spinics.net/lists/cpufreq/msg02172.html
with followup from Thomas Renninger
http://www.spinics.net/lists/cpufreq/msg02172.html

but no apparent solution for the problem.


System information:
=======================
uname -a:

Linux intellistation 3.8.5 #2 SMP PREEMPT Fri Mar 29 23:22:57 CET 2013
i686 GNU/Linux


/proc/cpuinfo:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
stepping        : 6
microcode       : 0xd0
cpu MHz         : 900.000
cache size      : 4096 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx
lm constant_tsc arch_perfmon pebs bts aperfmperf pni dtes64 monitor
ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm lahf_lm dtherm tpr_shadow
bogomips        : 4787.62 
clflush size    : 64 
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual 
power management:

[output for processor 1 i.e. second core omitted]


microcode version:

microcode: CPU0 sig=0x6f6, pf=0x1, revision=0xc6
microcode: CPU0 updated to revision 0xd0, date = 2010-09-30
microcode: CPU1 sig=0x6f6, pf=0x1, revision=0xc6
microcode: CPU1 updated to revision 0xd0, date = 2010-09-30
microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Peter Oruba


dmidecode [output shortened]:

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
        Vendor: IBM
        Version: IBM BIOS Version 1.35-[GVE135AUS-1.35]-
        Release Date: 02/19/2008
        Address: 0xE4E70
        Runtime Size: 110992 bytes
        ROM Size: 1024 kB
        Characteristics:
                PCI is supported
                PNP is supported
                APM is supported
                BIOS is upgradeable
                BIOS shadowing is allowed
                ESCD support is available
                Boot from CD is supported
                Selectable boot is supported
                BIOS ROM is socketed
                EDD is supported
                3.5"/720 kB floppy services are supported (int 13h)
                3.5"/2.88 MB floppy services are supported (int 13h)
                Print screen service is supported (int 5h)
                8042 keyboard services are supported (int 9h)
                Serial services are supported (int 14h)
                Printer services are supported (int 17h)
                CGA/mono video services are supported (int 10h)
                ACPI is supported
                USB legacy is supported
                LS-120 boot is supported
                ATAPI Zip drive boot is supported
                IEEE 1394 boot is supported
                BIOS boot specification is supported
                Function key-initiated network boot is supported
                Targeted content distribution is supported
        BIOS Revision: 1.35

Handle 0x0001, DMI type 1, 27 bytes
System Information
        Manufacturer: IBM
        Product Name: IBM IntelliStation M Pro -[9229Y18]-
        Version: Revision A 
        Serial Number: 99C5054
        UUID: 4066AA45-FE58-B601-069E-00145E64AEC0
        Wake-up Type: APM Timer
        SKU Number: Not Specified
        Family: Not Specified

Handle 0x0002, DMI type 2, 8 bytes
Base Board Information
        Manufacturer: IBM
        Product Name: M50
        Version: REV : 1.01
        Serial Number: 79N15Z




Thank you very much in advance!

Kind regards,

Simon Kalteis

