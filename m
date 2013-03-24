From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Sun, 24 Mar 2013 12:23:42 +0000 (UTC)
Message-ID: <20130324122342.CD68511FB35@bugzilla.kernel.org>
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





--- Comment #36 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-24 12:23:42 ---
On 24 March 2013 17:46, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Fixing Duncan's issues shouldn't be a very big deal now as i was thinking too
> much about what was broken without my patches too. And now that part is
> pretty clear.

Hi Duncan,

Try attached patch and this should take back your system to where it was.

NOTE: With this patch your related_cpus wouldn't show any groups and
related cpus must be same as affected cpus. All cpu*/cpufreq must be
directories now and no symlinks.

--
viresh

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
