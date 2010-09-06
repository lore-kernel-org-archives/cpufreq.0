From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Mon, 6 Sep 2010 10:29:52 GMT
Message-ID: <201009061029.o86ATqZt007749@demeter1.kernel.org>
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





--- Comment #15 from Thomas Renninger <trenn@suse.de>  2010-09-06 10:29:51 ---
About comment #13:
There has been a *correct* patch to read out bios frequency limitations at
cpufreq init time recently (before we only reacted on ACPI processor events to
take the limitations into account). That is probably why you see this. Please
at least comment on the other bug, as this one is totally unrelated.
processor.ignore_ppc=1 boot param will be your workaround. If you like to hunt
down the limitation initiated by your BIOS (there might be a reason for the
limitation (only happens on battery or on AC or at specific temp or with a
specific AC adapter, ...)), please look up:
https://bugzilla.kernel.org/show_bug.cgi?id=16362

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
