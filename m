From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] Intel P-State: Constantly changing CPU frequencies on
 idle system.
Date: Tue, 17 Jun 2014 03:34:18 +0000
Message-ID: <bug-77771-12968-zmaJ5GLajf@https.bugzilla.kernel.org/>
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

--- Comment #8 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 140031
  --> https://bugzilla.kernel.org/attachment.cgi?id=140031&action=edit
two turbostats runs with grep running

Is your turbostat listing for your Haswell computer? I.E. the one where the
minimum CPU frequency is about 800 MHz?

I am unable to repeat your "for i in {1..99}; do grep MHz /proc/cpuinfo; sleep
1; done" results on my computer. I wish that I could. Attached are two
turbostat runs done while that command was running (the 2nd one is probably of
no use to anyone else). My minimum CPU frequency is about 1600 MHz.

-- 
You are receiving this mail because:
You are the assignee for the bug.
