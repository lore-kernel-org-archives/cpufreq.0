From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Thu, 19 Dec 2013 01:59:47 +0000
Message-ID: <bug-65501-12968-fVMOQlZbUm@https.bugzilla.kernel.org/>
References: <bug-65501-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65501-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65501

--- Comment #14 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to sworddragon2 from comment #13)
> This is the point that disturbs me. We are setting a fixed minimum limit of
> 11 while there is no logical reason to do this.

This must be based on the reasoning that we don't have to go to max freq for
loads as low as 10%. That sounds reasonable too, atleast to me. If you want
such system where you want to go to max freq as soon as there is any load then
better use performance governor. Otherwise what's currently in there looks good
to me. I would actually say even 10% is a very low value of min up_threshold.
It could have been more :)

Don't know what Rafael have to say on this.

-- 
You are receiving this mail because:
You are the assignee for the bug.
