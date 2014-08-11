From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 62551] AMD Phenom II 955.: The system freezes for a moment when
 the CPU scaling is enabled
Date: Mon, 11 Aug 2014 15:56:44 +0000
Message-ID: <bug-62551-12968-9sM7o4dD1z@https.bugzilla.kernel.org/>
References: <bug-62551-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-62551-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=62551

zerobertons@yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from zerobertons@yahoo.com ---
I think my problem wasn't related to the cpu scaling after all.
The issue was solved by changing the timer tick handling from idle dynticks
system to periodic timer ticks.
But now with newer kernels I have no issue with the idle dynticks.

-- 
You are receiving this mail because:
You are the assignee for the bug.
