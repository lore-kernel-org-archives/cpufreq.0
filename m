From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Thu, 12 Sep 2013 14:07:58 +0000
Message-ID: <bug-60839-12968-nnEMRSoZQD@https.bugzilla.kernel.org/>
References: <bug-60839-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60839-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60839

--- Comment #7 from Lan Tianyu <tianyu.lan@intel.com> ---
Created attachment 108201
  --> https://bugzilla.kernel.org/attachment.cgi?id=108201&action=edit
cpufreq_sys.patch

Please apply this patch with previous one. This patch will add two new
attributes user_min/max_freq which show user space configuration. Change your
scripts and show their values.

-- 
You are receiving this mail because:
You are the assignee for the bug.
