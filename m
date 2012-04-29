From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 43179] New: VIA Nano hangs on some CPU scaling governors and at
 some freqs
Date: Sun, 29 Apr 2012 20:45:41 GMT
Message-ID: <bug-43179-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43179

               URL: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/8
                    05205
           Summary: VIA Nano hangs on some CPU scaling governors and at
                    some freqs
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.4.0-999-generic
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: lelandyue@gmail.com
        Regression: No


OVERVIEW: 
- Ubuntu 10.04 hangs when the CPU scaling governor is set to "ondemand",
"conservative", or "userspace" at 1000 MHz and 900 MHz. Other freqs don't hang.

NOTES:
- This bug also occurs on Ubuntu 11.10.
- The original bug was filed at bugs.launchpad.net:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/805205 . The original
details were written for Ubuntu 10.04. The same details apply to 11.10.
- I downloaded and tested the mainline kernel
"linux-image-3.4.0-999-generic_3.4.0-999.201204260409_amd64.deb" on Ubuntu
11.10. The hang still occurs.

HARDWARE:
Motherboard: Jetway NF77-N1G6-LF
CPU: VIA Nano processor L2200@1600MHz
Ubuntu installer: Ubuntu 10.04.1 64-bit alternate

TEST SETUP (disabling the ondemand script):
- In Ubuntu, there is an "ondemand" script that gets executed each time the OS
boots. This will cause the entire system hang and mess up the test setup. So we
need to disable the script before running a test.
- Install Ubuntu 10.04.1 64-bit from an alternate CD or an alternate USB stick.
- As soon as you reach the login screen, quickly press CTRL+ALT+F6 to go to a
terminal, then quickly type "sudo chmod -x /etc/init.d/ondemand". Then quickly
type "sudo reboot" to reboot the computer. This will disable the ondemand
script from changing the cpu governor on the next boot.
- On the next boot, log in normally, then update all packages from the Update
Manager, and reboot if necessary.
- Launch a Terminal window. All test cmds will be executed from this directory:
$ cd /sys/devices/system/cpu/cpu0/cpufreq
- Open a 2nd Terminal window and execute this so you can watch the CPU freq.
$ watch -n0 "cat /proc/cpuinfo"

TEST:
- Check the available and current governor, the available freqs, and the
scaling driver.
$ cat scaling_available_governors
conservative ondemand userspace powersave performance
$ cat scaling_governor
performance
$ cat scaling_available_frequencies
1600000 1400000 1300000 1200000 1100000 1000000 900000 800000
$ cat scaling_driver
acpi-cpufreq

- Try powersave. The CPU drops to 800 MHz. No hang.
$ echo -n powersave | sudo tee scaling_governor

- Try ondemand. Ubuntu hangs after I press enter.
$ echo -n ondemand | sudo tee scaling_governor

- Reboot, then try conservative. Ubuntu hangs a moment after I press enter. I
observed the CPU freq dropping to 1400 MHz, then 1300 MHz, 1200 MHz, 1100 MHz,
then hang.
$ echo -n conservative | sudo tee scaling_governor

- Reboot, then try userspace. No hang at this point. CPU freq is 1600 MHz.
$ echo -n userspace | sudo tee scaling_governor

- Manually change the CPU freq. These changes don't hang. The CPU freq is
correctly changed to the specified freq.
$ echo -n 1400000 | sudo tee scaling_setspeed
$ echo -n 1300000 | sudo tee scaling_setspeed
$ echo -n 1200000 | sudo tee scaling_setspeed
$ echo -n 1100000 | sudo tee scaling_setspeed

- Now try 1000 MHz. This hangs instantly.
$ echo -n 1000000 | sudo tee scaling_setspeed

- Reboot, try 900 MHz. This hangs instantly.
$ echo -n 900000 | sudo tee scaling_setspeed

- Reboot, try 800 MHz. CPU freq changed to 800 Mhz. No hang.
$ echo -n 800000 | sudo tee scaling_setspeed

END OF TEST

EXPECTED RESULTS:
- System does not hang.

ADDITIONAL NOTES:
- My latest test of this bug is on Ubuntu 11.10 + mainline kernel
"linux-image-3.4.0-999-generic_3.4.0-999.201204260409_amd64.deb". To confirm
that my test was conducted on the mainline kernel, I executed uname:

$ uname -srvmpio
Linux 3.4.0-999-generic #201204260409 SMP Thu Apr 26 08:10:51 UTC 2012 x86_64
x86_64 x86_64 GNU/Linux

- When the hang occurs, the entire system is frozen. Unlike a kernel panic, my
keyboard LEDs did NOT blink rapidly.
- When the hang occurs, nothing about the hang is written to the kern.log.
- I tried to capture any output from a netconsole session as described here:
https://wiki.ubuntu.com/Kernel/Netconsole?action=show&redirect=KernelTeam%2FNetconsole
. The "receiver" over the network is supposed to capture output from the
kernel. When the hang occurs, nothing is received by the receiver.
- For dmesg, cpuinfo, modules, and other info, see attachments on the original
bug filed at "bugs.launchpad.net".

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
