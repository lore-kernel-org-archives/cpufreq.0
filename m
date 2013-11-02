From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64271] New: Intel Pstate driver - "kick" code is not needed
Date: Sat, 02 Nov 2013 22:17:51 +0000
Message-ID: <bug-64271-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64271

            Bug ID: 64271
           Summary: Intel Pstate driver - "kick" code is not needed
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

There is code in the routine intel_pstate_timer_func to "kick" the CPU out of
the minimum pstate.

The code was added back when several things were not working properly with the
driver. It was added due to a "ping-pong" issue uncovered by the Phoronix test
suite ffpmeg test. I have tried extensively to recreate the issue with the
"kick" code removed and have not been able to. I am unable to detect any
difference with the ffmpeg test between the normal code and code with the "kick
removed" The assertion is that the "kick" code is not required and should be
deleted.

This bug has been extracted from bug 59481 which ended up discussing a few
tangent issues. The main issue was solved and the bug closed. Now I am
following up on some of the tangent issues.

I am saying the kick portion of this code can be removed because it serves no
purpose and makes the code harder to read and understand:

static void intel_pstate_timer_func(unsigned long __data)
{
        struct cpudata *cpu = (struct cpudata *) __data;

        intel_pstate_sample(cpu);
        intel_pstate_adjust_busy_pstate(cpu);

        if (cpu->pstate.current_pstate == cpu->pstate.min_pstate) {
                cpu->min_pstate_count++;
                if (!(cpu->min_pstate_count % 5)) {
                        intel_pstate_set_pstate(cpu, cpu->pstate.max_pstate);
                }
        } else
                cpu->min_pstate_count = 0;

        intel_pstate_set_sample_time(cpu);
}

Where this was left on 2013.07.18 with Dirk Brandewie was that he wanted to go
back and verify in his test environment. Which, of course, should be done.

-- 
You are receiving this mail because:
You are the assignee for the bug.
