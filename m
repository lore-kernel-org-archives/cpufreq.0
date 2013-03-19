From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Tue, 19 Mar 2013 07:57:45 +0000 (UTC)
Message-ID: <20130319075745.B0B7F11FB5D@bugzilla.kernel.org>
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





--- Comment #10 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-19 07:57:45 ---
(In reply to comment #9)
> That's a nice easy test; no rebuild and reboot needed. =:^)
> 
> Tho I had to change the > to >| as I have bash noclobber set and the files
> obviously already exist...
> 
> Uncorrupted before the test, corrupted after.  So just cycling the cpus off and
> then back online *DOES* corrupt cpufreq, thus a much simpler reproducer! =:^) 
> Exact same ls results as the above.

Fuck! I would take out following out of possible culprits list:
- cpufreq core
- s2r/s2d

My system is very much similar to yours as it has multiple cpu groups sharing
policy. The only difference is the driver now which is different for us. My
system is a ARN SoC and your an x86.

I believe you are using acpi-cpufreq driver, right? I haven't gone through it
but will try. I believe it has to do with the updates done on affected_cpus and
related_cpus by me.. That driver might have some strong dependency on that.

CAN SOMEBODY ELSE SEE ACPI-CPUFREQ (WITH PRIOR KNOWLEDGE) DRIVER FROM THIS
PERSPECTIVE.

> Meanwhile, thanks for the cpuinfo_cur_freq explanation.  If that actually
> real-time touches the hardware to get the data as you say, that does explain
> the root privs.  Maybe that bit of extra info could be added to the
> documentation?  I could propose some new wording and open a new bug on
> cpu-freq/user-guide.txt for it if appropriate.

Probably the best thing could be a patch, which we can review and apply :)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
