From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72211] New: intel_pstate Haswell CPU is not entering hardware
 package idle state
Date: Sun, 16 Mar 2014 16:30:22 +0000
Message-ID: <bug-72211-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72211

            Bug ID: 72211
           Summary: intel_pstate Haswell CPU is not entering hardware
                    package idle state
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.13.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: opensource@macht-blau.org
        Regression: No

Created attachment 129641
  --> https://bugzilla.kernel.org/attachment.cgi?id=129641&action=edit
Kernel Config (Archlinux)

Intel Pentium G3220 is not reaching package idle states above PC3. 

CPU is in C6 for over 99% (no C7 on pentium). Package idle states start with
97% in PC2. After five minute idle they drop to 97% PC3. But they never enter
PC6. 

Kernel (archlinux), 
Linux eagle 3.13.6-1-ARCH #1 SMP PREEMPT Fri Mar 7 22:47:48 CET 2014 x86_64
GNU/Linux

config is attached. I tried 3.14-rc6 with similiar results. 

turbostat output is below. 


[root@eagle ~]# turbostat -v
turbostat v3.5 April 26, 2013 - Len Brown <lenb@kernel.org>
CPUID(0): GenuineIntel 13 CPUID levels; family:model:stepping 0x6:3c:3 (6:60:3)
CPUID(6): APERF, DTS, PTM, EPB
30 * 100 = 3000 MHz TSC frequency
cpu0: MSR_IA32_POWER_CTL: 0x0004005d (C1E auto-promotion: DISabled)
cpu0: MSR_NHM_SNB_PKG_CST_CFG_CTL: 0x1e000403 (UNdemote-C3, UNdemote-C1,
demote-C3, demote-C1, UNlocked: pkg-cstate-limit=3: pc6)
cpu0: MSR_NHM_TURBO_RATIO_LIMIT: 0x1e1e1e1e
30 * 100 = 3000 MHz max turbo 4 active cores
30 * 100 = 3000 MHz max turbo 3 active cores
30 * 100 = 3000 MHz max turbo 2 active cores
30 * 100 = 3000 MHz max turbo 1 active cores
cpu0: MSR_IA32_ENERGY_PERF_BIAS: 0x00000006 (balanced)
cpu0: MSR_RAPL_POWER_UNIT: 0x000a0e03 (0.125000 Watts, 0.000061 Joules,
0.000977 sec.)
cpu0: MSR_PKG_POWER_INFO: 0x000001a8 (53 W TDP, RAPL 0 - 0 W, 0.000000 sec.)
cpu0: MSR_PKG_POWER_LIMIT: 0x428212001a81a8 (UNlocked)
cpu0: PKG Limit #1: ENabled (53.000000 Watts, 8.000000 sec, clamp DISabled)
cpu0: PKG Limit #2: ENabled (66.250000 Watts, 0.002441* sec, clamp DISabled)
cpu0: MSR_PP0_POLICY: 0
cpu0: MSR_PP0_POWER_LIMIT: 0x00000000 (UNlocked)
cpu0: Cores Limit: DISabled (0.000000 Watts, 0.000977 sec, clamp DISabled)
cpu0: MSR_PP1_POLICY: 0
cpu0: MSR_PP1_POWER_LIMIT: 0x00000000 (UNlocked)
cpu0: GFX Limit: DISabled (0.000000 Watts, 0.000977 sec, clamp DISabled)
cpu0: MSR_IA32_TEMPERATURE_TARGET: 0x00641400 (100 C)
cpu0: MSR_IA32_PACKAGE_THERM_STATUS: 0x88490000 (27 C)
cpu0: MSR_IA32_THERM_STATUS: 0x88490000 (27 C +/- 1)
cpu1: MSR_IA32_THERM_STATUS: 0x88490000 (27 C +/- 1)

cor CPU    %c0  GHz  TSC SMI    %c1    %c3    %c6    %c7 
          0.13 2.99 2.99   0   0.02   0.00  99.85   0.00
  0   0   0.22 2.99 2.99   0   0.02   0.00  99.77   0.00
  1   1   0.03 2.99 2.99   0   0.03   0.00  99.94   0.00

CTMP  PTMP   %pc2   %pc3   %pc6   %pc7  Pkg_W  Cor_W GFX_W
   26   28   2.11  97.50   0.00   0.00  10.30   0.03  0.00
   26   28   2.11  97.50   0.00   0.00  10.30   0.03  0.00
   25

-- 
You are receiving this mail because:
You are the assignee for the bug.
