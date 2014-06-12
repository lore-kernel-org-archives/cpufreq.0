From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 02:49:41 +0000
Message-ID: <bug-77201-12968-tpsSlF0MqT@https.bugzilla.kernel.org/>
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

--- Comment #55 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Rafael J. Wysocki from comment #52)
> (In reply to registosites from comment #50)
> > (In reply to Srivatsa S. Bhat from comment #48)
> > 
> > Should I also test
> > 
> > e0b3165ba521 (cpufreq: add 'freq_table' in struct cpufreq_policy)
> > 12478cf0c55e (cpufreq: Make sure frequency transitions are serialized)
> > 
> > in case the previous ones work/don't work?
> 
> Yes, please.

Actually no. These must have went into 3.15 and we are trying to debug 3.14
here. Did I miss anything ?

-- 
You are receiving this mail because:
You are the assignee for the bug.
