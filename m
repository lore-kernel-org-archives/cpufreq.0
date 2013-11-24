From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65591] New: Haswell CPU is not going to powersafe mode.
Date: Sun, 24 Nov 2013 08:25:31 +0000
Message-ID: <bug-65591-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65591

            Bug ID: 65591
           Summary: Haswell CPU is not going to powersafe mode.
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.12.0-031200-generic #201311031935 SMP Mon Nov 4
                    00:36:54 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: tomas.ivanek@gmail.com
        Regression: No

CPU speed is not going to powersafe mode - to 800 Mhz. It' always >1.6 GHz
Minfreq is defined as 800000. 

Intel(R) Core(TM) i5-4200U CPU @ 1.60GHz

root@dell-xps:/sys/devices/system/cpu/cpu0/cpufreq# grep "" *
affected_cpus:0
cpuinfo_cur_freq:1878812
cpuinfo_max_freq:2600000
cpuinfo_min_freq:800000
cpuinfo_transition_latency:4294967295
related_cpus:0
scaling_available_governors:performance powersave
scaling_driver:intel_pstate
scaling_governor:powersave
scaling_max_freq:2600000
scaling_min_freq:800000
scaling_setspeed:<unsupported>

-- 
You are receiving this mail because:
You are the assignee for the bug.
