From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 15:14:55 +0000
Message-ID: <bug-77201-12968-uCnOuJT6og@https.bugzilla.kernel.org/>
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

--- Comment #63 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Mauro from comment #62)
> Created attachment 139471 [details]
> Frequency transition hang
> 
> This one is what happens when I try to do the second frequency transition,
> that is, after:
> 
> boot -> 800M -> cpu offline/online -> 2.2G ->(1) 1.8G
> 
> (1) machine hangs here.

Strange that we didn't got any prints at all :(

Let me try some more hacks :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
