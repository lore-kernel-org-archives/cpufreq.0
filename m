From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54761] New: Variable cpu frequency causes to loose performance
Date: Mon,  4 Mar 2013 14:01:36 +0000 (UTC)
Message-ID: <bug-54761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54761

           Summary: Variable cpu frequency causes to loose performance
           Product: Power Management
           Version: 2.5
    Kernel Version: Ubuntu 3.8.0-9.18-generic 3.8.1
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: sworddragon2@aol.com
        Regression: No


Created an attachment (id=94381)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=94381)
Example application

In my sytsme is an AMD Phenom II X6 1045T with 6 cores and a scaling frequency
of "2700000 2000000 1400000 800000". I have noticed if a process is using ~the
half of cpu time of a core I'm getting heavy performance impacts if I'm using
the ondemand governor. Switching to the performance governor solves this
problem.

I have written a testcase in C which demonstrates this problem (compiled with
"gcc -o governor governor.c -lpthread"). The application creates 20 threads
(change NUM_THREADS in the code if needed) - every of them uses only a little
of cpu time. All threads will be executed on the same core. Here are the
differences between both governors:


ondemand:
The frequency of the related core goes up to 1400 MHz and the used cpu time of
this core is ~50%. The application needs ~7.17 seconds to be finished.

performance:
The frequency of the related core is constantly 2700 MHz and the used cpu time
of this core is ~25%. The application needs ~5.99 seconds to be finished.


The difference between the used cpu time is logical since the frequency is as
double so high. But both runs are far away from a 100% usage so theoretically
they should be as same fast.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
