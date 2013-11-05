From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Tue, 05 Nov 2013 07:35:55 +0000
Message-ID: <bug-64261-12968-V4cN4BBmIz@https.bugzilla.kernel.org/>
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

--- Comment #8 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
This NOT how you pin a single P state. Make max == min with the config above
the driver is free to select any P state between 42-53%.

-- 
You are receiving this mail because:
You are the assignee for the bug.
