From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59821] Dell M4600 CPU cores locked at 800MHz
Date: Mon, 17 Jun 2013 12:44:38 +0000 (UTC)
Message-ID: <20130617124438.4646911FB56@bugzilla.kernel.org>
References: <bug-59821-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59821-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59821


Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |tianyu.lan@intel.com
          Component|Config-Processors           |cpufreq
         AssignedTo|acpi_config-processors@kern |cpufreq@vger.kernel.org
                   |el-bugs.osdl.org            |
            Product|ACPI                        |Power Management




--- Comment #2 from Lan Tianyu <tianyu.lan@intel.com>  2013-06-17 12:44:37 ---
This should be a cpufreq bug and reassign to the correct category. Could you
try intel_pstate driver?

Please provide the output of acpidump. Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
