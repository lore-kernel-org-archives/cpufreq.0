From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81701] New: OOPS in cpufreq driver with AMD Kaveri CPU
Date: Mon, 04 Aug 2014 21:45:01 +0000
Message-ID: <bug-81701-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D81701

            Bug ID: 81701
           Summary: OOPS in cpufreq driver with AMD Kaveri CPU
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.16.0
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: oleksandr@natalenko.name
        Regression: No

Occasionally I get my machine hung completely. Fortunately, I've got an=
d saved=20
oops listing using netconsole before hang, and here it is [1].

Here is little piece of oops from the link above:

=3D=3D=3D
[15051.270461] BUG: unable to handle kernel paging request at 00000000f=
f5ae8e4
[15051.271583] IP: [<ffffffff8109ae6e>] srcu_notifier_call_chain+0xe/0x=
20
=E2=80=A6
[15051.956205] Call Trace:
[15051.980641]  [<ffffffff81606085>] ? __cpufreq_notify_transition+0x95=
/0x1e0
[15052.005640]  [<ffffffff816081ee>] cpufreq_notify_transition+0x3e/0x7=
0
[15052.030240]  [<ffffffff816083d8>] cpufreq_freq_transition_begin+0xe8=
/0x130
[15052.054522]  [<ffffffff813b8940>] ? ucs2_strncmp+0x70/0x70
[15052.078208]  [<ffffffff816089bf>] __target_index+0xbf/0x1a0
[15052.101348]  [<ffffffff81608b9c>] __cpufreq_driver_target+0xfc/0x160
[15052.124250]  [<ffffffff8160b0d4>] od_check_cpu+0xa4/0xb0
[15052.146789]  [<ffffffff8160c9ec>] dbs_check_cpu+0x16c/0x1c0
[15052.168935]  [<ffffffff8160b4dd>] od_dbs_timer+0x11d/0x180
[15052.190607]  [<ffffffff8108e6ff>] process_one_work+0x17f/0x4c0
[15052.211825]  [<ffffffff8108f46b>] worker_thread+0x11b/0x3f0
[15052.232490]  [<ffffffff8108f350>] ? create_and_start_worker+0x80/0x8=
0
[15052.253127]  [<ffffffff81096479>] kthread+0xc9/0xe0
[15052.273292]  [<ffffffff810963b0>] ? flush_kthread_worker+0xb0/0xb0
[15052.293487]  [<ffffffff81793efc>] ret_from_fork+0x7c/0xb0
[15052.313544]  [<ffffffff810963b0>] ? flush_kthread_worker+0xb0/0xb0
=E2=80=A6
=3D=3D=3D

Also here is my lspci [2] and cpuinfo [3] as well.

Vanilla 3.15.8 and 3.16.0 are affected as well as latest Ubuntu 3.13 ke=
rnel.

No visible reason to trigger the bug. After hang machine doesn't respon=
d via=20
network, there's no disk IO, and also it doesn't respond to pressing po=
wer=20
button in order to perform soft off.

[1] https://gist.github.com/085af9da81197faf6637
[2] https://gist.github.com/318ebda5576b099590b8
[3] https://gist.github.com/9c1307463c7ad6835b2d

--=20
You are receiving this mail because:
You are the assignee for the bug.