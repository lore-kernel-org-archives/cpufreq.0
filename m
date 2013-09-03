From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] New: scaling_max_freq cannot be set to values larger
 than bios_limit
Date: Tue, 03 Sep 2013 12:47:50 +0000
Message-ID: <bug-60839-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60839

            Bug ID: 60839
           Summary: scaling_max_freq cannot be set to values larger than
                    bios_limit
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.10.10
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: sven.koehler@gmail.com
        Regression: No

Background:

On my Dell Latitude E6410, the following happens if the power supply is plugged
in or plugged out: The value of bios_limit drops for all CPUs to
cpuinfo_min_freq. Within seconds, it is then gradually increased until
bios_limit is equal to cpuinfo_max_freq. I assume, that this serves the purpose
of detecting the type of attached power supply. The BIOS temporarely limits the
CPU frequency in order to keep the power consumption low until it is determined
that the power supply is the correct one.

Problem description:

Assume that nobody is writing to scaling_max_freq and that
scaling_max_freq=cpuinfo_max_freq initially. Upon switching the power supply, 
you observe that the value of scaling_max_freq decreases and then gradually
increases along with bios_limit. From this I conclude that
(a) internally, the value for scaling_max_freq can assume values larger than
bios_limit. However, when reading scaling_max_freq through sysfs the value is
clipped by bios_limit
(b) there is no good reason, why the internal value of scaling_max_freq
shouldn't be set to a value larger than bios_limit.

However, any write to scaling_max_freq through sysfs will also be clipped by
bios_limit. In result, if the value of cpuinfo_max_freq is written to
scaling_max_freq while bios_limit is low, then the internal value of
scaling_max_freq will be set to whatever the value of bios_limit is.

In my case, this was causing the following problems:
laptop-mode-tools would write to scaling_max_freq shortly after the power
supply was plugged in / unplugged. As the bios_limit would be low at that
point, the internal value of scaling_max_freq would be set to a low value.
Hence, cpufreq would never raise the frequencies of my CPUs again even after
bios_limit increased. I solved it my disabling the cpufreq related parts of
laptop-mode-tools. 

Also note, that it isn't currently possible to determine the true value of
scaling_max_freq as the value returned through sysfs is clipped by bios_limit.

-- 
You are receiving this mail because:
You are the assignee for the bug.
