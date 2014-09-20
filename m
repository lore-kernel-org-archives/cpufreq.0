From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 84851] New: CPU scaled down to 600 MHz even under load
Date: Sat, 20 Sep 2014 16:25:32 +0000
Message-ID: <bug-84851-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84851

            Bug ID: 84851
           Summary: CPU scaled down to 600 MHz even under load
           Product: Power Management
           Version: 2.5
    Kernel Version: Tested at the moment with 3.17-rc5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: bgamari@gmail.com
        Regression: No

My Dell Latitude E7440 seems to occassionally enter periods where the
CPU clockrate of all cores (as shown by cpupower and powertop) is stuck in the
few-hundred-MHz range even under load. Often this is around 600 MHz.
At the moment I'm running 3.17-rc5 although I believe I have observed
similar behavior even under older kernels. I'm afraid I don't have a
reliable technique for reproducing the issue although it may be correlated with
S3 suspend. Various 

If under load for long enough (several minutes) it seems it will eventually
clock back up to 2.0GHz. However, if I then kill the load it will clock back
down to 600MHz (as expected) and remain there until again subjected to
prolonged load.

I've attached a tarball with output from the various performance monitoring
tools (cpupower and turbostat) for several sets of conditions,

  * while the machine is idle (v3.15-rc5-idle)
  * while the machine is under load (provided by stress -c4) and clocked at
around 600 MHz (v3.15-rc5-loaded)
  * after the machine has been load for roughly 3.5 minutes and has finally
clocked up to 2 GHz. Oddly it doesn't make it above 2.0GHz despite
cpuinfo_max_freq being 2.9GHz. (v3.15-rc5-loaded2)

Looking through sysfs I found the following a bit odd,

$ for i in /sys/devices/system/cpu/cpu0/cpufreq/*; do echo $i $(sudo cat $i);
done
cpufreq/affected_cpus 0
cpufreq/cpuinfo_cur_freq 628906
cpufreq/cpuinfo_max_freq 2900000
cpufreq/cpuinfo_min_freq 800000
cpufreq/cpuinfo_transition_latency 4294967295
cpufreq/related_cpus 0
cpufreq/scaling_available_governors performance powersave
cpufreq/scaling_driver intel_pstate
cpufreq/scaling_governor powersave
cpufreq/scaling_max_freq 2900000
cpufreq/scaling_min_freq 800000
cpufreq/scaling_setspeed <unsupported>

Note the peculiar value of cpuinfo_transition_latency. Seems just a tad long.

-- 
You are receiving this mail because:
You are the assignee for the bug.
