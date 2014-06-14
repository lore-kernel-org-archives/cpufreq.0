From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Sat, 14 Jun 2014 20:09:41 +0000
Message-ID: <bug-77201-12968-HlvnTY267j@https.bugzilla.kernel.org/>
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

--- Comment #77 from Mauro <registosites@hotmail.com> ---
Created attachment 139731
  --> https://bugzilla.kernel.org/attachment.cgi?id=139731&action=edit
From Viresh's tree, commit 3610fd8

This one hangs even when using stop_transition.

-- 
You are receiving this mail because:
You are the assignee for the bug.
