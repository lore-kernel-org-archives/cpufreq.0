From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 23:41:39 +0000
Message-ID: <bug-77201-12968-4FGFIcoVAg@https.bugzilla.kernel.org/>
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

--- Comment #69 from Rafael J. Wysocki <rjw@rjwysocki.net> ---
(In reply to Mauro from comment #68)
> (In reply to Rafael J. Wysocki from comment #67)
> > For completeness, the commit immediately preceding the one chosen by
> > Srivatsa is
> > 
> > fada94ee64e6 workqueue: add args to workqueue lockdep name
> > 
> > so Mauro, please check if fada94ee64e6 works and then if 5bdfff96c69a fails.
> 
> I have tested both, and both hang. I have used the latest test method of
> using the userspace governor and both hang on the second frequency change
> attempt.

Well, the scheduler changes are left then.

> I'd say my initial bisect might be very close to the source of the problem,
> the reason I say this is because the machine goes into suspend just fine,
> but when trying to resume it hangs (that was my initial testing procedure),
> knowing what I know now I'd say a good guess is it hangs when trying to
> bring the cpu online.

Oh, we know that for sure. :-)

That's why I asked whether or not CPU online worked via sysfs.

-- 
You are receiving this mail because:
You are the assignee for the bug.
