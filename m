From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Tue, 27 Nov 2012 03:43:46 +0000 (UTC)
Message-ID: <20121127034346.2BF0011FB3B@bugzilla.kernel.org>
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





--- Comment #6 from rocko <rockorequin@hotmail.com>  2012-11-27 03:43:45 ---
> re: /proc/cpuinfo MHz value

Yes, it surely must confuse people! I found several sites recommending it.
Additionally, when my system isn't experiencing this bug, it does seem to be
accurate.

> Does the system behave normally after it breaks out of the initial problem?

Yes, after suspend/resume the system works just fine, as far as I can tell.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
