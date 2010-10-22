From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Fri, 22 Oct 2010 23:52:37 GMT
Message-ID: <201010222352.o9MNqbjN011090@demeter2.kernel.org>
References: <bug-16072-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16072-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16072





--- Comment #18 from Thomas Renninger <trenn@suse.de>  2010-10-22 23:52:22 ---
Sigh, a p4_clockmod discussion again.
I promised myself to stay out of those, but as you provide quite some wrong
information let's clear some things up:

> This shiould not be closed as an "undicumemented bug".  The machine is a
> standard HP Pavilion A630N machine (presumably which hundreds of thousands
> were manufactured in the 2003-2005 time frame).
Which does not support CPU frequency scaling, where is the problem?
The CPU itself simply cannot do it.

> In monitoring the Gentoo bug framework I am aware that there are laptops
> being manufactured to date (2010) which contain Bios which do not contain
> the proper code to  properly inform about the BIOS capabilities.
This has nothing to do with BIOS capabilities.

> There are two dividing lines -- some people want their machine to be
> responsive -- and that may have prompted the change in p4-clockmod.c
This high transition latency will cause that you cannot properly work with it.
It may not be that bad if you use it as a server without user interaction, but
also there p4_clockmod will not save any/much power, see below.

> And I can watch the power consumption decrease on a Watt-Meter which the
> machine is plugged into.
How much is this for a totally idle system?
Please try again, I do not believe this.

Hmm, this machine does not even support C2...

Still I doubt you gain any/much power consumption with p4_clockmod.
Can you do some checks please if you still have the power meter and measure
power consumption if:
  1) p4_clockmod not used and machine is as idle as possible
     (top, kill some processes if necessary)
  2) p4_clockmod is used and machine is as idle as possible
     (top, kill some processes if necessary).
  3) Fully utilized CPU (do "cat /dev/zero >/dev/null &" two or three times and
     kill it again after measuring) with p4_clockmod unused
  4) Fully utilized CPU (do "cat /dev/zero >/dev/null &" two or three times and
     kill it again after measuring) with p4_clockmod used
  5) You should see such a line in dmesg:
     "using mwait in idle threads"
     If this is the case try: idle=halt boot param
     and measure the same as done in 1. (double check that the message in dmesg
     disappeared).

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
