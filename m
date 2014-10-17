From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 86461] intel_pstate does not obey min/max frequencies set by
 user
Date: Fri, 17 Oct 2014 16:43:39 +0000
Message-ID: <bug-86461-12968-GmzStc7vUv@https.bugzilla.kernel.org/>
References: <bug-86461-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-86461-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86461

--- Comment #2 from Alexander E. Patrakov <patrakov@gmail.com> ---
aep-vaio turbostat # ./turbostat sleep 5
    Core     CPU Avg_MHz   %Busy Bzy_MHz TSC_MHz     SMI  CPU%c1  CPU%c3 
CPU%c6  CPU%c7 CoreTmp  PkgTmp Pkg%pc2 Pkg%pc3 Pkg%pc6 Pkg%pc7 PkgWatt CorWatt
GFXWatt 
       -       -      32    2.47    1298    2794       0    5.02    0.04   
0.00   92.47      50      50    3.79    0.02    4.49   77.75    4.43    0.74   
0.45
       0       0      37    2.97    1253    2794       0    6.90    0.07   
0.00   90.06      50      50    3.79    0.02    4.49   77.75    4.43    0.74   
0.45
       0       1      33    2.11    1558    2794       0    7.77
       1       2      27    3.05     895    2794       0    2.06    0.00   
0.00   94.89      50
       1       3      31    1.76    1763    2794       0    3.35
5.004419 sec
aep-vaio turbostat # grep MH /proc/cpuinfo
cpu MHz         : 951.781
cpu MHz         : 835.625
cpu MHz         : 852.468
cpu MHz         : 822.500
aep-vaio turbostat # grep .  /sys/devices/system/cpu/intel_pstate/*
/sys/devices/system/cpu/intel_pstate/max_perf_pct:100
/sys/devices/system/cpu/intel_pstate/min_perf_pct:22
/sys/devices/system/cpu/intel_pstate/no_turbo:0
aep-vaio turbostat # echo 2400000 | tee
/sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
2400000
aep-vaio turbostat # ./turbostat sleep 5
    Core     CPU Avg_MHz   %Busy Bzy_MHz TSC_MHz     SMI  CPU%c1  CPU%c3 
CPU%c6  CPU%c7 CoreTmp  PkgTmp Pkg%pc2 Pkg%pc3 Pkg%pc6 Pkg%pc7 PkgWatt CorWatt
GFXWatt 
       -       -      39    1.74    2229    2794       0    4.47    0.51   
0.00   93.27      53      53    4.40    0.23    5.35   77.63    4.48    0.87   
0.37
       0       0      48    2.42    1981    2794       0    2.50    0.61   
0.00   94.47      53      53    4.40    0.23    5.35   77.63    4.48    0.87   
0.37
       0       1      13    0.78    1727    2794       0    4.14
       1       2      45    1.84    2420    2794       0    5.66    0.42   
0.00   92.08      53
       1       3      50    1.93    2560    2794       0    5.57
5.001705 sec
aep-vaio turbostat # grep MH /proc/cpuinfo
cpu MHz         : 1277.390
cpu MHz         : 1711.718
cpu MHz         : 1661.734
cpu MHz         : 1932.875
aep-vaio turbostat # grep .  /sys/devices/system/cpu/intel_pstate/*
/sys/devices/system/cpu/intel_pstate/max_perf_pct:100
/sys/devices/system/cpu/intel_pstate/min_perf_pct:68
/sys/devices/system/cpu/intel_pstate/no_turbo:0

-- 
You are receiving this mail because:
You are the assignee for the bug.
