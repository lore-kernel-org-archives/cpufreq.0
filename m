From: Guru Prasad <gurupras@buffalo.edu>
Subject: Changing CPU frequency in atomic (schedule / scheduler_tick)
Date: Mon, 17 Aug 2015 23:46:16 -0400
Message-ID: <CAMefCkCm10Rz3Ou_4gWhXhBzF44mS7K19WQrQF+aF+WC3-mceQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=pzMlhaeOV1OczZPaJgXpFBLNmgWoasdSH2NRi3K4LRk=;
        b=Gwse/zHazM/9lPrJxqEVPql+fNgxc/Um9jXxSOzb1kv9Bgt6j0El2nQgUwslKUCh7I
         pk7A50isz+IttDZUSv3xrd9ZP+XHV+dPZJwAY6f6wVv3Y9DuioOgEDXGti8r652WhMPM
         a7sUxqcU9uRUybTWXd5Qk6P4R+s0gEqSraTwSbHOWYaEvyQ0zhuM2j2gFfj0YetzaIZb
         S1zT2mjVvUvpXEGP1Cx0HQt5UGevLlbFBLq+YfGCtBGrq+vXKJ93fTKspqejaQ/0UJ/T
         Ja/fKgq2uWxmtoopA3drENgeFIUjMjRKUix6ccjSiWTkbeq8baOhRQWBl0VzNv5RSI81
         vIQQ==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Hi,

We're working on a research system where we're trying to achieve
optimal frequency selection on a per-process basis. To do so, I added
additional fields to struct task_struct to store the (computed)
optimal frequency and set it. The code that computes the optimal
frequency is calculated on every scheduler_tick().

I'm having trouble calling cpufreq_set_rate() from both a)
scheduler_tick() and b) schedule().

Ideally, Once the optimal frequency is computed, I'd like to save it
and set it. Upon context switches, I'm hoping to switch frequencies to
the previously computed optimal values for the process being context
switched in.

Unfortunately, with my calls to cpufreq_set_rate(), sometimes, the
kernel just hangs without any panic/warn/bug output and sometimes I'm
hitting the following BUG. I'm not sure if they're both related.

[   58.746809] BUG: scheduling while atomic: android.browser/1749/0x00210001
[   58.746858] Modules linked in:
[   58.746892] CPU: 0 PID: 1749 Comm: android.browser Not tainted
3.13.0-rc2-00183-g7115e92-dirty #1314
[   58.746978] [<80017938>] (unwind_backtrace+0x0/0xf8) from
[<80012c78>] (show_stack+0x10/0x14)
[   58.747049] [<80012c78>] (show_stack+0x10/0x14) from [<805a65d0>]
(dump_stack+0x7c/0xb8)
[   58.747113] [<805a65d0>] (dump_stack+0x7c/0xb8) from [<805a38a4>]
(__schedule_bug+0x50/0x60)
[   58.747179] [<805a38a4>] (__schedule_bug+0x50/0x60) from
[<805a85a8>] (__schedule+0x66c/0x968)
[   58.747246] [<805a85a8>] (__schedule+0x66c/0x968) from [<805a8cc0>]
(schedule_preempt_disabled+0x24/0x34)
[   58.747320] [<805a8cc0>] (schedule_preempt_disabled+0x24/0x34) from
[<805aa474>] (__mutex_lock_slowpath+0x15c/0x218)
[   58.747400] [<805aa474>] (__mutex_lock_slowpath+0x15c/0x218) from
[<805aa578>] (mutex_lock+0x48/0x4c)
[   58.747474] [<805aa578>] (mutex_lock+0x48/0x4c) from [<80442348>]
(cpufreq_set+0x14/0x64)
[   58.747539] [<80442348>] (cpufreq_set+0x14/0x64) from [<80440e90>]
(cpufreq_set_rate+0x38/0x54)
[   58.747609] [<80440e90>] (cpufreq_set_rate+0x38/0x54) from
[<8006f158>] (power_agile_tune+0x18c/0x258)
[   58.747681] [<8006f158>] (power_agile_tune+0x18c/0x258) from
[<8004e02c>] (scheduler_tick+0x198/0x1e0)
[   58.747757] [<8004e02c>] (scheduler_tick+0x198/0x1e0) from
[<800302dc>] (update_process_times+0x4c/0x58)
[   58.747833] [<800302dc>] (update_process_times+0x4c/0x58) from
[<80079884>] (tick_sched_handle+0x48/0x54)
[   58.747907] [<80079884>] (tick_sched_handle+0x48/0x54) from
[<80079ae4>] (tick_sched_timer+0x48/0x74)
[   58.747977] [<80079ae4>] (tick_sched_timer+0x48/0x74) from
[<800441c0>] (__run_hrtimer+0x74/0x27c)
[   58.748046] [<800441c0>] (__run_hrtimer+0x74/0x27c) from
[<80044f3c>] (hrtimer_interrupt+0x120/0x2c4)
[   58.748119] [<80044f3c>] (hrtimer_interrupt+0x120/0x2c4) from
[<8045e9f8>] (arch_timer_handler_phys+0x28/0x30)
[   58.748201] [<8045e9f8>] (arch_timer_handler_phys+0x28/0x30) from
[<80066fb4>] (handle_percpu_devid_irq+0x84/0x1b4)
[   58.748281] [<80066fb4>] (handle_percpu_devid_irq+0x84/0x1b4) from
[<80063770>] (generic_handle_irq+0x20/0x30)
[   58.748357] [<80063770>] (generic_handle_irq+0x20/0x30) from
[<8000f85c>] (handle_IRQ+0x40/0x90)
[   58.748548] Exception stack(0x923dd9d8 to 0x923dda20)
[   58.748588] d9c0:
    80200000 923dc020
