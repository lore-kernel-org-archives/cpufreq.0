From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56101] Intel Core2 Duo E6600 reports max-frequency of just 900
 MHz instead of 2.4 GHz
Date: Fri,  5 Apr 2013 14:48:44 +0000 (UTC)
Message-ID: <20130405144844.BDBBA11F94D@bugzilla.kernel.org>
References: <bug-56101-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-56101-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56101





--- Comment #13 from Thomas Renninger <trenn@suse.de>  2013-04-05 14:48:44 ---
In SSDT2 the P-states show up your BIOS tells the OS which are supported
through _PSS ACPI function:
       Name (_PSS, Package (0x02)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000384,
                0x00006978,
                0x0000000A,
                0x0000000A,
                0x0000092A,
                0x0000092A
            },

            Package (0x06)
            {
                0x00000258,
                0x000032C8,
                0x0000000A,
                0x0000000A,
                0x0000061B,
                0x0000061B
            }
        })

In ACPI spec chapter 8.4.4.2 is stated this info means:
CoreFreq, // DWordConst
Power, // DWordConst
TransitionLatency, // DWordConst
BusMasterLatency, // DWordConst
Control, // DWordConst
Status // DWordConst

Taking the first one (CoreFreq):
0x384 -> 900
0x258 -> 600
the kernel is doing everything correct (and I would have been surprised if not,
this stuff works for years).
This clearly is a BIOS bug not much can be done about (beside searching for a
related BIOS option or BIOS upgrade).

> cpupower monitor still exits after one second.
This is normal behavior, it only can monitor frequency over time, default 1
second.
C0 means core is actively processing something
Cx means the core is idle (depending which C-states are supported in deeper
                           ones)
Later CPUs cpupower monitor can detect in which C-states the CPU really was
(even the kernel thinks it triggered other states).

If properly packaged:
cpupower <subcommand> --help
should invoke the correct manpage:
man cpupower-<subcommand>(8)
in this case.
You could pass -i seconds parameter to let cpupower monitor scan the frequency
for longer.

You can do:
cat /dev/zero >/dev/null &
to utilize one core.
then try again:
cpupower monitor
if the frequency is ramped up, you are fine and the only defect is wrongly
shown CPU frequency info (through the BIOS and therefore through the kernel and
therefore with userspace tools as well).

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
