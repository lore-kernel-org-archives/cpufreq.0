From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] Intel P-State: Constantly changing CPU frequencies on
 idle system.
Date: Fri, 13 Jun 2014 09:09:00 +0000
Message-ID: <bug-77771-12968-dauk7hWAEx@https.bugzilla.kernel.org/>
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

--- Comment #3 from Michael Long <harn-solo@gmx.de> ---
To comment #1:

I made my tests on desktop systems with a loaded KDE instance. Aside from "the
usual" services running like in a typical Fedora 20 default installation. There
are no other process active producing considerable load over a longer time.

I just started up, logged into KDE and let is stay for a while (at least 5
mins) and then looked at the frequencies. No browser started, no games loaded,
no update-processes running etc, just an empty desktop.

There is nothing up and running on those systems that justifies having one or
more cores up even deep in some turbo mode when getting the frequency stats.

-- 
You are receiving this mail because:
You are the assignee for the bug.
