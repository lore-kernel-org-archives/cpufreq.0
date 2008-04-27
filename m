From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10564] Randomly sets max freq equal to min freq
Date: Sun, 27 Apr 2008 11:35:10 -0700 (PDT)
Message-ID: <20080427183510.03B8610805F@picon.linux-foundation.org>
References: <bug-10564-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10564-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10564





------- Comment #4 from andrew@andrewyates.net  2008-04-27 11:35 -------
I should point out that the summary ("Randomly sets max freq equal to min
freq") is not entirely correct in my case.
My min freq is 800mhz and max is 2.5ghz. cpufreq refuses to set any speed
higher than 1.2ghz, which is one step up from my minimum. Any attempts to set
the CPU to a frequency higher than 1.2ghz fail, but I can change between 1.2ghz
and 800mhz.

$ grep "" /sys/devices/system/cpu/cpu0/cpufreq/*
/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus:0 1
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:800000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:2501000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:800000
/sys/devices/system/cpu/cpu0/cpufreq/phc_controls:77:41 76:34 10:30 8:27 6:23
136:19 
/sys/devices/system/cpu/cpu0/cpufreq/phc_default_controls:77:41 76:34 10:30
8:27 6:23 136:19 
/sys/devices/system/cpu/cpu0/cpufreq/phc_default_vids:41 34 30 27 23 19 
/sys/devices/system/cpu/cpu0/cpufreq/phc_fids:77 76 10 8 6 136 
/sys/devices/system/cpu/cpu0/cpufreq/phc_version:0.3.0
/sys/devices/system/cpu/cpu0/cpufreq/phc_vids:41 34 30 27 23 19 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:2501000
2500000 2000000 1600000 1200000 800000 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:ondemand
performance 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:ondemand
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:800000

$ cpufreq-info
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0 1
  hardware limits: 800 MHz - 2.50 GHz
  available frequency steps: 2.50 GHz, 2.50 GHz, 2.00 GHz, 1.60 GHz, 1.20 GHz,
800 MHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 800 MHz and 1.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
