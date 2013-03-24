From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Sun, 24 Mar 2013 10:31:05 +0000 (UTC)
Message-ID: <20130324103105.D92A911FB35@bugzilla.kernel.org>
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





--- Comment #33 from Borislav Petkov <bp@alien8.de>  2013-03-24 10:31:05 ---
On Sun, Mar 24, 2013 at 02:40:53PM +0530, Viresh Kumar wrote:
> > And powernow-k8 does not exist anymore..., fortunately I didn't have to
> > look at this stuff for some time.
> 
> Sure? Driver is still present in mainline.

powernow-k8 is still there for, well, K8 only. Newer machines are
handled by acpi-cpufreq. Thus is acpi-cpufreq's health of major
importance especially now. :)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
