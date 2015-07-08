From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 100771] When activating ignore_nice_load with governor ondemand
 performance drops for normal processes.
Date: Wed, 08 Jul 2015 05:58:31 +0000
Message-ID: <bug-100771-12968-qIoZhxSGip@https.bugzilla.kernel.org/>
References: <bug-100771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-100771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=100771

Aaron Lu <aaron.lu@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |aaron.lu@intel.com
          Component|Power-Processor             |cpufreq
           Assignee|acpi_power-processor@kernel |cpufreq@vger.kernel.org
                   |-bugs.osdl.org              |
            Product|ACPI                        |Power Management

--- Comment #2 from Aaron Lu <aaron.lu@intel.com> ---
Looks like a cpufreq issue to me, move there.

-- 
You are receiving this mail because:
You are the assignee for the bug.
