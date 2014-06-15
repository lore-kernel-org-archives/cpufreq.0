From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77951] New: "intel_pstate: Set turbo VID for BayTrail" causes
 stall on Intel NUC DN2820FYKH
Date: Sun, 15 Jun 2014 13:45:10 +0000
Message-ID: <bug-77951-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77951

            Bug ID: 77951
           Summary: "intel_pstate: Set turbo VID for BayTrail" causes
                    stall on Intel NUC DN2820FYKH
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.15
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: rune@megahurts.dk
        Regression: No

The hardware:
DN2820FYKH (BIOS version:0028)


The symptom:
The kernel stalls at "Loading, please wait" or sometimes at the the next line
where udevd is launched.


I did a bisect which identified the commit
21855ff5bcbdd075e1c99772827a84912ab083dd "intel_pstate: Set turbo VID for
BayTrail" as the cause.

I also confirmed it by reverting the commit on v3.15 which fixed the stall.

-- 
You are receiving this mail because:
You are the assignee for the bug.
