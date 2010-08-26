From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Thu, 26 Aug 2010 11:14:43 GMT
Message-ID: <201008261114.o7QBEhGT024642@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |cpufreq@vger.kernel.org,
                   |                            |trenn@suse.de
         AssignedTo|cpufreq@vger.kernel.org     |trenn@suse.de




--- Comment #2 from Thomas Renninger <trenn@suse.de>  2010-08-26 11:14:39 ---
> Here's some sysfs info
But this is with the working performance governor, better would be if you show
sysfs files in broken case.

Could it be that you did the performance vs ondemand governor check at
different times or did you simply echo performance >scaling_governor and things
started to work?
Background: The frequency might get limited on purpose for whatever reason. If
you e.g. rebooted in between, the temperature (or whatever limitation reason),
might be different and this is not a governor, but a general freq limiting
issue.

Best you check whether you run the latest BIOS and update if not.
If the problem persists, go through the BIOS options and search for SpeedStep,
CPU frequency, P-state or power management related options. Possibly you find a
knob which fixes the issue.

If you still see this, please use a recent kernel (2.6.34 or above) and provide
the output of:
for x in /sys/devices/system/cpu/cpu0/cpufreq/*;do echo $x;cat $x;done
If you see the issue.
Also try whether it really seem to be an ondemand issue by switching governors
manually several times:
echo performance >scaling_governor
echo ondemand >scaling_governor
and make sure this really only happens with ondemand.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
You are the assignee for the bug.
