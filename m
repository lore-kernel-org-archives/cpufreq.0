From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] Cores stuck at max frequency after resume from suspend
 (Haswell)
Date: Mon, 25 Nov 2013 20:22:19 +0000
Message-ID: <bug-65301-12968-2RZ3XCQmib@https.bugzilla.kernel.org/>
References: <bug-65301-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65301-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65301

--- Comment #6 from tomasi <tomas.ivanek@gmail.com> ---
Hi, 
Whole CPU frequency managment is broken somehow.
i5-4200U CPU @ 1.60GHz CPU should support 800 Mhz, But i see it's running at
least on 1.6 Ghz. (After suspend/resume It's running in Turbo mode)

bio@dell-xps:/sys/devices/system/cpu/intel_pstate$ cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 0.97 ms.
  hardware limits: 800 MHz - 2.60 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 800 MHz and 2.60 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.

-- 
You are receiving this mail because:
You are the assignee for the bug.
