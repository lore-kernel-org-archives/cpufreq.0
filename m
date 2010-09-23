From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16489] kmemleak after suspend2ram in cpufreq driver
Date: Thu, 23 Sep 2010 21:30:26 GMT
Message-ID: <201009232130.o8NLUQ8f009214@demeter2.kernel.org>
References: <bug-16489-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16489-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D16489





--- Comment #1 from Toralf F=C3=B6rster <toralf.foerster@gmx.de>  2010-=
09-23 21:30:25 ---
After s2ram and wakeup I got this BTW :


unreferenced object 0xe29f9d40 (size 64):
  comm "default.sh", pid 15954, jiffies 1585745 (age 12642.714s)
  hex dump (first 32 bytes):
    00 00 00 00 e8 a2 24 00 01 00 00 00 00 9f 24 00  ......$.......$.
    02 00 00 00 00 6a 18 00 03 00 00 00 00 35 0c 00  .....j.......5..
  backtrace:
    [<c122fb97>] kmemleak_alloc+0x27/0x50
    [<c109caff>] __kmalloc+0xcf/0x110
    [<f95a87de>] acpi_cpufreq_cpu_init+0x1ee/0x4e4 [acpi_cpufreq]
    [<c11c3cb2>] cpufreq_add_dev+0x142/0x3a0
    [<c123ba46>] cpufreq_cpu_callback+0x5b/0x65
    [<c104c895>] notifier_call_chain+0x35/0x60
    [<c104c9a9>] __raw_notifier_call_chain+0x19/0x20
    [<c103459f>] __cpu_notify+0x1f/0x40
    [<c123a7bd>] _cpu_up+0xc1/0xfe
    [<c122eff7>] enable_nonboot_cpus+0x77/0xb0
    [<c105ffec>] suspend_devices_and_enter+0xec/0x190
    [<c106015a>] enter_state+0xca/0xe0
    [<c105f97b>] state_store+0x6b/0xb0
    [<c1124560>] kobj_attr_store+0x20/0x30
    [<c10e79c4>] sysfs_write_file+0x94/0xf0
    [<c10a28ea>] vfs_write+0x9a/0x190

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.