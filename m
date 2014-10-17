From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 86461] intel_pstate does not obey min/max frequencies set by
 user
Date: Fri, 17 Oct 2014 16:51:31 +0000
Message-ID: <bug-86461-12968-waqvGKbFeK@https.bugzilla.kernel.org/>
References: <bug-86461-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-86461-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86461

--- Comment #3 from Alexander E. Patrakov <patrakov@gmail.com> ---
Additional note: intel_pstate allows to set max_perf_pct lower than
min_perf_pct. This should not be allowed.

-- 
You are receiving this mail because:
You are the assignee for the bug.
