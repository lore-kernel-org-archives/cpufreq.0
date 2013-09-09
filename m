From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 61071] powernow-k8 is not autoloaded
Date: Mon, 09 Sep 2013 21:53:48 +0000
Message-ID: <bug-61071-12968-r8g0q0gxwF@https.bugzilla.kernel.org/>
References: <bug-61071-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-61071-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=61071

--- Comment #2 from Rafael J. Wysocki <rjw@rjwysocki.net> ---
Of course, you can also modify the rule in question yourself in the same way as
in the commit above or add a new rule:

ENV{MODALIAS}=="?*", RUN{builtin}="kmod load $env{MODALIAS}"

to your local udev rules.

-- 
You are receiving this mail because:
You are the assignee for the bug.
