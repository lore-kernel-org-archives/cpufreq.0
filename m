From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Fri, 22 Mar 2013 14:11:54 +0000 (UTC)
Message-ID: <20130322141154.8CB1F11FB81@bugzilla.kernel.org>
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





--- Comment #26 from Borislav Petkov <bp@alien8.de>  2013-03-22 14:11:54 ---
On Fri, Mar 22, 2013 at 07:35:19PM +0530, Viresh Kumar wrote:
> But yes i will give it another try to go through the driver in details
> and see if i can fix it.

Right, and make sure it is a minimal fix which can go in now. If it
appears to get more involved, we'd probably need to revert now and you
can retry next merge window.

Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
