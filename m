From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: sleeping function called from cpufreq
Date: Mon, 07 Nov 2005 09:36:36 +0100
Message-ID: <436F1214.6000307@drzeus.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932453AbVKGIgr@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LKML <linux-kernel@vger.kernel.org>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

As of lately I've been getting tonnes of these:

[  610.185635] Debug: sleeping function called from invalid context at 
include/linux/rwsem.h:43
[  610.185647] in_atomic():1, irqs_disabled():0
[  610.185653]  [<c01041be>] dump_stack+0x1e/0x20
[  610.185667]  [<c0119b62>] __might_sleep+0xa2/0xc0
[  610.185678]  [<c029de86>] cpufreq_notify_transition+0x46/0x220
[  610.185690]  [<e09d08fc>] centrino_target+0xfc/0x130 [speedstep_centrino]
[  610.185708]  [<c029f17f>] __cpufreq_driver_target+0x5f/0x70
[  610.185718]  [<c02a029d>] cpufreq_set+0x7d/0xa0
[  610.185728]  [<c02a0339>] store_speed+0x49/0x50
[  610.185737]  [<c029e6c6>] store+0x46/0x60
[  610.185745]  [<c01a5f27>] flush_write_buffer+0x37/0x40
[  610.185754]  [<c01a5f98>] sysfs_write_file+0x68/0x90
[  610.185763]  [<c01639b8>] vfs_write+0xa8/0x190
[  610.185773]  [<c0163b57>] sys_write+0x47/0x70
[  610.185781]  [<c01032bb>] sysenter_past_esp+0x54/0x75

Ideas on solving it?

Rgds
Pierre
