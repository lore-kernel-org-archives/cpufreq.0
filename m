From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Wed, 9 Mar 2011 15:39:39 GMT
Message-ID: <201103091539.p29FddAq026030@demeter2.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #14 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-09 15:39:38 ---
Here is the output of cpuid ... the following seems a bit strange

RDMSR and WRMSR support               = true
....
RDTSCP                                = false

TSC definitely exists on my XP-M but may be the intent was to discourage its
use because it is not reliable when C2 and C3 sleeps states are used ? So I am
going to try the processor.max_cstate=1 command line option as well.

Additionally, I compiled a kernel 2.6.32 with ACPI_PROCESSOR and cpu_freq but
without TSC (by commenting CONFIG_X86_TSC=y in the kernel .config file). I will
try it soon to see if the system can work without the TSC. I am not sure it is
really disabled in this case. I will try prctl also.

-----------------------------------------------------------------

# cpuid -k
CPU 0:
   vendor_id = "AuthenticAMD"
   version information (1/eax):
      processor type  = primary processor (0)
      family          = Intel Pentium Pro/II/III/Celeron/Core/Core 2/Atom, AMD
Athlon/Duron, Cyrix M2, VIA C3 (6)
      model           = 0xa (10)
      stepping id     = 0x0 (0)
      extended family = 0x0 (0)
      extended model  = 0x0 (0)
      (simple synth)  = AMD Athlon XP / Athlon MP / Sempron / mobile Athlon
XP-M / mobile Athlon XP-M (LV) (Barton A2)
   miscellaneous (1/ebx):
      process local APIC physical ID = 0x0 (0)
      cpu count                      = 0x0 (0)
      CLFLUSH line size              = 0x0 (0)
      brand index                    = 0x0 (0)
   brand id = 0x00 (0): unknown
   feature information (1/edx):
      x87 FPU on chip                        = true
      virtual-8086 mode enhancement          = true
      debugging extensions                   = true
      page size extensions                   = true
      time stamp counter                     = true
      RDMSR and WRMSR support                = true
      physical address extensions            = true
      machine check exception                = true
      CMPXCHG8B inst.                        = true
      APIC on chip                           = true
      SYSENTER and SYSEXIT                   = true
      memory type range registers            = true
      PTE global bit                         = true
      machine check architecture             = true
      conditional move/compare instruction   = true
      page attribute table                   = true
      page size extension                    = true
      processor serial number                = false
      CLFLUSH instruction                    = false
      debug store                            = false
      thermal monitor and clock ctrl         = false
      MMX Technology                         = true
      FXSAVE/FXRSTOR                         = true
      SSE extensions                         = true
      SSE2 extensions                        = false
      self snoop                             = false
      hyper-threading / multi-core supported = false
      therm. monitor                         = false
      IA64                                   = false
      pending break event                    = false
   feature information (1/ecx):
      PNI/SSE3: Prescott New Instructions     = false
      PCLMULDQ instruction                    = false
      64-bit debug store                      = false
      MONITOR/MWAIT                           = false
      CPL-qualified debug store               = false
      VMX: virtual machine extensions         = false
      SMX: safer mode extensions              = false
      Enhanced Intel SpeedStep Technology     = false
      thermal monitor 2                       = false
      SSSE3 extensions                        = false
      context ID: adaptive or shared L1 data  = false
      FMA instruction                         = false
      CMPXCHG16B instruction                  = false
      xTPR disable                            = false
      perfmon and debug                       = false
      process context identifiers             = false
      direct cache access                     = false
      SSE4.1 extensions                       = false
      SSE4.2 extensions                       = false
      extended xAPIC support                  = false
      MOVBE instruction                       = false
      POPCNT instruction                      = false
      time stamp counter deadline             = false
      AES instruction                         = false
      XSAVE/XSTOR states                      = false
      OS-enabled XSAVE/XSTOR                  = false
      AVX: advanced vector extensions         = false
      F16C half-precision convert instruction = false
      hypervisor guest status                 = false
   extended processor signature (0x80000001/eax):
      family/generation = AMD Athlon/Duron (7)
      model             = 0xa (10)
      stepping id       = 0x0 (0)
      extended family   = 0x0 (0)
      extended model    = 0x0 (0)
      (simple synth) = AMD Athlon XP / Athlon MP / Sempron / mobile Athlon XP-M
