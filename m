From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Mon, 04 Nov 2013 16:54:15 +0000
Message-ID: <bug-64261-12968-T6voeItGFe@https.bugzilla.kernel.org/>
References: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

--- Comment #3 from Doug Smythies <dsmythies@telus.net> ---
Dirk: The script is the same one as was used and posted back in bug 59481.
However, now that that main issue is fixed, it is rather dense to use that
script in the same way, as it takes about 10 hours. In a few hours I will post
a modified version as there is no reason not to speed it up a lot now.

Yes, the requested Pstate is in response to a full load but both min and max
percent have been set to whatever is shown on the x-axis.

-- 
You are receiving this mail because:
You are the assignee for the bug.
