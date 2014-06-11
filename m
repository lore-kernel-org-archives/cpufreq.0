From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 12:02:29 +0000
Message-ID: <bug-77201-12968-k274NS0jmn@https.bugzilla.kernel.org/>
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

--- Comment #38 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Srivatsa S. Bhat from comment #37)
> (In reply to Viresh Kumar from comment #36)

> > But in that case, wouldn't a git bisect between v3.13.8..my-branch would be

s/3.13.8/3.14

> > easier?
> 
> Yes, a git bisect would have been ideal, but apparently it is failing due to
> build errors in intermediate commits (see his first report and bisect log)
> :-(
> So we might have to manually pick suspect commits to test...

Does the above change make it any better ?

We only have few revert patches (GOOD) on top of 3.14 (BAD) and can easily make
out which one is making 3.14 good :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