[   58.748650] d9e0: 00000000 00000001 80c62900 921f01c8 00000000
00000002 923dc000 921f0000
[   58.748711] da00: 921f0000 923ddabc 8080ee58 923dda20 80200001
805a8298 60000013 ffffffff

[   58.748774] [<80013780>] (__irq_svc+0x40/0x70) from [<805a8298>]
(__schedule+0x35c/0x968)
[   58.748838] [<805a8298>] (__schedule+0x35c/0x968) from [<805a8cc0>]
(schedule_preempt_disabled+0x24/0x34)
[   58.748911] [<805a8cc0>] (schedule_preempt_disabled+0x24/0x34) from
[<805aa474>] (__mutex_lock_slowpath+0x15c/0x218)
[   58.748990] [<805aa474>] (__mutex_lock_slowpath+0x15c/0x218) from
[<805aa578>] (mutex_lock+0x48/0x4c)
[   58.749060] [<805aa578>] (mutex_lock+0x48/0x4c) from [<80442348>]
(cpufreq_set+0x14/0x64)
[   58.749124] [<80442348>] (cpufreq_set+0x14/0x64) from [<80440e90>]
(cpufreq_set_rate+0x38/0x54)
[   58.749190] [<80440e90>] (cpufreq_set_rate+0x38/0x54) from
[<805a8784>] (__schedule+0x848/0x968)
[   58.749258] [<805a8784>] (__schedule+0x848/0x968) from [<805a8cc0>]
(schedule_preempt_disabled+0x24/0x34)
[   58.749331] [<805a8cc0>] (schedule_preempt_disabled+0x24/0x34) from
[<805aa474>] (__mutex_lock_slowpath+0x15c/0x218)
[   58.749410] [<805aa474>] (__mutex_lock_slowpath+0x15c/0x218) from
[<805aa578>] (mutex_lock+0x48/0x4c)
[   58.749480] [<805aa578>] (mutex_lock+0x48/0x4c) from [<80442348>]
(cpufreq_set+0x14/0x64)
[   58.749543] [<80442348>] (cpufreq_set+0x14/0x64) from [<80440e90>]
(cpufreq_set_rate+0x38/0x54)
[   58.749609] [<80440e90>] (cpufreq_set_rate+0x38/0x54) from
[<805a8784>] (__schedule+0x848/0x968)
[   58.749677] [<805a8784>] (__schedule+0x848/0x968) from [<805a8960>]
(preempt_schedule+0x40/0x5c)
[   58.749747] [<805a8960>] (preempt_schedule+0x40/0x5c) from
[<800206bc>] (gem5_energy_ctrl_set_performance+0x1c8/0x36c)
[   58.749828] [<800206bc>]
(gem5_energy_ctrl_set_performance+0x1c8/0x36c) from [<80484db0>]
(clk_change_rate+0x5c/0xf8)
[   58.749907] [<80484db0>] (clk_change_rate+0x5c/0xf8) from
[<80484ec4>] (clk_set_rate+0x78/0xb4)
[   58.749974] [<80484ec4>] (clk_set_rate+0x78/0xb4) from [<8044702c>]
(mc_cpufreq_set_target+0x108/0x270)
[   58.750046] [<8044702c>] (mc_cpufreq_set_target+0x108/0x270) from
[<8043f9b8>] (__cpufreq_driver_target+0x70/0x1ac)
[   58.750124] [<8043f9b8>] (__cpufreq_driver_target+0x70/0x1ac) from
[<80442380>] (cpufreq_set+0x4c/0x64)
[   58.750195] [<80442380>] (cpufreq_set+0x4c/0x64) from [<80440e90>]
(cpufreq_set_rate+0x38/0x54)
[   58.750262] [<80440e90>] (cpufreq_set_rate+0x38/0x54) from
[<805a8784>] (__schedule+0x848/0x968)
[   58.750329] [<805a8784>] (__schedule+0x848/0x968) from [<805aaca0>]
(__down_read+0xb4/0xec)
[   58.750397] [<805aaca0>] (__down_read+0xb4/0xec) from [<8001b150>]
(do_page_fault+0xac/0x3a8)
[   58.750462] [<8001b150>] (do_page_fault+0xac/0x3a8) from
[<80008444>] (do_DataAbort+0x38/0x9c)
[   58.750527] [<80008444>] (do_DataAbort+0x38/0x9c) from [<800138f4>]
(__dabt_usr+0x34/0x40)
[   58.750586] Exception stack(0x923ddfb0 to 0x923ddff8)
[   58.750626] dfa0:                                     59a0b000
00000000 000009c0 00000000
[   58.750688] dfc0: 00000000 00000000 00000000 00000000 76cb880c
7ef52604 00000000 7ef5273c
[   58.750749] dfe0: 00000000 7ef52450 00000000 76f10484 20000010 ffffffff

Now, I realize that this is coming from the mutex_lock() calls in my
specific driver's 'target' code. I'm not sure if its safe to get rid
of the mutex_lock/unlock.

I don't believe there are existing examples of how to do this. Having
said that, I'm relatively new to kernel development and so I may have
missed it. If there are indeed some examples, kindly point me to them.


Regards
Guru
