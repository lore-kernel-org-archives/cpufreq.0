From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 91141] acpi-cpufreq cannot be loaded.
Date: Tue, 13 Jan 2015 00:45:52 +0000
Message-ID: <bug-91141-12968-mzEa1cLlhN@https.bugzilla.kernel.org/>
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

Zhang Rui <rui.zhang@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |CLOSED
         Resolution|---                         |DOCUMENTED

--- Comment #8 from Zhang Rui <rui.zhang@intel.com> ---
It is better to zip them all to 1 file and upload.

I checked your acpi table, and there is no _PSS control method, on which
acpi_cpufreq driver relies.
The root cause could be that
1. there is no hardware support
or
2. you did not enable the BIOS features for cpu frequency control support.
Please check if there is any BIOS options related.
3. your current version BIOS does not support this feature, and you need to
upgrade the BIOS.

But anyway, I will close this bug report as it is not a Linux kernel issue.
Please feel free to re-open it if you still have some questions.

-- 
You are receiving this mail because:
You are the assignee for the bug.
