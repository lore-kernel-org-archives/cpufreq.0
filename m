From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23412] Only the lowest CPU frequency available on laptop
 working from battery.
Date: Fri, 17 Dec 2010 15:25:49 GMT
Message-ID: <201012171525.oBHFPnkF008364@demeter2.kernel.org>
References: <bug-23412-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-23412-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23412





--- Comment #5 from Thomas Renninger <trenn@suse.de>  2010-12-17 15:25:40 ---
> If your ACPI tables are not busted (and you should see this by some obvious
> ACPI Error messages in dmesg
Not really true, if there is a logical bug, but syntax, etc. in ACPI code is
correct you may not see an error message.
But ACPI interpreting works pretty well these days and chances that the limit
is wanted by the OEM for whatever reasons are high.

You can override the BIOS limit by the boot param:
processor.ignore_ppc=1
But instead of using this all day, you should better find out why the BIOS
vendor/OEM limits your frequency, there is certainly a reason for it.

Above helps (and this is hopefully what the bug is about) only if you see the
limit here:
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit

If your frequency is restricted/limited due to other reasons, please open a new
bug and state it in the description to avoid confusion and mix ups of several
problems in one bug.

Hmm, there were quite some people in CC of this bug. I'd be interested how much
get fixed by BIOS settings, etc.. I keep the bug open for a while, even I am
pretty sure most/all people seeing BIOS frequency limits is *not* due to a
kernel bug.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
