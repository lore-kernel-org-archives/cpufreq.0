From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] New: Cores stuck at max frequency after resume from
 suspend (Haswell)
Date: Thu, 21 Nov 2013 09:34:03 +0000
Message-ID: <bug-65301-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65301

            Bug ID: 65301
           Summary: Cores stuck at max frequency after resume from suspend
                    (Haswell)
           Product: Power Management
           Version: 2.5
    Kernel Version: v3.12
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: zoku88@gmail.com
        Regression: No

Created attachment 115381
  --> https://bugzilla.kernel.org/attachment.cgi?id=115381&action=edit
ver_linux, cpuinfo and lspci outputs

The problem is that even though CPU usage is at ~0%, the cores are always stuck
at their max frequency after resume.

I thought this was related to https://bugzilla.kernel.org/show_bug.cgi?id=58971

However, I cloned the kernel git repo and checked out the commit that fixed
that bug (7dcd2677ea912573d9ed4bcd629b0023b2d11505), and the fix had no effect
(maybe SNB only?). So, this seems like it might have a different cause.

I have attached my system information.

As I've only had this laptop since around the time linux 3.11 came out, I'm not
really sure when the last time this didn't happen, though that commit seems to
have been made on top of one of the linux 3.10 rc's.

-- 
You are receiving this mail because:
You are the assignee for the bug.
