From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42648] Frequencies higher than 1.5 GHz are not available for
 AMD A8-3500M
Date: Tue, 6 Mar 2012 22:12:50 GMT
Message-ID: <201203062212.q26MCo6b027313@bugzilla.kernel.org>
References: <bug-42648-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-42648-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42648





--- Comment #7 from Thomas Renninger <trenn@suse.de>  2012-03-06 22:12:50 ---
cpupower monitor could need a -t (top) param, but you can use:
watch -n1 cpupower monitor to constantly track sleep states, frequency, boost,
etc. behavior.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
