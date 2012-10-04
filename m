From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 48341] New: BUG: using smp_processor_id in preemptible
 powernow_k8
Date: Thu,  4 Oct 2012 12:38:45 +0000 (UTC)
Message-ID: <bug-48341-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=48341

           Summary: BUG: using smp_processor_id in preemptible powernow_k8
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.6.0-rc7 (drm-core-next)
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: lists@andyfurniss.entadsl.com
        Regression: Yes


Created an attachment (id=82111)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=82111)
dmesg 

Since upgrading kernel(drm-core-next) from 

3.6.0-rc2-57331-g269b62d to

3.6.0-rc7-59005-g2216c9e

I am getting these with cpufreq

BUG: using smp_processor_id() in preemptible [00000000] code: modprobe/222
caller is powernowk8_target+0x17/0x50 [powernow_k8]
Pid: 222, comm: modprobe Not tainted 3.6.0-rc7-59005-g2216c9e #1
Call Trace:
 [<c0626ced>] debug_smp_processor_id+0xcd/0xd0
 [<f82dda10>] ? powernowk8_target_fn+0x9b0/0x9b0 [powernow_k8]
 [<f82dda27>] powernowk8_target+0x17/0x50 [powernow_k8]
 [<c0748393>] __cpufreq_driver_target+0x63/0xa0
 [<c04587d6>] ? srcu_notifier_chain_register+0x36/0x60
 [<c074aafd>] cpufreq_governor_userspace+0x16d/0x2d0
 [<c0812eed>] ? notifier_call_chain+0x2d/0x60
 [<c07484c5>] __cpufreq_governor+0x55/0xd0
 [<c07486f9>] __cpufreq_set_policy+0x179/0x240
 [<c0565163>] ? sysfs_add_file+0x13/0x20
 [<c0749dfe>] cpufreq_add_dev+0x66e/0x7b0
 [<c0810372>] ? _raw_spin_unlock_irqrestore+0x12/0x30
 [<c074a640>] ? cpufreq_update_policy+0x100/0x100
 [<c06aa44d>] subsys_interface_register+0x7d/0xb0
 [<f82dc640>] ? write_new_fid+0x140/0x140 [powernow_k8]
 [<c07494cc>] cpufreq_register_driver+0x9c/0x1d0
 [<f82de64d>] powernowk8_init+0x16d/0x1cd [powernow_k8]
 [<f82de4e0>] ? powernowk8_cpu_init+0x8e0/0x8e0 [powernow_k8]
 [<c04011f3>] do_one_initcall+0x103/0x150
 [<c04588da>] ? blocking_notifier_call_chain+0x1a/0x20
 [<c048a577>] sys_init_module+0xc7/0x10a0
 [<c062f000>] ? ddebug_dyndbg_param_cb+0x70/0x70
 [<c0815d93>] sysenter_do_call+0x12/0x22


dmesg attached.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
