From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Thu, 24 Dec 2015 13:04:20 +0000
Message-ID: <bug-65501-12968-wP77bACVhS@https.bugzilla.kernel.org/>
References: <bug-65501-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65501-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65501

--- Comment #20 from Chen Yu <yu.c.chen@intel.com> ---
(In reply to sworddragon2 from comment #19)
> I'm still noticing on some games random performance drops if they are
> threading too much. I think it is time for another ping to get this more or
> less done :)
Tested with MIN_FREQUENCY_UP_THRESHOLD = 1, seems no problem under different
cpu load, but if  set with CONFIG_HZ_PERIODIC should apply this one first:
https://patchwork.kernel.org/patch/7859871/

-- 
You are receiving this mail because:
You are the assignee for the bug.
