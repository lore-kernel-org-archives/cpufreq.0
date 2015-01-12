From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 91141] acpi-cpufreq cannot be loaded.
Date: Mon, 12 Jan 2015 04:38:04 +0000
Message-ID: <bug-91141-12968-g0lWWdM2ao@https.bugzilla.kernel.org/>
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
         Regression|Yes                         |No

--- Comment #2 from Zhang Rui <rui.zhang@intel.com> ---
clear the "regression" flag as acpi-cpufreq driver never runs on this platform
before.

-- 
You are receiving this mail because:
You are the assignee for the bug.
