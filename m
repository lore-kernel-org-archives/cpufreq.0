From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7060] New: Thinkpad X60 stuck at low speed without battery
Date: Sat, 26 Aug 2006 16:57:07 -0700
Message-ID: <200608262357.k7QNv7NK018727@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7060

           Summary: Thinkpad X60 stuck at low speed without battery
    Kernel Version: 2.6.18-rc4
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: kernel.org@hzoli.com


Most recent kernel where this bug did not occur:
Distribution: Debian unstable
Hardware Environment: Thinkpad X60 Core Duo 1.83GHz
Software Environment: speedstep-centrino
Problem Description:
CPU speed cannot be increased when the battery is not present.

Steps to reproduce:
Using ondemand governor, frequency scaling works as expected when the battery is
in the system, both with A/C plugged in or unplugged.  When the bettery is
removed, if the CPU is busy, it keeps running at 1.83GHz,
/sys/devices/system/cpu/cpu[01]/cpufreq/scaling_max_freq shows 1833000.  When
the busy job quits, the CPU drops back to 1GHz and
/sys/devices/system/cpu/cpu[01]/cpufreq/scaling_max_freq also changes to 1000000
and can no longer be increased.  After reinserting the battery,
/sys/devices/system/cpu/cpu[01]/cpufreq/scaling_max_freq accepts larger
frequencies again.

When using the performance governor, the speed drops immediately uppon removing
the battery.  Thinkpad has the latest (1.06) BIOS.  This happens even is the
battery ACPI module is not loaded.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
