From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] New: Single CPU bound process results in non-optimal
 turbo boost configuration
Date: Sun, 21 Oct 2012 23:56:46 +0000 (UTC)
Message-ID: <bug-49231-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=49231

           Summary: Single CPU bound process results in non-optimal turbo
                    boost configuration
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.4.4+
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: ras243-korg@yahoo.com
        Regression: No


Created an attachment (id=84251)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=84251)
3.4.13 config file

Firstly I hope I've classified this issue correctly as it's a bit difficult to
nail down exactly what's at fault.  

I have a new i7-3930k CPU on an Intel DX79SR motherboard which doesn't appear
to be handling the turbo boost function correctly under Linux.  This is a 6
core CPU which is nominally 3.2GHz but can boost itself to somewhere between
3.5GHz and 3.8GHz.  With 6 processes running it'll run at 3.5GHz which is fine.
 The problem is that when only a single process is active it'll still only run
at 3.5GHz despite being able to go to 3.8GHz.  The problem appears to be that a
single job is pulling all the cores out of C7 state and into at least C1 state
and once there, they're all are considered active and hence the fully utilised
CPU is unable to go beyond 3.5GHz.

I am unsure if the problem is with the scheduler, ACPI, or something in my
configuration.  I can confirm that a 3.4.4 kernel configuration which works
correctly on a Xeon X5660 doesn't work correctly with the i7-3930k.  I've tried
various kernels between 3.4.4 and 3.6.2 but all result in the same behaviour. 
With gritted teeth I installed Windows 7 and it does appear to work correctly
there so I don't believe it's anything to do with BIOS settings.

Idle turbostat results:
core CPU   %c0   GHz  TSC   %c1    %c3    %c6    %c7   %pc2   %pc3   %pc6  
%pc7

           2.73 1.20 3.20   7.06   0.00   0.02  90.19  20.20   0.00  68.20 
0.00
   0   0   2.68 1.20 3.20   6.92   0.00   0.00  90.40  20.20   0.00  68.20 
0.00
   1   1   2.75 1.20 3.20   6.92   0.00   0.00  90.33  20.20   0.00  68.20 
0.00
   2   2   2.78 1.20 3.20   6.99   0.00   0.00  90.23  20.20   0.00  68.20 
0.00
   3   3   2.71 1.20 3.20   7.10   0.00   0.00  90.19  20.20   0.00  68.20 
0.00
   4   4   2.71 1.20 3.20   7.14   0.00   0.07  90.07  20.20   0.00  68.20 
0.00
   5   5   2.76 1.20 3.20   7.27   0.00   0.07  89.90  20.20   0.00  68.20 
0.00

Single job turbostat results:
core CPU   %c0   GHz  TSC   %c1    %c3    %c6    %c7   %pc2   %pc3   %pc6  
%pc7

          18.46 3.50 3.20  81.54   0.00   0.00   0.00   0.00   0.00   0.00 
0.00
   0   0   2.02 3.50 3.20  97.98   0.00   0.00   0.00   0.00   0.00   0.00 
0.00
   1   1   2.19 3.50 3.20  97.81   0.00   0.00   0.00   0.00   0.00   0.00 
0.00
   2   2   2.20 3.50 3.20  97.80   0.00   0.00   0.00   0.00   0.00   0.00 
0.00
   3   3   2.17 3.50 3.20  97.83   0.00   0.00   0.00   0.00   0.00   0.00 
0.00
   4   4 100.00 3.50 3.20   0.00   0.00   0.00   0.00   0.00   0.00   0.00 
0.00
   5   5   2.18 3.50 3.20  97.82   0.00   0.00   0.00   0.00   0.00   0.00 
0.00

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
