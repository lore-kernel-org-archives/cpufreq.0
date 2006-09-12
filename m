From: Nick Orlov <bugfixer@list.ru>
Subject: [PATCH 2.6.18-rc6-mm1 0/2] cpufreq: make it harder for cpu to leave
 "hot" mode
Date: Mon, 11 Sep 2006 23:29:24 -0400
Message-ID: <20060912032924.GA3677@nickolas.homeunix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964838AbWILD3b@vger.kernel.org>
Content-disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk
Cc: Andrew Morton <akpm@osdl.org>, Dave Jones <davej@codemonkey.org.uk>

Andrew,

I was playing with ondemand cpufreq governor (gotta save on electricity
bills one day :) ) and I've noticed that gameplay become somewhat sluggish.
Especially noticeble in something cpu-power demanding, like quake4.
Quick look at stats/trans_table confirmed that CPU goes out of "hot" mode
way too often.

To make long story short - reverting -mm changes for cpufreq_ondemand.c
helps a _LOT_.  I'm not sure if it is something powersave_bias related or
(most probably) due to alignment of "next do_dbs_timer() fire time" which
could make "collect stats" window too short and introduce significant errors.
Have not specifically checked ...

After thinking about the issue for a while I come up with the following tweaks:
First of all I made hysteresis little bit wider (20% instead of 10).
Another idea was to increase "sampling period" once cpu is in "hot" mode.

Second part also have benefits of reducing the load on already overloaded cpu.
Plus it's damn trivial. To simplify further testing I have exposed
"sampling_rate_hot" parameter through sysfs. Setting it to sampling_rate * 10
works for me very well. Now I do not have to switch governor to "performance"
during game sessions.

Tested on AMD64x2 (32 bit mode).

Could you please consider the following patch for inclusion in -mm?
Should be applied after reverting -mm cpufreq_ondemand.c changes.

Thank you,
	Nick Orlov

P.S. These are the first patches I'm sending to LKML: please, be patient :)

-- 
With best wishes,
	Nick Orlov.
