From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 30712] New: Slow transitioning AMD ondemand CPU because of
 wrong sampling_rate
Date: Mon, 7 Mar 2011 21:54:03 GMT
Message-ID: <bug-30712-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=30712

           Summary: Slow transitioning AMD ondemand CPU because of wrong
                    sampling_rate
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.37
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: justincase@yopmail.com
        Regression: No


This bug has been previously reported on the Debian bugtracker, please have a
look at http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=614256 as it contains
much more information. 

Using the ondemand governor, the time taken for the CPU to rise to max
frequency is noticeable by the user and impact global performance. Setting
sampling_rate to sampling_rate_min makes the the CPU perform much faster
transitions. 

On this processor : 
 AMD Athlon(tm) 64 X2 Dual Core Processor 4200+
 Down freq: 1000MHz / Up freq: 2200MHz

I have: 
 /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate:109000
 /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate_min:10900
 /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_transition_latency:109000

This simple command solves the problem: 
 cat sampling_rate_min >| sampling_rate

So, I suppose the default values are not optimal. In contrast, I have an
Intel(R) Core(TM)2 Duo CPU T7250 @ 2.00GHz, and the three values mentioned
above are all equal to 10000 on this processor. 

I did some dirty benchmarking using the following command: 
 dd if=/dev/zero of=/dev/null bs=300k count=1000

Here are my results in GB/s (several averages) for the AMD CPU:
--------------
performance :
7.61 / 7.61 / 7.61 / 7.56 / 7.37

ondemand (no-tweaking) :
4.83 / 4.68 / 4.73 / 5.14 / 5.51 / 5.37

ondemand (sampling_rate = rampling_rate_min, i.e. default/10) :
7.00 / 7.07 / 7.03 / 7.06 / 7.02 / 7.01 / 7.04
--------------

Please see the original Debian bug report for more information. 

Thanks

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
