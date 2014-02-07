From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 69821] setting CONFIG_HZ_PERIODIC locks cpu at the lowest
 frequency using ONDEMAND
Date: Fri, 07 Feb 2014 02:40:00 +0000
Message-ID: <bug-69821-12968-wyGVz74U95@https.bugzilla.kernel.org/>
References: <bug-69821-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-69821-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=69821

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |tianyu.lan@intel.com
          Component|Power-Processor             |cpufreq
           Assignee|acpi_power-processor@kernel |cpufreq@vger.kernel.org
                   |-bugs.osdl.org              |
            Product|ACPI                        |Power Management

-- 
You are receiving this mail because:
You are the assignee for the bug.
