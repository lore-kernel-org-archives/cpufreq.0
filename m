From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72361] AMD APU reset infinite
Date: Mon, 09 Jun 2014 15:12:02 +0000
Message-ID: <bug-72361-12968-KvZOTww0FR@https.bugzilla.kernel.org/>
References: <bug-72361-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-72361-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72361

ArLi Weng <arliweng@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|cpufreq                     |Video(DRI - non Intel)
            Product|Power Management            |Drivers

--- Comment #9 from ArLi Weng <arliweng@gmail.com> ---
this's i test result:

> radeon.dpm=0, on 3d game 7 fps(v-sync on).

# cat /sys/kernel/debug/dri/0/radeon_pm_info
default engine clock: 200000 kHz
current engine clock: 200000 kHz
default memory clock: 1066000 kHz

> radeon.dpm=-1, on 3d game 60 fps(v-sync on).

#cat /sys/kernel/debug/dri/0/radeon_pm_info
uvd    vclk: 0 dclk: 0
power level 0    sclk: 30400 vddc: 949

but with dpm reset infinite, even i boot lts-kernel before 3.14 most time got
fail. i try

with 'radeon.dynclks=0'
with 'radeon.aspm=0'
with 'echo performance > /sys/class/drm/card0/device/power_dpm_state'

all failed. for now, i must work on dpm=0, but that clock is wrong, i don't
known how adjust that.

-- 
You are receiving this mail because:
You are the assignee for the bug.
