From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Wed, 06 Nov 2013 06:04:54 +0000
Message-ID: <bug-64261-12968-ivJp7Xof8a@https.bugzilla.kernel.org/>
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

--- Comment #15 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 113621
  --> https://bugzilla.kernel.org/attachment.cgi?id=113621&action=edit
The rounding code.

The changes to the code. Probably some incorrect format.

-- 
You are receiving this mail because:
You are the assignee for the bug.
