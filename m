From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 11:04:52 +0000
Message-ID: <bug-77201-12968-MDB4KI821y@https.bugzilla.kernel.org/>
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

--- Comment #34 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Srivatsa S. Bhat from comment #33)

> Since Viresh has already set this up, you can try this. If that doesn't
> help, I'll give you a list of possible suspect commits in cpufreq between

What else can be there once I have almost got it back to 3.13.8 ?

> the 2 versions to try out. The ones at the top of my list would be: 

> 12478cf0c55e (cpufreq: Make sure frequency transitions are serialized)
> 
> e0b3165ba521 (cpufreq: add 'freq_table' in struct cpufreq_policy)

Remember, he is getting the problem on 3.14 itself and so no fun playing with
patches that went into 3.15, right? And if I am not wrong these went recently
only.

-- 
You are receiving this mail because:
You are the assignee for the bug.
