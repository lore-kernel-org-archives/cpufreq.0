From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 48341] BUG: using smp_processor_id in preemptible powernow_k8
Date: Mon,  1 Apr 2013 05:57:52 +0000 (UTC)
Message-ID: <20130401055752.D2C3311FB92@bugzilla.kernel.org>
References: <bug-48341-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-48341-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=48341


Aaron Lu <aaron.lu@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aaron.lu@intel.com




--- Comment #5 from Aaron Lu <aaron.lu@intel.com>  2013-04-01 05:57:52 ---
(In reply to comment #3)
> Does not work on A6-4440M
> powernow-k8: this CPU is not supported anymore, using acpi-cpufreq instead.
> 
> 3.7.2-204.fc18.x86_64

What's the problem? Did you get a call backtrace or cpufreq does not work for
you? And if there is a problem, can you please test the current mainline as
comment #4 has suggested? Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
