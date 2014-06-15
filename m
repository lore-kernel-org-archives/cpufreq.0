From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Sun, 15 Jun 2014 10:30:53 +0000
Message-ID: <bug-77201-12968-bjdC33n4Sc@https.bugzilla.kernel.org/>
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

--- Comment #82 from Mauro <registosites@hotmail.com> ---
I have managed to narrow this down to a function, specifically:
cpufreq_notify_transition(policy, &freqs, CPUFREQ_POSTCHANGE);

Now this is from cpufreq and not powenow-k8, I haven't tried doing anything
inside cpufreq.c because I don't know if it would work just (moving the
if-return) or if that would be a mistake.

I'm attaching logs of stop_transition before and after
cpufreq_notify_transition() as they seem to be slightly different.

When the machine hangs I only see my message about changing freq to 1.8GHz,
there is no more output to screen before the machine hangs.

-- 
You are receiving this mail because:
You are the assignee for the bug.
