From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16489] New: kmemleak after suspend2ram in cpufreq driver
Date: Sun, 1 Aug 2010 14:19:35 GMT
Message-ID: <bug-16489-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16489

           Summary: kmemleak after suspend2ram in cpufreq driver
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.35-rc6+
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: toralf.foerster@gmx.de
        Regression: No


If I suspend2ram my ThinkPad T400 and wake it up, then
/sys/kernel/debug/kmemleak contains an entry like this:

unreferenced object 0xf6788640 (size 64):
  comm "modprobe", pid 1038, jiffies 4294676277 (age 7682.155s)
  hex dump (first 32 bytes):
    00 00 00 00 e8 a2 24 00 01 00 00 00 00 9f 24 00  ......$.......$.
    02 00 00 00 00 6a 18 00 03 00 00 00 00 35 0c 00  .....j.......5..
  backtrace:
    [<c122f8f7>] kmemleak_alloc+0x27/0x50
    [<c109cb6f>] __kmalloc+0xcf/0x110
    [<f94f87de>] acpi_cpufreq_cpu_init+0x1ee/0x4e4 [acpi_cpufreq]
    [<c11c3a72>] cpufreq_add_dev+0x142/0x3a0
    [<c1187e27>] sysdev_driver_register+0x97/0x110
    [<c11c2a06>] cpufreq_register_driver+0x86/0x140
    [<f94fc080>] 0xf94fc080
    [<c100112d>] do_one_initcall+0x2d/0x180
    [<c105ef29>] sys_init_module+0x99/0x1e0
    [<c1002d97>] sysenter_do_call+0x12/0x26
    [<ffffffff>] 0xffffffff


What's interesting is that this entry only appears after the wakeup (and an
additional wait time of usually 20 minutes) however the "age" is from the boot
time of that system.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
