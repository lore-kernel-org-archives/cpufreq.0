From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Tue, 10 Jun 2014 04:41:19 +0000
Message-ID: <bug-77201-12968-eDjAfo1YIY@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #15 from Viresh Kumar <viresh.kumar@linaro.org> ---
Hi,

Can you please add these to top of your drivers/cpufreq/Makefile

ccflags-y := -DDEBUG
ccflags-y += -DVERBOSE_DEBUG16:34

and then give us bootlogs & offline+online logs?

-- 
You are receiving this mail because:
You are the assignee for the bug.
