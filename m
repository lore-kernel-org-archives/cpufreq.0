From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 91141] acpi-cpufreq cannot be loaded.
Date: Mon, 02 Mar 2015 03:09:34 +0000
Message-ID: <bug-91141-12968-8htYi084r5@https.bugzilla.kernel.org/>
References: <bug-91141-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-91141-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=91141

--- Comment #11 from Zhang Rui <rui.zhang@intel.com> ---
(In reply to Brett Johnson from comment #9)
> The BIOS supports it and all is enabled.

I mean there is no BIOS support for acpi-cpufreq driver, i,e, the _PSS control
method.

> As I stated above, multiple P4's
> worked under the 2.6 kernels. Under p4-clockmod I can manually change the
> processor frequencies as seen by cpuinfo_cur_freq. Manual changes don't
> help, though. Since p4-clockmod isn't used anymore, does acpi-cpufreq
> support P4's? Or is there another kernel module supposed to do this?

Unlike bug #73781, which has _PSS method in BIOS and the problem can be fixed
in kernel, for your machine, you can only use p4-clockmod instead of
acpi-cpufreq driver, even in 3.x kernels.

-- 
You are receiving this mail because:
You are the assignee for the bug.
