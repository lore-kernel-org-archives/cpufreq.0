From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71841] cpufreq ondemand ignore_nice_load doesn't work
Date: Thu, 17 Dec 2015 05:32:37 +0000
Message-ID: <bug-71841-12968-RnkYa1cLsu@https.bugzilla.kernel.org/>
References: <bug-71841-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-71841-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71841

--- Comment #3 from Chen Yu <yu.c.chen@intel.com> ---
(In reply to higuita from comment #0)
> I have a AMD64 cpu (opteron 175) and it use the powernow_k8 cpufreq drive.
> I'm using the ondemand governor and have enables the "ignore_nice_load".
> Yet, i'm right now compiling the kernel 3.15.6 and notice that the cpufreq
> is stick on the 1GHz instead of working on the expected 2.2GHz. The kernel
> compile is running on the default nice level (ie: 0 )
> 
> If i disable the "ignore_nice_load", the cpufreq jumps to the 2.2GHz. 
> 
Could you please use 'top' to show the cpu load?(press '1' once top is running,
then we can see how much percentage of nice on a specific CPU).
thanks
yu

-- 
You are receiving this mail because:
You are the assignee for the bug.
