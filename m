From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 14:05:21 +0000 (UTC)
Message-ID: <20130322140521.554BF11FB81@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #23 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-22 14:05:21 ---
On 22 March 2013 19:24, Borislav Petkov <bp@alien8.de> wrote:
> No, you're breaking existing drivers with your changes - nobody will fix
> stuff *you're* breaking.
>
> You need to get the hardware and test your changes on *that* hardware
> too. Otherwise, the offending patches should be reverted until you can
> provide a patchset which works on everything.
>
> Geez, the fact that I even need to explain this...

You are right in every sense and i can't defend myself on that, no excuse.

When i wrote those patches, i fixed many drivers and wasn't aware that
acpi-cpufreq got broken. And only with the mail from Duncan i realized it.

Then i tried to go thorough it & fix it and found there is some stuff in init()
which is is sort of per user case dependent. And wasn't sure how exactly
to fix it and so shouted for help.

But yes i will give it another try to go through the driver in details and see
if i can fix it.

--
viresh

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
