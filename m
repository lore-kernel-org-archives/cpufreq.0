From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9708] New: powersave governor does not work when power cable
	gets plugged in
Date: Mon,  7 Jan 2008 13:11:39 -0800 (PST)
Message-ID: <bug-9708-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9708

           Summary: powersave governor does not work when power cable gets
                    plugged in
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24-rc6-default
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: deller@gmx.de


Hardware Environment:
HP NC6000 Laptop (Intel(R) Pentium(R) M processor 1.60GHz)

Problem Description:
cpufreq powermanagemnt does work pretty ok.
Nevertheless, I face a problem when I suddenly plug in the power cable.

Machine has no load, nevertheless I then can see (even minutes after I plugged
in the power cable):

[root@halden cpufreq]# uptime &&  grep ""
/sys/devices/system/cpu/cpu0/cpufreq/*

 21:57:23 up  1:04,  3 users,  load average: 0.09, 0.08, 0.09

/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus:0
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1600000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:1600000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:600000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:1600000
1400000 1200000 1000000 800000 600000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:conservative
ondemand powersave userspace performance
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1600000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:1600000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:600000

As you can see, the CPU can scale between 600 MHz and 1600 MHz.
The governour is "powersave", but scaling_cur_freq constantly stays at 1600
MHz. In principle the powersave governour should now scale it down to 600 MHz,
but it does not.

Interestingly, when I then switch the scaling governor to "performance" (or any
other value than powersave) and then directly back to powersave, it then
suddenly does work as designed and scales the CPU down to 600MHz. It seems the
short change in the governor triggers start of the scale-down.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
