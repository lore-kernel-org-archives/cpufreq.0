From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 18662] New: kondemand/1  stuck
Date: Thu, 16 Sep 2010 09:21:40 GMT
Message-ID: <bug-18662-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=18662

           Summary: kondemand/1  stuck
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.18-194.11.1.el5PAE
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: tcflorea@yahoo.com
        Regression: No


kondemand/1 consume 100% CPU usage and all processes on that CPU hangs.
Below is a snapshot from /var/log/messages
---cut here---
Sep 16 10:04:15 robucws091x last message repeated 4 times
Sep 16 10:48:08 robucws091x kernel: BUG: soft lockup - CPU#1 stuck for 10s!
[kondemand/1:1962]
Sep 16 10:48:08 robucws091x kernel: 
Sep 16 10:48:08 robucws091x kernel: Pid: 1962, comm:          kondemand/1
Sep 16 10:48:08 robucws091x kernel: EIP: 0060:[<f89522f9>] CPU: 1
Sep 16 10:48:08 robucws091x kernel: EIP is at rtl8169_interrupt+0x216/0x236
[r8169]
Sep 16 10:48:08 robucws091x kernel:  EFLAGS: 00000206    Tainted: P      
(2.6.18-194.11.1.el5PAE #1)
Sep 16 10:48:08 robucws091x kernel: EAX: 00000040 EBX: 00000040 ECX: c381ab58
EDX: f890803e
Sep 16 10:48:08 robucws091x kernel: ESI: f74ed400 EDI: f74ed000 EBP: f8908000
DS: 007b ES: 007b
Sep 16 10:48:08 robucws091x kernel: CR0: 8005003b CR2: 29aba114 CR3: 37970340
CR4: 000006f0
Sep 16 10:48:08 robucws091x kernel:  [<c044cff5>] handle_IRQ_event+0x45/0x8c
Sep 16 10:48:08 robucws091x kernel:  [<c044d0c0>] __do_IRQ+0x84/0xd6
Sep 16 10:48:08 robucws091x kernel:  [<c044d03c>] __do_IRQ+0x0/0xd6
Sep 16 10:48:08 robucws091x kernel:  [<c040749e>] do_IRQ+0x99/0xc3
Sep 16 10:48:08 robucws091x kernel:  [<c0405946>] common_interrupt+0x1a/0x20
Sep 16 10:48:08 robucws091x kernel:  [<c042a7e7>] __do_softirq+0x57/0x114
Sep 16 10:48:08 robucws091x kernel:  [<c04073bb>] do_softirq+0x52/0x9c
Sep 16 10:48:08 robucws091x kernel:  [<c04059d7>]
apic_timer_interrupt+0x1f/0x24
Sep 16 10:48:08 robucws091x kernel:  [<c05127f4>] acpi_os_write_port+0x1e/0x36
Sep 16 10:48:08 robucws091x kernel:  [<f8bc4439>]
acpi_cpufreq_target+0x202/0x2d2 [acpi_cpufreq]
Sep 16 10:48:08 robucws091x kernel:  [<c05b0002>]
store_scaling_max_freq+0x3c/0x5a
Sep 16 10:48:08 robucws091x kernel:  [<f8bc4237>] acpi_cpufreq_target+0x0/0x2d2
[acpi_cpufreq]
Sep 16 10:48:08 robucws091x kernel:  [<c05b00c1>]
__cpufreq_driver_target+0x47/0x53
Sep 16 10:48:08 robucws091x kernel:  [<f8bc9546>] do_dbs_timer+0x244/0x2be
[cpufreq_ondemand]
Sep 16 10:48:08 robucws091x kernel:  [<c04336e2>] run_workqueue+0x78/0xb5
Sep 16 10:48:08 robucws091x kernel:  [<f8bc9302>] do_dbs_timer+0x0/0x2be
[cpufreq_ondemand]
Sep 16 10:48:08 robucws091x kernel:  [<c0433f96>] worker_thread+0xd9/0x10b
Sep 16 10:48:08 robucws091x kernel:  [<c041fc47>] default_wake_function+0x0/0xc
Sep 16 10:48:08 robucws091x kernel:  [<c0433ebd>] worker_thread+0x0/0x10b
Sep 16 10:48:08 robucws091x kernel:  [<c04363af>] kthread+0xc0/0xed
Sep 16 10:48:08 robucws091x kernel:  [<c04362ef>] kthread+0x0/0xed
Sep 16 10:48:08 robucws091x kernel:  [<c0405c53>] kernel_thread_helper+0x7/0x10
Sep 16 10:48:08 robucws091x kernel:  =======================
Sep 16 10:48:28 robucws091x kernel: BUG: soft lockup - CPU#1 stuck for 10s!
[kondemand/1:1962]
Sep 16 10:48:28 robucws091x kernel: 
Sep 16 10:48:28 robucws091x kernel: Pid: 1962, comm:          kondemand/1
Sep 16 10:48:28 robucws091x kernel: EIP: 0060:[<f89522f9>] CPU: 1
Sep 16 10:48:28 robucws091x kernel: EIP is at rtl8169_interrupt+0x216/0x236
[r8169]
Sep 16 10:48:28 robucws091x kernel:  EFLAGS: 00000206    Tainted: P      
(2.6.18-194.11.1.el5PAE #1)
Sep 16 10:48:28 robucws091x kernel: EAX: 00000040 EBX: 00000040 ECX: c381ab58
EDX: f890803e
Sep 16 10:48:28 robucws091x kernel: ESI: f74ed400 EDI: f74ed000 EBP: f8908000
DS: 007b ES: 007b
Sep 16 10:48:28 robucws091x kernel: CR0: 8005003b CR2: 29aba114 CR3: 37970340
CR4: 000006f0
Sep 16 10:48:28 robucws091x kernel:  [<c044cff5>] handle_IRQ_event+0x45/0x8c
Sep 16 10:48:28 robucws091x kernel:  [<c044d0c0>] __do_IRQ+0x84/0xd6
Sep 16 10:48:28 robucws091x kernel:  [<c044d03c>] __do_IRQ+0x0/0xd6
Sep 16 10:48:28 robucws091x kernel:  [<c040749e>] do_IRQ+0x99/0xc3
Sep 16 10:48:28 robucws091x kernel:  [<c0405946>] common_interrupt+0x1a/0x20
Sep 16 10:48:28 robucws091x kernel:  [<c042a7e7>] __do_softirq+0x57/0x114
Sep 16 10:48:28 robucws091x kernel:  [<c04073bb>] do_softirq+0x52/0x9c
Sep 16 10:48:28 robucws091x kernel:  [<c04059d7>]
apic_timer_interrupt+0x1f/0x24
Sep 16 10:48:28 robucws091x kernel:  [<c05127f4>] acpi_os_write_port+0x1e/0x36
Sep 16 10:48:28 robucws091x kernel:  [<f8bc4439>]
acpi_cpufreq_target+0x202/0x2d2 [acpi_cpufreq]
Sep 16 10:48:28 robucws091x kernel:  [<c05b0002>]
store_scaling_max_freq+0x3c/0x5a
Sep 16 10:48:28 robucws091x kernel:  [<f8bc4237>] acpi_cpufreq_target+0x0/0x2d2
[acpi_cpufreq]
Sep 16 10:48:28 robucws091x kernel:  [<c05b00c1>]
__cpufreq_driver_target+0x47/0x53
Sep 16 10:48:28 robucws091x kernel:  [<f8bc9546>] do_dbs_timer+0x244/0x2be
[cpufreq_ondemand]
Sep 16 10:48:28 robucws091x kernel:  [<c04336e2>] run_workqueue+0x78/0xb5
Sep 16 10:48:28 robucws091x kernel:  [<f8bc9302>] do_dbs_timer+0x0/0x2be
[cpufreq_ondemand]
Sep 16 10:48:28 robucws091x kernel:  [<c0433f96>] worker_thread+0xd9/0x10b
Sep 16 10:48:28 robucws091x kernel:  [<c041fc47>] default_wake_function+0x0/0xc
Sep 16 10:48:28 robucws091x kernel:  [<c0433ebd>] worker_thread+0x0/0x10b
Sep 16 10:48:28 robucws091x kernel:  [<c04363af>] kthread+0xc0/0xed
Sep 16 10:48:28 robucws091x kernel:  [<c04362ef>] kthread+0x0/0xed
Sep 16 10:48:28 robucws091x kernel:  [<c0405c53>] kernel_thread_helper+0x7/0x10
Sep 16 10:48:28 robucws091x kernel:  =======================
Sep 16 10:48:48 robucws091x kernel: BUG: soft lockup - CPU#1 stuck for 10s!
[kondemand/1:1962]
Sep 16 10:48:48 robucws091x kernel: 
Sep 16 10:48:48 robucws091x kernel: Pid: 1962, comm:          kondemand/1
Sep 16 10:48:48 robucws091x kernel: EIP: 0060:[<f89522f9>] CPU: 1
Sep 16 10:48:48 robucws091x kernel: EIP is at rtl8169_interrupt+0x216/0x236
[r8169]
Sep 16 10:48:48 robucws091x kernel:  EFLAGS: 00000206    Tainted: P      
(2.6.18-194.11.1.el5PAE #1)
Sep 16 10:48:48 robucws091x kernel: EAX: 00000040 EBX: 00000040 ECX: c381ab58
EDX: f890803e
Sep 16 10:48:48 robucws091x kernel: ESI: f74ed400 EDI: f74ed000 EBP: f8908000
DS: 007b ES: 007b
Sep 16 10:48:48 robucws091x kernel: CR0: 8005003b CR2: 29aba114 CR3: 37970340
CR4: 000006f0
Sep 16 10:48:48 robucws091x kernel:  [<c044cff5>] handle_IRQ_event+0x45/0x8c
Sep 16 10:48:48 robucws091x kernel:  [<c044d0c0>] __do_IRQ+0x84/0xd6
Sep 16 10:48:48 robucws091x kernel:  [<c044d03c>] __do_IRQ+0x0/0xd6
Sep 16 10:48:48 robucws091x kernel:  [<c040749e>] do_IRQ+0x99/0xc3
Sep 16 10:48:48 robucws091x kernel:  [<c0405946>] common_interrupt+0x1a/0x20
Sep 16 10:48:48 robucws091x kernel:  [<c042a7e7>] __do_softirq+0x57/0x114
Sep 16 10:48:48 robucws091x kernel:  [<c04073bb>] do_softirq+0x52/0x9c
Sep 16 10:48:48 robucws091x kernel:  [<c04059d7>]
apic_timer_interrupt+0x1f/0x24
Sep 16 10:48:48 robucws091x kernel:  [<c05127f4>] acpi_os_write_port+0x1e/0x36
Sep 16 10:48:48 robucws091x kernel:  [<f8bc4439>]
acpi_cpufreq_target+0x202/0x2d2 [acpi_cpufreq]
Sep 16 10:48:48 robucws091x kernel:  [<c05b0002>]
store_scaling_max_freq+0x3c/0x5a
Sep 16 10:48:48 robucws091x kernel:  [<f8bc4237>] acpi_cpufreq_target+0x0/0x2d2
[acpi_cpufreq]
Sep 16 10:48:48 robucws091x kernel:  [<c05b00c1>]
__cpufreq_driver_target+0x47/0x53
Sep 16 10:48:48 robucws091x kernel:  [<f8bc9546>] do_dbs_timer+0x244/0x2be
[cpufreq_ondemand]
Sep 16 10:48:48 robucws091x kernel:  [<c04336e2>] run_workqueue+0x78/0xb5
Sep 16 10:48:48 robucws091x kernel:  [<f8bc9302>] do_dbs_timer+0x0/0x2be
[cpufreq_ondemand]
Sep 16 10:48:48 robucws091x kernel:  [<c0433f96>] worker_thread+0xd9/0x10b
Sep 16 10:48:48 robucws091x kernel:  [<c041fc47>] default_wake_function+0x0/0xc
Sep 16 10:48:48 robucws091x kernel:  [<c0433ebd>] worker_thread+0x0/0x10b
Sep 16 10:48:48 robucws091x kernel:  [<c04363af>] kthread+0xc0/0xed
Sep 16 10:48:48 robucws091x kernel:  [<c04362ef>] kthread+0x0/0xed
Sep 16 10:48:48 robucws091x kernel:  [<c0405c53>] kernel_thread_helper+0x7/0x10
Sep 16 10:48:48 robucws091x kernel:  =======================
---cut here---

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
