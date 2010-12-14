From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 24562] k8-powernow does not see all cores
Date: Tue, 14 Dec 2010 00:22:50 GMT
Message-ID: <201012140022.oBE0MoxD013939@demeter2.kernel.org>
References: <bug-24562-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-24562-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=24562


Zhang Rui <rui.zhang@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Config-Processors           |cpufreq
         AssignedTo|acpi_config-processors@kern |cpufreq@vger.kernel.org
                   |el-bugs.osdl.org            |
            Product|ACPI                        |Power Management




--- Comment #10 from Zhang Rui <rui.zhang@intel.com>  2010-12-14 00:22:49 ---
oh, sorry, I rechecked the code and it seems that the first "0,1,2,3" is not
redundant information.
Reassign this bug to cpufreq driver experts.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
