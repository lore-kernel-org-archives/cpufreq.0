From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 62851] New: Sometimes cpu frequency is stuck at low levels on
 Dell Lattitude E6320 (Sandybridge i7-2640M)
Date: Fri, 11 Oct 2013 21:54:05 +0000
Message-ID: <bug-62851-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=62851

            Bug ID: 62851
           Summary: Sometimes cpu frequency is stuck at low levels on Dell
                    Lattitude E6320 (Sandybridge i7-2640M)
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.11.3-201.fc19.x86_64
          Hardware: All
                OS: Linux
              Tree: Fedora
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: linuxhippy@gmail.com
        Regression: No

Created attachment 110741
  --> https://bugzilla.kernel.org/attachment.cgi?id=110741&action=edit
cpuinfo output

Since updating to 3.10 or 3.11, I sometimes find my Dell Lattitude be stuck at
very low CPU frequency levels despite it is not overheated and powered by the
adaptor. This causes desite sluggish user experience e.g. build-scripts which
usually take 1:30 to run for over 5:00 minutes.

I first thought this is caused by a buggy BIOS version, so I updated to the
latest available version A18 (June 2013) - which cured the poweroff-problems at
reboot I was experiencing (introduced with 3.11), but didn't help the frequency
scaling issues.

Syslog doesn't show any indication what is going on, the only message I saw
which could be somehow related is:
[30440.014649] perf samples too long (2502 > 2500), lowering
kernel.perf_event_max_sample_rate to 50000

I currently do not have time to bisect the issue, but keep it files in case
there are others experiencing the same issues.

-- 
You are receiving this mail because:
You are the assignee for the bug.
