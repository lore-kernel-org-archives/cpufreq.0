From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58001] "ondemand" CPU governor never raises frequency (Dell XPS
 12)
Date: Wed, 24 Sep 2014 22:55:46 +0000
Message-ID: <bug-58001-12968-Cdkay74H13@https.bugzilla.kernel.org/>
References: <bug-58001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58001

--- Comment #18 from Raymond Auge <rotty3000@gmail.com> ---
currently I have 


~]$ cpufreq-info | grep driver
  driver: acpi-cpufreq
  driver: acpi-cpufreq
  driver: acpi-cpufreq
  driver: acpi-cpufreq

How now to enabled the intel_pstate driver.

I've tried from the grub boot menu to add

set intel_pstate=enable

with no luck. (of course this might be completely wrong way to do it...)

-- 
You are receiving this mail because:
You are the assignee for the bug.
