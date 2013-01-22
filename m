From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Tue, 22 Jan 2013 10:53:14 +0000 (UTC)
Message-ID: <20130122105314.951CE11FC73@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721


Klaus Meier <klaus818@googlemail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |klaus818@googlemail.com




--- Comment #13 from Klaus Meier <klaus818@googlemail.com>  2013-01-22 10:53:14 ---
Starting with kernel 3.7.0 i have no frequency scaling with m AMD Phenon.
Thereist no folder /sys/bus/cpu/devices/cpu0/cpufreq

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
