From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56101] Intel Core2 Duo E6600 reports max-frequency of just 900
 MHz instead of 2.4 GHz
Date: Fri,  5 Apr 2013 13:45:16 +0000 (UTC)
Message-ID: <20130405134516.57F8711F981@bugzilla.kernel.org>
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





--- Comment #8 from Thomas Renninger <trenn@suse.de>  2013-04-05 13:45:16 ---
I already wrote something, but forgot to hit the apply button:

Your acpidump tool does not copy dynamically loaded SSDT tables yet.
Either make sure to take the latest one (from acpica sources afaik) or just
attach these files: /sys/firmware/acpi/tables/dynamic

-> The cpufreq info passed from BIOS to OS is in there.

You can use
cpupower monitor
tool (sources located in the kernel, depending on the distribution it might
have another name, which should get addressed by distro maintainers, there
should be a separate cpupower package on Linux distros).
This will show you the exact frequency your cores run on over a certain amount
of time (or workload if a command is appended) including boosting.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
