From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 11:37:53 +0000
Message-ID: <bug-77201-12968-6Yp46nBcas@https.bugzilla.kernel.org/>
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

--- Comment #37 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
(In reply to Viresh Kumar from comment #36)
> (In reply to Srivatsa S. Bhat from comment #35)
> > No, you misunderstood my intention. Of course your branch is a much
> > stricter one with all new cpufreq commits reverted.
> > 
> > I was just trying to point out commits which came after 3.13.8, in case even
> > your branch (3.13.8 along with cpufreq reverts) ends up passing his tests.
> > In that case we'll have to narrow down *within* the commits between v3.13.8
> > and v3.14.1, no? My list was to help with that.
> 
> Ahh, sorry..
> 
> But in that case, wouldn't a git bisect between v3.13.8..my-branch would be
> easier?

Yes, a git bisect would have been ideal, but apparently it is failing due to
build errors in intermediate commits (see his first report and bisect log) :-(
So we might have to manually pick suspect commits to test...

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
