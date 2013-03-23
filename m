From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Sat, 23 Mar 2013 18:35:10 +0000 (UTC)
Message-ID: <20130323183510.76F2811FB81@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #28 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-23 18:35:10 ---
On 19 March 2013 14:20, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> We are talking here about a bug reported by Duncan here. His cpu/cpu*/cpufreq
> directory are getting corrupted with 3.9-rc3 and was working well with 3.8

Hi Duncan,

My weekend is already spoiled (due to my bugs :) ) and i don't want to spoil
yours. But this is a important patch to test, can you please give it a
try as soon
as you can? And confirm if this resolves your issues or not? (patch is attached
too)

------------x------------------x------------------

From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Sat, 23 Mar 2013 23:42:44 +0530
Subject: [PATCH] cpufreq: acpi-cpufreq: Set policy->cpus correctly from .init()

With the addition of following patch:

fcf8058 cpufreq: Simplify cpufreq_add_dev()

cpufreq driver's .init() routine must initialize policy->cpus with mask of all
possible cpus (Online + Offline) that share the clock. Then the core would copy
this mask onto policy->related_cpus and will reset policy->cpus to carry only
online cpus.

acpi-cpufreq driver wasn't updated with this assumption and so sometimes when
we try to hot[un]plug cpus at run time, sysfs directories gets corrupted.

This patch fixes acpi-cpufreq driver against this corruption.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/acpi-cpufreq.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 937bc28..ceb5925 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -722,15 +722,7 @@ static int acpi_cpufreq_cpu_init(struct
cpufreq_policy *policy)
     perf = data->acpi_data;
     policy->shared_type = perf->shared_type;

-    /*
-     * Will let policy->cpus know about dependency only when software
-     * coordination is required.
-     */
-    if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
-        policy->shared_type == CPUFREQ_SHARED_TYPE_ANY) {
-        cpumask_copy(policy->cpus, perf->shared_cpu_map);
-    }
-    cpumask_copy(policy->related_cpus, perf->shared_cpu_map);
+    cpumask_copy(policy->cpus, perf->shared_cpu_map);

 #ifdef CONFIG_SMP
     dmi_check_system(sw_any_bug_dmi_table);
@@ -740,9 +732,7 @@ static int acpi_cpufreq_cpu_init(struct
cpufreq_policy *policy)
     }

     if (check_amd_hwpstate_cpu(cpu) && !acpi_pstate_strict) {
-        cpumask_clear(policy->cpus);
-        cpumask_set_cpu(cpu, policy->cpus);
-        cpumask_copy(policy->related_cpus, cpu_sibling_mask(cpu));
+        cpumask_copy(policy->cpus, cpu_sibling_mask(cpu));
         policy->shared_type = CPUFREQ_SHARED_TYPE_HW;
         pr_info_once(PFX "overriding BIOS provided _PSD data\n");
     }


--
viresh

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
