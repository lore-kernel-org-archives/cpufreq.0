From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 83151] Intel Turbo can't be disabled/enabled under certain
 condictions
Date: Mon, 25 Aug 2014 11:35:02 +0000
Message-ID: <bug-83151-12968-T6JXNb2aSc@https.bugzilla.kernel.org/>
References: <bug-83151-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-83151-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=83151

--- Comment #1 from Gabriele Mazzotta <gabriele.mzt@gmail.com> ---
I also noticed that because of the changes of the turbo state not expected by
intel_pstate, max_perf is sometimes wrong.

The patch should fix my problem. I don't know if there's a way to avoid
reading the register every time or if there's a better way to deal with my
problem.

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index c5eac94..b8adfec 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -218,6 +218,13 @@ static inline void intel_pstate_reset_all_pid(void)
     }
 }

+static int turbo_disabled(void) {
+    u64 misc_en;
+    rdmsrl(MSR_IA32_MISC_ENABLE, misc_en);
+    return (limits.turbo_disabled ||
+            (misc_en & MSR_IA32_MISC_ENABLE_TURBO_DISABLE));
+}
+
 /************************** debugfs begin ************************/
 static int pid_param_set(void *data, u64 val)
 {
@@ -284,10 +291,8 @@ static ssize_t store_no_turbo(struct kobject *a, struct
attribute *b,
     if (ret != 1)
         return -EINVAL;
     limits.no_turbo = clamp_t(int, input, 0 , 1);
-    if (limits.turbo_disabled) {
+    if (turbo_disabled())
         pr_warn("Turbo disabled by BIOS or unavailable on processor\n");
-        limits.no_turbo = limits.turbo_disabled;
-    }
     return count;
 }

@@ -323,6 +328,12 @@ static ssize_t store_min_perf_pct(struct kobject *a,
struct attribute *b,
     return count;
 }

+static ssize_t show_actual_no_turbo(struct kobject *kobj,
+                     struct attribute *attr, char *buf)
+{
+    return sprintf(buf, "%u\n", limits.no_turbo || turbo_disabled());
+}
+
 show_one(no_turbo, no_turbo);
 show_one(max_perf_pct, max_perf_pct);
 show_one(min_perf_pct, min_perf_pct);
@@ -330,11 +341,13 @@ show_one(min_perf_pct, min_perf_pct);
 define_one_global_rw(no_turbo);
 define_one_global_rw(max_perf_pct);
 define_one_global_rw(min_perf_pct);
+define_one_global_ro(actual_no_turbo);

 static struct attribute *intel_pstate_attributes[] = {
     &no_turbo.attr,
     &max_perf_pct.attr,
     &min_perf_pct.attr,
+    &actual_no_turbo.attr,
     NULL
 };

@@ -386,7 +399,7 @@ static void byt_set_pstate(struct cpudata *cpudata, int
pstate)
     u32 vid;

     val = pstate << 8;
-    if (limits.no_turbo && !limits.turbo_disabled)
+    if (limits.no_turbo && !turbo_disabled())
         val |= (u64)1 << 32;

     vid_fp = cpudata->vid.min + mul_fp(
@@ -454,7 +467,7 @@ static void core_set_pstate(struct cpudata *cpudata, int
pstate)
     u64 val;

     val = pstate << 8;
-    if (limits.no_turbo && !limits.turbo_disabled)
+    if (limits.no_turbo && !turbo_disabled())
         val |= (u64)1 << 32;

     wrmsrl_on_cpu(cpudata->cpu, MSR_IA32_PERF_CTL, val);
@@ -501,7 +514,7 @@ static void intel_pstate_get_min_max(struct cpudata *cpu,
int *min, int *max)
     int max_perf_adj;
     int min_perf;

-    if (limits.no_turbo)
+    if (limits.no_turbo || turbo_disabled())
         max_perf = cpu->pstate.max_pstate;

     max_perf_adj = fp_toint(mul_fp(int_tofp(max_perf), limits.max_perf));
@@ -719,7 +732,6 @@ static int intel_pstate_set_policy(struct cpufreq_policy
*policy)
         limits.min_perf = int_tofp(1);
         limits.max_perf_pct = 100;
         limits.max_perf = int_tofp(1);
-        limits.no_turbo = limits.turbo_disabled;
         return 0;
     }
     limits.min_perf_pct = (policy->min * 100) / policy->cpuinfo.max_freq;
@@ -762,7 +774,6 @@ static int intel_pstate_cpu_init(struct cpufreq_policy
*policy)
 {
     struct cpudata *cpu;
     int rc;
-    u64 misc_en;

     rc = intel_pstate_init_cpu(policy->cpu);
     if (rc)
@@ -770,12 +781,8 @@ static int intel_pstate_cpu_init(struct cpufreq_policy
*policy)

     cpu = all_cpu_data[policy->cpu];

-    rdmsrl(MSR_IA32_MISC_ENABLE, misc_en);
-    if (misc_en & MSR_IA32_MISC_ENABLE_TURBO_DISABLE ||
-        cpu->pstate.max_pstate == cpu->pstate.turbo_pstate) {
+    if (cpu->pstate.max_pstate == cpu->pstate.turbo_pstate)
         limits.turbo_disabled = 1;
-        limits.no_turbo = 1;
-    }
     if (limits.min_perf_pct == 100 && limits.max_perf_pct == 100)
         policy->policy = CPUFREQ_POLICY_PERFORMANCE;
     else

-- 
You are receiving this mail because:
You are the assignee for the bug.
