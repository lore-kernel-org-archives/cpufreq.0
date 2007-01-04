From: "s\.filice\@libero\.it" <s.filice@libero.it>
Subject: Fwd:P4 frequencies problem
Date: Thu,  4 Jan 2007 13:00:26 +0100
Message-ID: <JBCEOQ$CD97DE72EE35FAFA88C2B7E6DAFE615F@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: cpufreq <cpufreq@lists.linux.org.uk>

Hi , I am Sante Filice an italian Linux user, and with the last kernels I=
 have some problems with cpu frequencies.
I have an Asus laptop A2800S with a P4 processor. This is the output of c=
puid :
 eax in    eax      ebx      ecx      edx
00000000 00000002 756e6547 6c65746e 49656e69
00000001 00000f29 00010809 00004400 bfebfbff
00000002 665b5101 00000000 00000000 007b7040
80000000 80000004 00000000 00000000 00000000
80000001 00000000 00000000 00000000 00000000
80000002 20202020 20202020 20202020 6e492020
80000003 286c6574 50202952 69746e65 52286d75
80000004 20342029 20555043 30382e32 007a4847

Vendor ID: "GenuineIntel"; CPUID level 2

Intel-specific functions:
Version 00000f29:
Type 0 - Original OEM
Family 15 - Pentium 4
Extended family 0
Model 2 - 
Stepping 9
Reserved 0

Brand index: 9 [not in table]
Extended brand string: "              Intel(R) Pentium(R) 4 CPU 2.80GHz"
CLFLUSH instruction cache line size: 8
Hyper threading siblings: 1

Feature flags bfebfbff:
FPU    Floating Point Unit
VME    Virtual 8086 Mode Enhancements
DE     Debugging Extensions
PSE    Page Size Extensions
TSC    Time Stamp Counter
MSR    Model Specific Registers
PAE    Physical Address Extension
MCE    Machine Check Exception
CX8    COMPXCHG8B Instruction
APIC   On-chip Advanced Programmable Interrupt Controller present and ena=
bled
SEP    Fast System Call
MTRR   Memory Type Range Registers
PGE    PTE Global Flag
MCA    Machine Check Architecture
CMOV   Conditional Move and Compare Instructions
FGPAT  Page Attribute Table
PSE-36 36-bit Page Size Extension
CLFSH  CFLUSH instruction
DS     Debug store
ACPI   Thermal Monitor and Clock Ctrl
MMX    MMX instruction set
FXSR   Fast FP/MMX Streaming SIMD Extensions save/restore
SSE    Streaming SIMD Extensions instruction set
SSE2   SSE2 extensions
SS     Self Snoop
HT     Hyper Threading
TM     Thermal monitor
31     reserved

TLB and cache info:
51: Instruction TLB: 4KB and 2MB or 4MB pages, 128 entries
5b: Data TLB: 4KB and 4MB pages, 64 entries
66: 1st-level data cache: 8KB, 4-way set assoc, 64 byte line size
40: No 2nd-level cache, or if 2nd-level cache exists, no 3rd-level cache
70: Trace cache: 12K-micro-op, 4-way set assoc
7b: 2nd-level cache: 512KB, 8-way set assoc, sectored, 64 byte line size


Now the problem is this: with the kernel 2.6.14.2 cpufreq-info shows this=
 informations: 

cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Per favore, comunicare errori e malfunzionamenti a linux@brodo.de.
analisi della CPU 0:
  modulo p4-clockmod
  CPU per le quali e` necessario cambiare la frequenza contemporaneamente=
: 0
  limiti hardware: 350 MHz - 2.80 GHz
  frequenze disponibili: 350 MHz, 700 MHz, 1.05 GHz, 1.40 GHz, 1.75 GHz, =
2.10 GHz, 2.45 GHz, 2.80 GHz
  gestori disponibili: ondemand, powersave, userspace, performance
  gestore corrente: la frequenza deve mantenersi tra 350 MHz e 2.80 GHz.
                   Il gestore "performance" puo` decidere quale velocita`=
 usare
                  in questo intervallo.
  la frequenza attuale della CPU e` 2.80 GHz (ottenuta da una chiamata di=
retta all'hardware).

but with kernels 2.6.18 , 2.6.18.1 , 2.6.19 , 2.6.19.1 the cpufreq-info o=
utput is this:

cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Per favore, comunicare errori e malfunzionamenti a linux@brodo.de.
analisi della CPU 0:
  modulo p4-clockmod
  CPU per le quali e` necessario cambiare la frequenza contemporaneamente=
: 0
  limiti hardware: 2.10 GHz - 2.80 GHz
  frequenze disponibili: 2.10 GHz, 2.45 GHz, 2.80 GHz
  gestori disponibili: conservative, ondemand, powersave, userspace, perf=
ormance
  gestore corrente: la frequenza deve mantenersi tra 2.10 GHz e 2.80 GHz.=

                   Il gestore "performance" puo` decidere quale velocita`=
 usare
                  in questo intervallo.
  la frequenza attuale della CPU e` 2.80 GHz (ottenuta da una chiamata di=
retta all'hardware).

Newer kernels don't let me use lower frequencies.Can you help me to solve=
 this problem?


Happy new year and huge thanks

Sante Filice


------------------------------------------------------
Passa a Infostrada. ADSL e Telefono senza limiti e senza canone Telecom
http://click.libero.it/infostrada22dic06

=0A=0A=0A------------------------------------------------------=0APassa a=
 Infostrada. ADSL e Telefono senza limiti e senza canone Telecom=0Ahttp:/=
/click.libero.it/infostrada04gen07=0A
