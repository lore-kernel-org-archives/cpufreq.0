From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23712] New: kmemleak in cpufreq_register_driver
Date: Thu, 25 Nov 2010 08:48:43 GMT
Message-ID: <bug-23712-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23712

           Summary: kmemleak in cpufreq_register_driver
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.36.1
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


Created an attachment (id=38162)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=38162)
kmemleak

Yesterday I got the attached kmemleak after a ThinkPad T400 was waked from
s2ram:

unreferenced object 0xf5cb8b00 (size 64):
  comm "modprobe", pid 1016, jiffies 4294676606 (age 39077.100s)
  hex dump (first 32 bytes):
    00 00 00 00 e8 a2 24 00 01 00 00 00 00 9f 24 00  ......$.......$.
    02 00 00 00 00 6a 18 00 03 00 00 00 00 35 0c 00  .....j.......5..
  backtrace:
    [<c1253837>] kmemleak_alloc+0x27/0x50
    [<c10b042f>] __kmalloc+0xbf/0x120
    [<f9a807ee>] acpi_cpufreq_cpu_init+0x1ee/0x4e4 [acpi_cpufreq]
    [<c11e3ef2>] cpufreq_add_dev+0x142/0x3a0
    [<c11a82f7>] sysdev_driver_register+0x97/0x110
    [<c11e3456>] cpufreq_register_driver+0x86/0x140
    [<f9a84080>] 0xf9a84080
    [<c1001130>] do_one_initcall+0x30/0x160
    [<c1064909>] sys_init_module+0x99/0x1e0
    [<c1002d53>] sysenter_do_call+0x12/0x22
    [<ffffffff>] 0xffffffff
...

Much more are attached onto this bug report.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
