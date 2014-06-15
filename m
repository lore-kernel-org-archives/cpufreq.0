From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Sun, 15 Jun 2014 05:00:49 +0000
Message-ID: <bug-77201-12968-UStd7bn6mj@https.bugzilla.kernel.org/>
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

--- Comment #81 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Mauro from comment #77)
> Created attachment 139731 [details]
> From Viresh's tree, commit 3610fd8
> 
> This one hangs even when using stop_transition.

Oh, this went against my expectation. We crashed before changing freq :(

So this is what we have verified:
- transition_frequency_fidvid() gets called and after this only we do something
that crashes system.
- And that isn't a call to transition_fid_vid() as we are crashing before that
only.

So, you need to move around:

    /* HACK THIS */
    if (stop_transition)
        return 0;


in transition_frequency_fidvid() and find which is the last line before which
it is working. If that's a function call, go into that function and check
again.

Give us the last instruction that causes it.. 

As an sample of what you need to do, check my latest branch. But you need to do
some more changes manually too.

Lets crack it soon..

-- 
You are receiving this mail because:
You are the assignee for the bug.
