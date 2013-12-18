From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 15:29:00 +0000
Message-ID: <bug-65501-12968-MU8xEDrAfi@https.bugzilla.kernel.org/>
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

--- Comment #13 from sworddragon2@aol.com ---
> There is no floating point division here :)

Than lets repeat this text with MIN_FREQUENCY_UP_THRESHOLD as 2. But...


> And even if we do that, we don't really need to take care of loads lesser than > 1%, that's too small..

... we are moving now into the correct direction :)
This is the point that disturbs me. We are setting a fixed minimum limit of 11
while there is no logical reason to do this. Lets make the hypothetical
assumption that MIN_FREQUENCY_UP_THRESHOLD could be set to 1:

- Current systems wouldn't be affected as they have already a value >= 11.
- New systems with a default kernel would keep still the default value that is
>= 11.

So there is no disadvantage for these systems. But users now have the advantage
that they can make there own decision how low they want to go.

-- 
You are receiving this mail because:
You are the assignee for the bug.
