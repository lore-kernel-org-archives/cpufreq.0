From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Mon, 25 Mar 2013 13:55:21 +0000 (UTC)
Message-ID: <20130325135521.33E9111FB35@bugzilla.kernel.org>
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





--- Comment #39 from Borislav Petkov <bp@alien8.de>  2013-03-25 13:55:20 ---
On Mon, Mar 25, 2013 at 04:53:39PM +0530, Viresh Kumar wrote:
> But for 3.9 i believe this patch should be good enough.

Seems so here too.

Tested-by: Borislav Petkov <bp@suse.de>

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
