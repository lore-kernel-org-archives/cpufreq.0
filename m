From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 69821] setting CONFIG_HZ_PERIODIC locks cpu at the lowest
 frequency using ONDEMAND
Date: Wed, 16 Dec 2015 02:15:17 +0000
Message-ID: <bug-69821-12968-wxyUeuH3AL@https.bugzilla.kernel.org/>
References: <bug-69821-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-69821-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=69821

--- Comment #6 from Chen Yu <yu.c.chen@intel.com> ---
Created attachment 197491
  --> https://bugzilla.kernel.org/attachment.cgi?id=197491&action=edit
fix idle calc in cpufreq governor  load

-- 
You are receiving this mail because:
You are the assignee for the bug.
