From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 21:28:09 +0000
Message-ID: <bug-77201-12968-o3vU9y0wv1@https.bugzilla.kernel.org/>
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

--- Comment #68 from Mauro <registosites@hotmail.com> ---
(In reply to Rafael J. Wysocki from comment #67)
> For completeness, the commit immediately preceding the one chosen by
> Srivatsa is
> 
> fada94ee64e6 workqueue: add args to workqueue lockdep name
> 
> so Mauro, please check if fada94ee64e6 works and then if 5bdfff96c69a fails.

I have tested both, and both hang. I have used the latest test method of using
the userspace governor and both hang on the second frequency change attempt.

What I'm trying to do now is get the full text output (I've seen something
scroll by that might be interesting).

I've made a serial cable and testing if it is working. Most text is ok but
there are a few glitches here and there, which is expected I guess. If there
are any "optimal" settings do tell :)

I have started what Viresh requested and the first try worked, but I haven't
started moving the debug code to try to find where things go wrong.

I'd say my initial bisect might be very close to the source of the problem, the
reason I say this is because the machine goes into suspend just fine, but when
trying to resume it hangs (that was my initial testing procedure), knowing what
I know now I'd say a good guess is it hangs when trying to bring the cpu
online.

As a last note, I won't have much time to look into this until the weekend, so
radio silence until then doesn't mean I quit ;)

-- 
You are receiving this mail because:
You are the assignee for the bug.
