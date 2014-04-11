From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Fri, 11 Apr 2014 15:17:04 +0000
Message-ID: <bug-73781-12968-V3QDJoag2K@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

--- Comment #9 from KATO Hiroshi <katoh@mikage.ne.jp> ---
(In reply to Viresh Kumar from comment #8)
> Do git bisect please and let us know the offending commit.

I'll do as possible. 


By the way while glancing through dmesg, one important difference found.

3.13.8

[    0.087346] acpiphp: Slot [1-1] registered
[    0.090033] Found 1 acpi root devices
[    0.140788] Switched to clocksource acpi_pm
[    1.856854] ACPI: acpi_idle registered with cpuidle
[    2.101747] thinkpad_acpi: ThinkPad ACPI Extras v0.25

3.14
[    0.083948] acpiphp: Slot [1-1] registered
[    0.139115] Switched to clocksource acpi_pm
[    2.266132] thinkpad_acpi: ThinkPad ACPI Extras v0.25

3.14 kernel does not find an acpi root device.
I think this can be the point of this problem intead of cpufreq.

-- 
You are receiving this mail because:
You are the assignee for the bug.
