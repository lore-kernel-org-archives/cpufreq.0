From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56071] Ondemand doesn't set correct low frequency
Date: Tue,  2 Apr 2013 10:08:08 +0000 (UTC)
Message-ID: <20130402100808.4D52811FB5B@bugzilla.kernel.org>
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





--- Comment #7 from Thomas Renninger <trenn@suse.de>  2013-04-02 10:08:08 ---
> Is this also related to cpufreq ?
This is certainly ACPI related.
It's hard to guess, but your BIOS seem to request to limit cpufreq or
throttling.
Cpufreq limitation you should see in this line:
limiti hardware: 1.30 GHz - 2.10 GHz
from cpupower frequency-info output.
This should be 1.30 GHz - 1.30 GHz
or similar after you plugged in AC.

Best you increase ACPI debug output before plugging AC:
echo 0x20f >/sys/module/acpi/parameters/debug_level
echo 0xffffffff >/sys/module/acpi/parameters/debug_layer

then do the plugging, wait a second or two and reduce debugging again.
echo 0 >/sys/module/acpi/parameters/debug_level
echo 0 >/sys/module/acpi/parameters/debug_layer

This could produce quite some kernel output, so you may want to boot with
log_buf_len=16M
boot parameter.
Then attach dmesg and acpidump of your machine to the bug you created for the
AC issue (mixing up bugs is confusing if you add other people later).

Before you start with all this, make sure you have the latest BIOS installed.
ACPI bugs can be tricky, best follow instructions of Lan Tianyu.
Feel free to add me to CC.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
