From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19262] CPU0 locked at slower speed, regardless of governor on
 IP35 Pro(Intel P35-ICH9R)
Date: Fri, 1 Oct 2010 15:12:12 GMT
Message-ID: <201010011512.o91FCCAH006374@demeter1.kernel.org>
References: <bug-19262-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19262-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19262


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |DOCUMENTED
            Summary|CPU0 locked at slower       |CPU0 locked at slower
                   |speed, regardless of        |speed, regardless of
                   |governor                    |governor on IP35 Pro(Intel
                   |                            |P35-ICH9R)




--- Comment #8 from Thomas Renninger <trenn@suse.de>  2010-10-01 15:12:07 ---
Best is you go with the mentioned boot param workaround.
There is something rather fishy with the implementation of the thermal trip
points. There are some iasl errors/warnings which point to thermal/temp:
DSDT.dsl  5685:         Store (GAHC (Arg0, Arg1), Local4)
Warning  1093 -                   ^ Called method may not always return a value

DSDT.dsl  5723:     Method (GAHC, 2, NotSerialized)
Warning  1088 -                ^ Not all control paths return a value (GAHC)

DSDT.dsl  5798:                         Store (GAHS (0x00), Local6)
Error    4061 -    Called method returns no value ^

The code there does not make much sense to me:
  - Passive cooling device only CPU0
  - Quite some storing of the same things:
GAHC():
        Store (0x01, DTAP)
        Stall (0x7F)
        Store (0x6C, DTAP)
        Stall (0x7F)
        Store (DTAP, Local5)
        Stall (0x7F)
        Store (DTAP, Local6)
        Stall (0x7F)
        Store (DTAP, Local7)
-> Ok, there is IO behind, still this cannot make much sense...

The temperature should also be 20C fixed, because of
    Method (GAHS, 1, NotSerialized)
    {
    }

_TMP():
    Store (GAHS (0x00), Local6)
    And (Local6, 0x01, Local6)
    If (LEqual (Local6, 0x01)) {..}
etc., etc....

The thermal ACPI stuff is really totally messed up on this system, best is to
use thermal.psv=-1 (afaik) to disable passive cooling.

-> Closing resolved documented, not much that can be done from OS side.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
