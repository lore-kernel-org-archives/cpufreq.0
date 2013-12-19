From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Thu, 19 Dec 2013 10:10:45 +0000
Message-ID: <bug-65501-12968-SaxOK5ksD1@https.bugzilla.kernel.org/>
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

--- Comment #15 from sworddragon2@aol.com ---
> This must be based on the reasoning that we don't have to go to max freq for loads as low as 10%.

Except the process splits up in several "small" threads. For example on Flash I
get only half of the performance with the default value. Either I could use the
performance governor to solve this issue (and loose the ability to save power)
or lower MIN_FREQUENCY_UP_THRESHOLD.

But I would still prefer to let the user decide what he wants to use (there
could always pop up new cases for users that want a lower value). Normally
having such a freedom was the choice I have abandoned Windows over 3 years ago
:)

-- 
You are receiving this mail because:
You are the assignee for the bug.
