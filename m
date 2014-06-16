From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] Intel P-State: Constantly changing CPU frequencies on
 idle system.
Date: Mon, 16 Jun 2014 19:15:58 +0000
Message-ID: <bug-77771-12968-FQHkmZNYCD@https.bugzilla.kernel.org/>
References: <bug-77771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77771

--- Comment #5 from Michael Long <harn-solo@gmx.de> ---
Thanks for the hint about the turbostat utility. Without starting a desktop
environment I got similar stats, all frequencies are very close around the
lowest state. Logged into KDE showed different results. Eventually I found the
cause of those high clocks: 

A superkaramba desktop-widget. This widget basically does a grep on
/proc/cpuinfo and checks the load internally each second. Disabling this widget
gets the clock down. The same behavior can be reproduced just by running "for i
in {1..99}; do grep MHz /proc/cpuinfo; sleep 1; done".

Admittedley this might be a typical layer8-problem, however why is a simple
grep every second pounding the CPU so hard that it remains in higher clocks,
even in turbo mode? Especially when it didn't before the patch or just using
plain old acpi-cpufreq. If this is still just expected behavior sorry for the
unnecessary noise.

-- 
You are receiving this mail because:
You are the assignee for the bug.
