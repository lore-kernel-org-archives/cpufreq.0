From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64251] Intel Pstate driver minimum percent does not change with
 turbo off
Date: Mon, 04 Nov 2013 16:35:24 +0000
Message-ID: <bug-64251-12968-vIb0zOnn8U@https.bugzilla.kernel.org/>
References: <bug-64251-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64251-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64251

Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com

--- Comment #1 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
min_pct_perf is a user configurable floor value (not to go below) so it is
still valid in both cases.

-- 
You are receiving this mail because:
You are the assignee for the bug.
