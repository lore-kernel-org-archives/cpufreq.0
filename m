From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71931] intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Wed, 12 Mar 2014 20:52:48 +0000
Message-ID: <bug-71931-12968-A6RERecWyT@https.bugzilla.kernel.org/>
References: <bug-71931-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-71931-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71931

--- Comment #3 from Patrik Lundquist <patrik.lundquist@gmail.com> ---
Patch tested on an Intel Xeon CPU E3-1240 V2 @ 3.40GHz (fam: 06, model: 3a,
stepping: 09) which is also an Ivy Bridge.

The intel_pstate driver loads fine and cpufreq_driver->get() is no longer
called when cpufreq adds the CPUs.

-- 
You are receiving this mail because:
You are the assignee for the bug.
