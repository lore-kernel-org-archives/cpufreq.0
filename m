From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59821] Dell M4600 CPU cores locked at 800MHz
Date: Mon, 17 Jun 2013 13:09:27 +0000 (UTC)
Message-ID: <20130617130927.CFB6211FB35@bugzilla.kernel.org>
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





--- Comment #4 from Lan Tianyu <tianyu.lan@intel.com>  2013-06-17 13:09:27 ---
(In reply to comment #3)
> (In reply to comment #2)
> > Could you try intel_pstate driver?
> Not sure how to do this - can you please provide steps?
Change kernel config file

set CONFIG_X86_INTEL_PSTATE
unset CONFIG_X86_ACPI_CPUFREQ

> > Please provide the output of acpidump. Thanks.
> root@deli:~ # acpidump
> Linux version not implemented yet
> Could not get ACPI tables, AE_SUPPORT
Which kernel version you are using?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
