From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Fri, 02 May 2014 14:25:20 +0000
Message-ID: <bug-75121-12968-XzzC71cs64@https.bugzilla.kernel.org/>
References: <bug-75121-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75121-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75121

Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com

--- Comment #5 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
Hi Doug,

I am trying to get phoronix installed to reproduce this (without success so
far)

Could you run:
  perf record -a -c 1 -e power:pstate_sample phoronix-test-suite ffmpeg

And attach the output of:
  perf script

-- 
You are receiving this mail because:
You are the assignee for the bug.