/ mobile Athlon XP-M (LV) (Barton A2)
   extended feature flags (0x80000001/edx):
      x87 FPU on chip                       = true
      virtual-8086 mode enhancement         = true
      debugging extensions                  = true
      page size extensions                  = true
      time stamp counter                    = true
      RDMSR and WRMSR support               = true
      physical address extensions           = true
      machine check exception               = true
      CMPXCHG8B inst.                       = true
      APIC on chip                          = true
      SYSCALL and SYSRET instructions       = true
      memory type range registers           = true
      global paging extension               = true
      machine check architecture            = true
      conditional move/compare instruction  = true
      page attribute table                  = true
      page size extension                   = true
      multiprocessing capable               = true
      no-execute page protection            = false
      AMD multimedia instruction extensions = true
      MMX Technology                        = true
      FXSAVE/FXRSTOR                        = true
      SSE extensions                        = false
      1-GB large page support               = false
      RDTSCP                                = false
      long mode (AA-64)                     = false
      3DNow! instruction extensions         = true
      3DNow! instructions                   = true
   extended brand id (0x80000001/ebx):
      raw     = 0x0 (0)
      BrandId = 0x0 (0)
   AMD feature flags (0x80000001/ecx):
      LAHF/SAHF supported in 64-bit mode = false
      CMP Legacy                         = false
      SVM: secure virtual machine        = false
      extended APIC space                = false
      AltMovCr8                          = false
      LZCNT advanced bit manipulation    = false
      SSE4A support                      = false
      misaligned SSE mode                = false
      PREFETCH/PREFETCHW instructions    = false
      OS visible workaround              = false
      instruction based sampling         = false
      XOP support                        = false
      SKINIT/STGI support                = false
      watchdog timer support             = false
      lightweight profiling support      = false
      4-operand FMA instruction          = false
      NodeId MSR C001100C                = false
      TBM support                        = false
      topology extensions                = false
   brand = "Mobile AMD Athl"
   L1 TLB/cache information: 2M/4M pages & L1 TLB (0x80000005/eax):
      instruction # entries     = 0x8 (8)
      instruction associativity = 0xff (255)
      data # entries            = 0x8 (8)
      data associativity        = 0x4 (4)
   L1 TLB/cache information: 4K pages & L1 TLB (0x80000005/ebx):
      instruction # entries     = 0x10 (16)
      instruction associativity = 0xff (255)
      data # entries            = 0x20 (32)
      data associativity        = 0xff (255)
   L1 data cache information (0x80000005/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x2 (2)
      size (Kb)         = 0x40 (64)
   L1 instruction cache information (0x80000005/edx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x2 (2)
      size (Kb)         = 0x40 (64)
   L2 TLB/cache information: 2M/4M pages & L2 TLB (0x80000006/eax):
      instruction # entries     = 0x0 (0)
      instruction associativity = L2 off (0)
      data # entries            = 0x0 (0)
      data associativity        = L2 off (0)
   L2 TLB/cache information: 4K pages & L2 TLB (0x80000006/ebx):
      instruction # entries     = 0x100 (256)
      instruction associativity = 4-way (4)
      data # entries            = 0x100 (256)
      data associativity        = 4-way (4)
   L2 unified cache information (0x80000006/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 16-way (8)
      size (Kb)         = 0x200 (512)
   L3 cache information (0x80000006/edx):
      line size (bytes)     = 0x0 (0)
      lines per tag         = 0x0 (0)
      associativity         = L2 off (0)
      size (in 512Kb units) = 0x0 (0)
   Advanced Power Management Features (0x80000007/edx):
      temperature sensing diode      = true
      frequency ID (FID) control     = true
      voltage ID (VID) control       = true
      thermal trip (TTP)             = false
      thermal monitor (TM)           = false
      software thermal control (STC) = false
      100 MHz multiplier control     = false
      hardware P-State control       = false
      TscInvariant                   = false
   Physical Address and Linear Address Size (0x80000008/eax):
      maximum physical address bits         = 0x22 (34)
      maximum linear (virtual) address bits = 0x20 (32)
      maximum guest physical address bits   = 0x0 (0)
   Logical CPU cores (0x80000008/ecx):
      number of CPU cores - 1 = 0x0 (0)
      ApicIdCoreIdSize        = 0x0 (0)
   (multi-processing synth): none
   (multi-processing method): AMD
   (synth) = AMD Athlon XP / Athlon MP / Sempron / mobile Athlon XP-M / mobile
Athlon XP-M (LV) (Barton A2)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
