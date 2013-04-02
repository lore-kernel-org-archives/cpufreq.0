From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56071] Ondemand doesn't set correct low frequency
Date: Tue,  2 Apr 2013 07:53:35 +0000 (UTC)
Message-ID: <20130402075335.7A2B111FB5B@bugzilla.kernel.org>
References: <bug-56071-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-56071-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56071


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |trenn@suse.de
         Resolution|                            |DOCUMENTED




--- Comment #5 from Thomas Renninger <trenn@suse.de>  2013-04-02 07:53:34 ---
> limiti hardware: 1.30 GHz - 2.10 GHz
This should not be possible.
The interface to limit frequency is a number.
For example 0 means no limitation, 1 means the highest frequency is limited.

Ah wait, I think I know what happens.

This is read out from the HW (and applies to CPU specs):
    Boost States: 2
    Total States: 7
    Pstate-Pb0: 2600MHz (boost state)
    Pstate-Pb1: 2300MHz (boost state)
    Pstate-P0:  2100MHz
    Pstate-P1:  1800MHz
    Pstate-P2:  1500MHz
    Pstate-P3:  1300MHz
    Pstate-P4:  900MHz
This is done to be able to show available boost states and is normally hidden,
also the kernel does not know about this!

The kernel gets the supported CPU frequency table from the BIOS via ACPI.
And your BIOS vendor decided to hide the 900MHz.

That's ok, because on latest CPUs (and your one probably is a rather new
platform, because it supports boost states and therefore also suppports C-, CPU
sleep states) the kernel will enter deep sleeps states when idle which is even
more efficient than 900MHz CPU frequency.

I already close this one documented.
Everything works as designed.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
