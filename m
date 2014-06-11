From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 11:12:28 +0000
Message-ID: <bug-77201-12968-0D2a5baSeF@https.bugzilla.kernel.org/>
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

--- Comment #35 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
(In reply to Viresh Kumar from comment #34)
> (In reply to Srivatsa S. Bhat from comment #33)
> 
> > Since Viresh has already set this up, you can try this. If that doesn't
> > help, I'll give you a list of possible suspect commits in cpufreq between
> 
> What else can be there once I have almost got it back to 3.13.8 ?
> 

No, you misunderstood my intention. Of course your branch is a much
stricter one with all new cpufreq commits reverted.

I was just trying to point out commits which came after 3.13.8, in case even
your branch (3.13.8 along with cpufreq reverts) ends up passing his tests. In
that case we'll have to narrow down *within* the commits between v3.13.8 and
v3.14.1, no? My list was to help with that.

> > the 2 versions to try out. The ones at the top of my list would be: 
> 
> > 12478cf0c55e (cpufreq: Make sure frequency transitions are serialized)
> > 
> > e0b3165ba521 (cpufreq: add 'freq_table' in struct cpufreq_policy)
> 
> Remember, he is getting the problem on 3.14 itself and so no fun playing
> with patches that went into 3.15, right? And if I am not wrong these went
> recently only.

Right, sorry, I was doing a diff between 3.13.8 and 3.15-rc8 (based on his
first report) by mistake. Ignore these 2 commits, they are recent. But the
other ones I listed came in between v3.13.8 and v3.14, so they might be worth
trying.

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
