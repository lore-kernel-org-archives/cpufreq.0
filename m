From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10383] New: CPU FREQ policy value scaling_max_freq gets stuck at
	800MHz on core2duo
Date: Wed,  2 Apr 2008 10:41:34 -0700 (PDT)
Message-ID: <bug-10383-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10383

           Summary: CPU FREQ policy value scaling_max_freq gets stuck at
                    800MHz on core2duo
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: ralf.kaestner@web.de
                CC: ralf.kaestner@web.de


Latest working kernel version: none found
Earliest failing kernel version:
Distribution: tested with ubuntu hardy and gentoo including vanilla kernel
testing under gentoo
Hardware Environment: core2duo T7700 (2.4GHz), FSC Lifebook E8410
Software Environment: currently I run ubuntu 8.04

I would like to get some further input from kernel-dev how to proceed, please
let me know if the following issue is most likely (or even not) a linux kernel
issue and what steps I may take to solve it even if it may not be a kernel
problem. I am open to talk to my Laptop Vendor or linux-distribution-support if
one may give me some further details that would fingerpoint other parties than
the kernel itself. I decided to open a bug with kernel-dev directly since I
tested multiple distributions as well as vanilla-kernel without any changes to
the issue itself. So I don't think its distribution related.



Summary
---------------------
CPU: core2duo T7700 (2.4GHz) - see cpuinfo.txt
CPU FREQ policy value scaling_max_freq gets stuck at 800MHz.
Notebook: FSC Lifebook E8410 (for further details on the hardware refer to:
http://www.kuarepoti-dju.net/lifebook/)


Problem Description
---------------------
The CPU frequency scaling does not work as expected. The policy gets scaled
down to a max frequency of 800MHz and then it does never scale up anymore.
Short after boot, scaling seems to be still working (at least downwards).
/sys/devices/system/cpu/cpu1/cpufreq/stats/trans_table shows multiple
transitions, in my opinion too many (see sysfs.txt and look at the
trans_table). After init5 is reached and I am able to log in I can use
cpufreq-info immediately to check the situation and recognized that the policy
still allows switching between 800 MHz and 1.60 GHz, but then the
scaling_max_freq goes down within seconds to 800 MHz and gets stuck there, see
cpufreq-info_steppingdown_afterboot.txt


Further Details
---------------------
- tried any governor
- cpufreq-set -s / -u does not change anything
- no cpufreq daemon or anything like that is running that would modify the
scaling_max_freq, issue also exists in init-1
- not a temperature issue, CPU thermal sensor is at 27 degrees celsius
- inspected the acpi stuff and there seems to be a dsdt issue (refer
suspicious_acpi_errors.txt as well as dmesg.txt) - I dunno if this is related
- I reloaded bios defaults without any change and tested any possible bios
setting
- I compiled a custom ubuntu kernel with cpufreq-debug enabled, see
dmesg.cpufreqdebug.txt - it looks like the table with states P0-P5 is detected
correctly but then it transitons down, I have not too much experience with this
stuff, so I am not sure if this is done by the kernel or by the Bios


Looks like a Bios issue, why not reporting it to Laptop-Vendor
---------------------
- Windows works like a charm in regards to cpu frequency scaling, so there must
be at least a workaround
- If you want me to escalate to Laptop-Vendor instead, just let me know some
details, I would need "ammo"
- The Bios has different possible settings:

[0] + advanced
[1] + + CPU Features
[2] + + + Speedstep (R) Technology: Enabled / Disabled
[3] + + + + On Battery: Maximum Performance / Battery Optimized / Automatic
[4] + + + + On AC: Maximum Performance / Battery Optimized / Automatic
[5] + + Miscellaneous Configurations
[6] + + + Hardware Power Management: Enabled / Disabled

- setting [2] to disabled keeps the CPU at 2.4 GHz all time, acpi-cpufreq does
not even load anymore (this is my current workaround)
- any modifications (tried all combinations) in [3] [4] or [6] do not change
the behaviour
- I'm running the latest Bios, already applied different updates without any
change (the releasenotes do not state any issuesrelated to cpufreq - see:
http://support.fujitsu-siemens.de/Download/ShowDescription.asp?SoftwareGUID=189E5137-473F-483F-ACAD-C4F161DA9768&OSID=665F4A20-6E31-43C3-82C2-D98CE773007C&Status=True&Component=Flash%20Bios%20for%20LIFEBOOK%20E8410%20(Mainstream)
- Bios also has some "silent fan" setting which I tried in both options
(silent/normal) without any change

Distribution Details
---------------------
- tried Gentoo, latest devel kernel
- currently running ubuntu hardy latest beta
- latest vanilla kernel 2.6.24 shows the same behavior

References with same or similar signatures that I did read (without finding any
working solution btw.)
---------------------
http://ubuntuforums.org/showthread.php?t=700865
http://suseforums.net/index.php?showtopic=41562
http://bbs.archlinux.org/viewtopic.php?pid=318802
https://bugs.launchpad.net/ubuntu/+source/linux-source-2.6.20/+bug/88899
https://bugs.launchpad.net/ubuntu/+source/linux-source-2.6.22/+bug/132271
http://bugzilla.kernel.org/show_bug.cgi?id=9353
http://bugzilla.kernel.org/show_bug.cgi?id=8245
http://bugzilla.kernel.org/show_bug.cgi?id=8228

Reproduction
---------------------

One would require the same Notebook to reproduce, so this makes no sense by
now.
I'm hoping to get any feedback without the requirement to get this reproduced.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
