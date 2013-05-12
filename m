From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 57941] Cpufreq stats are not shown in sysfs
Date: Sun, 12 May 2013 15:18:58 +0000 (UTC)
Message-ID: <20130512151858.6DC7111FB3B@bugzilla.kernel.org>
References: <bug-57941-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-57941-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=57941





--- Comment #1 from Viresh Kumar <viresh.kumar@linaro.org>  2013-05-12 15:18:58 ---
On Fri, May 10, 2013 at 5:37 PM,  <bugzilla-daemon@bugzilla.kernel.org> wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=57941
>
>            Summary: Cpufreq stats are not shown in sysfs
>            Product: Power Management
>            Version: 2.5
>     Kernel Version: 3.9
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: cpufreq
>         AssignedTo: cpufreq@vger.kernel.org
>         ReportedBy: jlec@gentoo.org
>         Regression: Yes
>
>
> Created an attachment (id=101061)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=101061)
>  --> (https://bugzilla.kernel.org/attachment.cgi?id=101061)
> config.gz
>
> I am missing /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state after
> switching from 3.8 to 3.9.

Only this one is missing or complete stats directory?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
