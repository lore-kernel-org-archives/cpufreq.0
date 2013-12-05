From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 66581] intel_pstate/powersave - cpu frequency remains at high
 level (Turbo) after suspend/resume
Date: Thu, 05 Dec 2013 19:45:20 +0000
Message-ID: <bug-66581-12968-aDFXNiQNNl@https.bugzilla.kernel.org/>
References: <bug-66581-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-66581-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=66581

--- Comment #7 from Lado Kumsiashvili <herrlado@gmail.com> ---
OK, attached. Another strange thing. I think I have never noticed before,
because I have this laptop since a couple of days. After I have booted cpufreq
showed 2.80ghz at all cores without any last. THen I have executed

max_perf_pct showed 100

and min_perf_pct showed 21

I has never gone below 2.80Ghz


After I have executed

echo 21 > /sys/devices/system/cpu/intel_pstate/max_perf_pct 

it went down to 800Mhz as expected in cpupower tool view

genlap ~ # cpupower -c 0-4 frequency-info | grep current

  current policy: frequency should be within 800 MHz and 3.80 GHz.
  current CPU frequency is 800 MHz (asserted by call to hardware).
  current policy: frequency should be within 800 MHz and 3.80 GHz.
  current CPU frequency is 800 MHz (asserted by call to hardware).
  current policy: frequency should be within 800 MHz and 3.80 GHz.
  current CPU frequency is 800 MHz (asserted by call to hardware).
  current policy: frequency should be within 800 MHz and 3.80 GHz.
  current CPU frequency is 800 MHz (asserted by call to hardware).
  current policy: frequency should be within 800 MHz and 3.80 GHz.
  current CPU frequency is 800 MHz (asserted by call to hardware).

  current CPU frequency is 800 MHz (asserted by call to hardware).

When I put the value 100 in the max_perf_pct it goes now between 2.80 and
somewhere 3.30Ghz and changes all the time as I execute cpupower. 


But, before I have touched this max_perf_pct  after the boot it was constantly
on 2.80.

With regards,

Lado

-- 
You are receiving this mail because:
You are the assignee for the bug.
