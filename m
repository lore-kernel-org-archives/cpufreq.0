From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 09 Jun 2014 22:01:21 +0000
Message-ID: <bug-77201-12968-MlcMJ0rGwO@https.bugzilla.kernel.org/>
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

--- Comment #13 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
Created attachment 138661
  --> https://bugzilla.kernel.org/attachment.cgi?id=138661&action=edit
Revert-of-commit-c3274763bfc.patch

Patch to revert commit c3274763bfc (cpufreq: powernow-k8: Initialize per-cpu
data-structures properly).

-- 
You are receiving this mail because:
You are the assignee for the bug.
