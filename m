From: Sriram V <vshrirama@gmail.com>
Subject: double deletion of timer.
Date: Mon, 27 Jan 2014 14:32:07 +0530
Message-ID: <CAH9_wRP-LQnenkBrG2i96G4zKTiWsQH1BXHoPCD5Kw0xam=fPQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=edWsHmebRdintKG5Seeu8eqn9kOf21UoL3lAGgwNuAk=;
        b=Lum0M/e/SNLkiYzSeuRTm7Z6iA3COHFIUr/O/578xfdObaD9hQAeUh3niDfcxrqw/Y
         zmTf2kIq7HUI+yWGr+iDGTczQ6wwb+zVaMwyRm9oDUcNxqV7fG1X3WDulWSEwX6tLIpL
         CE1NGkDervqIM7JiWXdI3hQij8iudFslSH48DM4HBKeVcg41uiJYh6y6aDKThoNqLTft
         g+o3Msw/IVO8uOEBoy7Ym3Aie43+aSxj9AKeGsCr6AY/FEKvUNABQrTezXsuTnMQISW2
         +O8nT/uxaDum3wg8A4CvItmspG3ml/ydSkTmfZxEcxy9nygrRh8q0/+Gl90uGh5bOh3+
         wx8w==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

I am trying to debug an random issue in which __list_del gets a prev
pointer which is LIST_POISON, But the next pointer contains a valid
value.
There seems to be a double deletion. Since the next pointer is valid -
It determines that the timer is pending and tries to delete it
resulting in a crash.

I am trying to understand when this could happen from the cpufreq governor.

There are a couple of new patches recently applied in the kernel that
deal with timer corruption. Not sure if they take care of this.


<1>[56.190608541 C0 104 ]    Unable to handle kernel paging request at
virtual address 00200200
<1>[56.198518541 C0 104 ]    pgd = c0004000
<1>[56.201913618 C0 104 ]    [00200200] *pgd=00000000
<0>[56.206186387 C0 104 ]    Internal error: Oops: 805 [#1] PREEMPT SMP ARM
<4>[56.212357848 C0 104 ]    Modules linked in: shmobilelfb(O) pvrsrvkm(O)
<4>[56.218468464 C0 104 ]    CPU: 0 PID: 104 Comm: kworker/0:1
Tainted: G          O 3.10.17 #1
<4>[56.226461925 C0 104 ]    Workqueue: events od_dbs_timer
<4>[56.231250695 C0 104 ]    task: ef0f9100 ti: ef2a0000 task.ti: ef2a0000
<4>[56.237336541 C0 104 ]    PC is at detach_if_pending+0x48/0x11c
<4>[56.242726387 C0 104 ]    LR is at del_timer+0x48/0x64
<4>[56.247336310 C0 104 ]    pc : [<c004487c>]    lr : [<c0044c5c>]
psr: 20030193
<4>[57.235326079 C0 104 ]    [<c004487c>]
(detach_if_pending+0x48/0x11c) from [<c0044c5c>] (del_timer+0x48/0x64)
<4>[57.244710310 C0 104 ]    [<c0044c5c>] (del_timer+0x48/0x64) from
[<c0052b44>] (try_to_grab_pending+0x40/0x188)
<4>[57.254264695 C0 104 ]    [<c0052b44>]
(try_to_grab_pending+0x40/0x188) from [<c0052ec8>]
(mod_delayed_work_on+0x38/0x94)
<4>[57.264687695 C0 104 ]    [<c0052ec8>]
(mod_delayed_work_on+0x38/0x94) from [<c040faec>]
(gov_queue_work+0xb4/0xc0)
<4>[57.274590156 C0 104 ]    [<c040faec>] (gov_queue_work+0xb4/0xc0)
from [<c040f6c0>] (od_dbs_timer+0xbc/0x140)
<4>[57.283970079 C0 104 ]    [<c040f6c0>] (od_dbs_timer+0xbc/0x140)
from [<c0051f0c>] (process_one_work+0x158/0x4b4)
<4>[57.293696618 C0 104 ]    [<c0051f0c>]
(process_one_work+0x158/0x4b4) from [<c00523a4>]
(worker_thread+0x13c/0x444)
<4>[57.303596925 C0 104 ]    [<c00523a4>] (worker_thread+0x13c/0x444)
from [<c0058d34>] (kthread+0xb4/0xc0)
<4>[57.312546925 C0 104 ]    [<c0058d34>] (kthread+0xb4/0xc0) from
[<c000ffc8>] (ret_from_fork+0x14/0x20)



Regards,
Sriram
