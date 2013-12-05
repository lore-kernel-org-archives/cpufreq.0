From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 66581] New: intel_pstate/powersave - cpu frequency remains at
 high level (Turbo) after suspend/resume
Date: Thu, 05 Dec 2013 09:36:53 +0000
Message-ID: <bug-66581-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=66581

            Bug ID: 66581
           Summary: intel_pstate/powersave - cpu frequency remains at high
                    level (Turbo) after suspend/resume
           Product: Power Management
           Version: 2.5
    Kernel Version: Linux genlap 3.12.2-gentoo #3 SMP Wed Dec 4 19:19:01
                    CET 2013 x86_64 Intel(R) Core(TM) i7-4900MQ CPU @
                    2.80GHz GenuineIntel GNU/Linux
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: herrlado@gmail.com
        Regression: No

Created attachment 117541
  --> https://bugzilla.kernel.org/attachment.cgi?id=117541&action=edit
outpot of cpupower

After resume all the cores are showing the max turbo frequences for my cpu.
This is unrealisitc as the max frequence is 2.80 and all the cores can not run
at the max turbo frequence.

-- 
You are receiving this mail because:
You are the assignee for the bug.
