From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64251] New: Intel Pstate driver minimum percent does not change
 with turbo off
Date: Sat, 02 Nov 2013 21:42:47 +0000
Message-ID: <bug-64251-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64251

            Bug ID: 64251
           Summary: Intel Pstate driver minimum percent does not change
                    with turbo off
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.12rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: dsmythies@telus.net
        Regression: No

Created attachment 113141
  --> https://bugzilla.kernel.org/attachment.cgi?id=113141&action=edit
Frequency Vs. Requested Frequency

When turbo is turned off the maximum frequency percent does not change. O.K.
So the minimum frequency percent should change, but it doesn't.

Using my computer as an example: The turbo on maximum frequency is 3.8 GHz; The
turbo off maximum frequency is 3.4 GHz; The minimum frequency is 1.6 GHz.

Therefore we would expect: For turbo on, max percent = 100, min percent = 42;
For turbo off, max percent = 100, min percent = 47.

starting from a fresh boot:

doug@s15:~$ uname -a
Linux s15 3.12.0-rc7+ #48 SMP Fri Nov 1 21:09:51 PDT 2013 x86_64 x86_64 x86_64
GNU/Linux
doug@s15:~$ cat /sys/devices/system/cpu/intel_pstate/*
100
42
0
doug@s15:~$ cd temp
doug@s15:~/temp$ sudo ./set_cpu_turbo_off
[sudo] password for doug:
doug@s15:~/temp$ cat /sys/devices/system/cpu/intel_pstate/*
100
42
1
doug@s15:~/temp$ cat set_cpu_turbo_off
#! /bin/bash
echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo

The attached png file demonstrates. (the rounding part will be a separate bug
report)

Note: This bug is extracted from bug 59481 which mentioned several issues, the
main issue was solved and the bug closed. Now I am following up on the other
issues.

-- 
You are receiving this mail because:
You are the assignee for the bug.
