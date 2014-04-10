From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Thu, 10 Apr 2014 14:52:53 +0000
Message-ID: <bug-73781-12968-tIy6siOqQ7@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

Viresh Kumar <viresh.kumar@linaro.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |viresh.kumar@linaro.org

--- Comment #1 from Viresh Kumar <viresh.kumar@linaro.org> ---
Try reverting these patches on top of 3.14 in the order mentioned:

 commit eb8c68ef558e6cba241e7ada54f6b3427cb2bf68
Author: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date:   Mon Jan 27 22:50:35 2014 -0500

    acpi-cpufreq: De-register CPU notifier and free struct msr on error.

commit cfc9c8ed03e4d908f2388af8815f44c87b503aaf
Author: Lukasz Majewski <l.majewski@samsung.com>
Date:   Fri Dec 20 15:24:50 2013 +0100

    acpi-cpufreq: Adjust the code to use the common boost attribute


commit 6f19efc0a1ca08bc61841b971d8b85ab505d95c8
Author: Lukasz Majewski <l.majewski@samsung.com>
Date:   Fri Dec 20 15:24:49 2013 +0100

    cpufreq: Add boost frequency support in core



And let me know if it fixes things for you.

-- 
You are receiving this mail because:
You are the assignee for the bug.
