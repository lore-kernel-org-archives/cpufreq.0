From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58801] intel_pstate/powersave - cpu frequency remains at high
 level if if system is idle
Date: Sat, 25 May 2013 09:07:20 +0000 (UTC)
Message-ID: <20130525090720.94F1011FB3B@bugzilla.kernel.org>
References: <bug-58801-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58801-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58801





--- Comment #1 from Rafael J. Wysocki <rjw@sisk.pl>  2013-05-25 09:07:20 ---
On Saturday, May 25, 2013 07:24:54 AM bugzilla-daemon@bugzilla.kernel.org
wrote:
[...]
> 
> With the kernel versions 3.9.3 and now even 3.9.4 the frequency remains at a
> quite high frequency (3.0 or 2.9 GHz) even if the the system is completely
> idle.
> 
> As I have not changed the kernel-config when I updated to the versions 3.9.3
> and 3.9.4 I assume some bug was introduced in the kernel as of 3.9.3.
> 
> Please let me know if you need any further info.

Can you possibly identify the change between 3.9.1 and 3.9.3 that introduced
the problem for you?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
