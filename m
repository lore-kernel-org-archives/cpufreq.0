From: Arun KS <arunks.linux@gmail.com>
Subject: Race condition in cpufreq
Date: Wed, 19 Nov 2014 11:25:21 +0530
Message-ID: <CAKZGPAMLm0iHRgfojbxP+Tzbt4eUFovM3NYz83Lnexw3G2QiYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=8yy4qnhsJ2nQtLKgJwj4Npo2tG8kDXN8sGVClBoWsrU=;
        b=bW0ZSYgU0DfuOyGj6i5KoNtAqJT/OtbaLXME9kyfccTCXibFogbKvZfdHCbu99yMgE
         BDIMj9f9NJkKCwMNvXmsJRrUzH1ArSSf1knmQoSnXSvmjkYxuu//TI4wTX8DRmUW6jMK
         Nozj5yxC9+icTCTUAseKqFx6wvrYa/SEmxmizkZ2JRyeD+VymJpvpXSF7raIaHswmuD7
         zw02THjy7l1gk2yy3Bfu/sTit0TwALObU2zimjPM93et7FQbSwngb8rQEhAXQ5bTfPB/
         3oTnauPfplTFgNZj6Wn35NpZCteqiSC2I7W0v6lFGxzd9wty2UVmz7d1+b4xIarUWDkP
         ed0g==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@vger.kernel.org>

Hello,

Seen a race condition in cpufrequency driver.

cpu2 is being hot-plugged out. And this started at say, 20th msec.
-000|context_switch(inline)
-000|need_resched()
-001|preempt_schedule(inline)
-001|preempt_schedule()
-002|static_key_false(inline)
-002|trace_sched_cpu_hotplug(inline)
-002|cpu_down(cpu = 2, ?)
-003|cpu_down(cpu = 2)
-004|update_offline_cores(?)
-005|do_hotplug(?)
-006|kthread(_create = 0xEE85BEBC)

cpu1 is updating the governor at say 60th msec.
echo "some_governor" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
at 60th msec, cpu2 is already hot-plugged but CPU_POST_DEAD has not
called because __cpu_down was scheduled out at cpu_hotplug_done(while
unlocking mutex)

now store_scaling_governor calls cpufreq_set_policy
CPUFREQ_GOV_START iterates through all cpus in policy->cpus(which is
not the correct one now, because cpu2 is already hot-plugged out(DEAD)
but not updated in policy->cpus).

One suggestion is to use CPU_DEAD instead of CPU_POST_DEAD in cpufreq.c

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 644b54e..5fdaf06 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2325,7 +2325,7 @@ static int cpufreq_cpu_callback(struct
notifier_block *nfb,
                        __cpufreq_remove_dev_prepare(dev, NULL);
                        break;

-               case CPU_POST_DEAD:
+               case CPU_DEAD:
                        __cpufreq_remove_dev_finish(dev, NULL);
                        break;

Or add a mutex to serialize the context.
Appreciate your valuable comments.

Thanks,
Arun
