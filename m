From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71931] intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Wed, 12 Mar 2014 11:18:54 +0000
Message-ID: <bug-71931-12968-3QWw78518B@https.bugzilla.kernel.org/>
References: <bug-71931-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-71931-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71931

--- Comment #2 from Rafael J. Wysocki <rjw@rjwysocki.net> ---
Created attachment 129151
  --> https://bugzilla.kernel.org/attachment.cgi?id=129151&action=edit
cpufreq: Skip current frequency initialization for ->setpolicy drivers

Attached again with a changelog and stuff.  Please test!

-- 
You are receiving this mail because:
You are the assignee for the bug.
