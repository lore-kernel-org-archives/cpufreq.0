From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64271] Intel Pstate driver - "kick" code is not needed
Date: Mon, 04 Nov 2013 16:42:26 +0000
Message-ID: <bug-64271-12968-bYZN77pbVB@https.bugzilla.kernel.org/>
References: <bug-64271-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64271-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64271

--- Comment #3 from Doug Smythies <dsmythies@telus.net> ---
Dirk: I do not know how to submit a patch. Which doesn't mean I shouldn't learn
how, but I have also been cheating when I make my "no kick" test code by just
deleting the 3 lines that decide to and do the kick. The real solution would be
a bit more. I'll do it of you want (it would be a good way to get rid of me for
awhile (just joking)).

-- 
You are receiving this mail because:
You are the assignee for the bug.
