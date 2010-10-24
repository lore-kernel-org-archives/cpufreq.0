From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 21082] New: Machine Check Exception on Athlon X2
Date: Sun, 24 Oct 2010 15:27:47 GMT
Message-ID: <bug-21082-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=21082

           Summary: Machine Check Exception on Athlon X2
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.36
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: miguelmarte@gmail.com
        Regression: No


I have been getting random kernel freezes for the past few months using Ubuntu,
Fedora, and Gentoo on this specific machine.  The machine has no hardware
problems as it runs perfectly in windows 7.  I used netconsole to get the
kernel error message.

As far as I can tell, this only happens when X is running as i build gentoo
with out problems.

This is the log from the crash.


[   60.519592] agpgart-amd64 0000:00:00.0: AGP 3.0 bridge
[   60.519619] agpgart-amd64 0000:00:00.0: putting AGP V3 device into 8x mode
[   60.519762] nvidia 0000:01:00.0: putting AGP V3 device into 8x mode
[   62.303042] uhci_hcd 0000:00:10.3: reserve dev 2 ep81-INT, period 8, phase
4, 118 us
[   92.300522] chrome_sandbox (2067): /proc/2061/oom_adj is deprecated, please
use /proc/2061/oom_score_adj instead.
[  117.217169] [Hardware Error]: CPU 0: Machine Check Exception: 4 Bank 4:
b200000000070f0f
[  117.217169] [Hardware Error]: TSC 36e9da8508 
[  117.217169] [Hardware Error]: PROCESSOR 2:20f32 TIME 1287918599 SOCKET 0
APIC 0
[  117.217169] MC4_STATUS: Uncorrected error, other errors lost: no, CPU
context corrupt: yes
[  117.217169] Northbridge Error, node 0
[  117.217169] WDT error: NB transaction timeout.
[  117.217169] Transaction type: generic(generic), timed out, Cache Level:
L3/generic, Participating Processor: generic
[  117.217169] [Hardware Error]: Machine check: Processor context corrupt
[  117.217169] Kernel panic - not syncing: Fatal machine check on current CPU
[  117.217169] Pid: 10, comm: kworker/0:1 Tainted: P   M        2.6.36-gentoo
#3
[  117.217169] Call Trace:
[  117.217169]  <#MC>  [<ffffffff815d7c33>] panic+0x8c/0x194
[  117.217169]  [<ffffffff815d7d77>] ? printk+0x3c/0x3e
[  117.217169]  [<ffffffff81016286>] mce_panic+0x1b6/0x1e0
[  117.217169]  [<ffffffff815de145>] ? atomic_notifier_call_chain+0x15/0x20
[  117.217169]  [<ffffffff810175cf>] do_machine_check+0x73f/0x920
[  117.217169]  [<ffffffff815daec6>] machine_check+0x16/0x20
[  117.217169]  [<ffffffff8101a3b0>] ?
query_current_values_with_pending_wait+0x30/0xa0
[  117.217169]  <<EOE>>  [<ffffffff8101a874>] write_new_fid+0x64/0x100
[  117.217169]  [<ffffffff8101b032>] powernowk8_target+0x502/0x760
[  117.217169]  [<ffffffff81436732>] __cpufreq_driver_target+0x32/0x40
[  117.217169]  [<ffffffff81439d3d>] do_dbs_timer+0x3ad/0x3e0
[  117.217169]  [<ffffffff81439990>] ? do_dbs_timer+0x0/0x3e0
[  117.217169]  [<ffffffff8105c146>] process_one_work+0x116/0x450
[  117.217169]  [<ffffffff8105e482>] worker_thread+0x172/0x3d0
[  117.217169]  [<ffffffff8105e310>] ? worker_thread+0x0/0x3d0
[  117.217169]  [<ffffffff81062466>] kthread+0x96/0xa0
[  117.217169]  [<ffffffff81003b94>] kernel_thread_helper+0x4/0x10
[  117.217169]  [<ffffffff810623d0>] ? kthread+0x0/0xa0
[  117.217169]  [<ffffffff81003b90>] ? kernel_thread_helper+0x0/0x10

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
