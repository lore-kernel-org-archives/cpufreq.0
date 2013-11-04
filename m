From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64271] Intel Pstate driver - "kick" code is not needed
Date: Mon, 04 Nov 2013 17:01:13 +0000
Message-ID: <bug-64271-12968-Dgta1WV7rc@https.bugzilla.kernel.org/>
References: <bug-64271-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64271-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64271

--- Comment #4 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
Here is the patch I will send upstream it may not make it until v3.14-rc1 since
the merge window is upon us :-)

commit 7d9aba45dbd356686eca097b31028eccec0e11d6
Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
Date:   Mon Oct 14 07:54:45 2013 -0700

    cpufreq/intel_pstate: Remove periodic P state boost

    Remove the periodic P state boost.  This code required for some corner
    case benchmark tests.  The calculation of the required P state was
    incorrect/inaccurate and would not allow P state increase.

    This was fixed by a combination of commits:
      2134ed4 cpufreq / intel_pstate: Change to scale off of max P-state
      d253d2a intel_pstate: Improve accuracy by not truncating until final
result

    Fixes Bug:
      https://bugzilla.kernel.org/show_bug.cgi?id=64271

    Reported-by: dsmythies@telus.net
    Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 26ab4b8..4d07ae2 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -83,8 +83,6 @@ struct cpudata {
     struct pstate_data pstate;
     struct _pid pid;

-    int min_pstate_count;
-
     u64    prev_aperf;
     u64    prev_mperf;
     int    sample_ptr;
@@ -567,15 +565,6 @@ static void intel_pstate_timer_func(unsigned long __data)

     intel_pstate_sample(cpu);
     intel_pstate_adjust_busy_pstate(cpu);
-
-    if (cpu->pstate.current_pstate == cpu->pstate.min_pstate) {
-        cpu->min_pstate_count++;
-        if (!(cpu->min_pstate_count % 5)) {
-            intel_pstate_set_pstate(cpu, cpu->pstate.max_pstate);
-        }
-    } else
-        cpu->min_pstate_count = 0;
-
     intel_pstate_set_sample_time(cpu);
 }

-- 
You are receiving this mail because:
You are the assignee for the bug.
