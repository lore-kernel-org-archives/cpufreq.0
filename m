From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 11299] acpi_cpufreq doesn't load - Intel Q9300 CPU and shuttle
 SG33G5
Date: Thu, 6 Jan 2011 09:14:38 GMT
Message-ID: <201101060914.p069EcVa029175@demeter2.kernel.org>
References: <bug-11299-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-11299-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=11299


ykzhao <yakui.zhao@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@vger.kernel.org     |yakui.zhao@intel.com




--- Comment #8 from ykzhao <yakui.zhao@intel.com>  2011-01-06 09:14:37 ---
As this issue is caused by that no acpi object of _PSS/_PCT/_PPC is defined in
ACPI table, this bug will be rejected.

Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
