From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Thu, 10 Mar 2011 11:35:36 GMT
Message-ID: <201103101135.p2ABZa01029892@demeter2.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #18 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-10 11:35:35 ---
(In reply to comment #16)

> That your system only shows C1 is strange.
> The message you showed:
> > Marking TSC unstable due to TSC halts in idle
> should only show up if C2 or deeper states (or C1E, but this should not exist
> on older machines?) are supported.
> Compare with drivers/acpi/processor_idle.c:
>                 if (state > ACPI_STATE_C1)
>                         mark_tsc_unstable("TSC halts in idle");
> Could it be that you tried with processor.max_cstate=1?

Yes yes I did use this command line parameter. So the fact that my system only
shows C1 is normal in this case I suppose. I will try to boot the system
without the processor.max_cstate=1 parameter.

> Also a wiki page about this processor tells that the new "mobile" (only
> AthlonXP "M") feature is to support Powernow!. So it really might have to do
> with tsc+powernow!.

Powernow does not work on my system. 

----------------------------------------------------------------------------

[  121.157837] Fast TSC calibration using PIT
[  121.170872] powernow: Trying ACPI perflib
[  121.170930] powernow: ACPI perflib can not be used on this platform
[  121.170973] powernow: ACPI and legacy methods failed

-----------------------------------------------------------------------------

I bought the XP-M on Ebay. My mainboard (a FX41 from Shuttle) was not supposed
to run mobile Athlon so I think the BIOS does not support the XP-M. I will try
patches from 

http://www.yggdrasl.demon.co.uk/code/

but I need to guess the correct parameters to manually configure Powernow on my
Athlon.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
