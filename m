From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 14:34:33 +0000
Message-ID: <bug-77201-12968-5cMgxNLxG7@https.bugzilla.kernel.org/>
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

--- Comment #62 from Mauro <registosites@hotmail.com> ---
Created attachment 139471
  --> https://bugzilla.kernel.org/attachment.cgi?id=139471&action=edit
Frequency transition hang

This one is what happens when I try to do the second frequency transition, that
is, after:

boot -> 800M -> cpu offline/online -> 2.2G ->(1) 1.8G

(1) machine hangs here.

-- 
You are receiving this mail because:
You are the assignee for the bug.
