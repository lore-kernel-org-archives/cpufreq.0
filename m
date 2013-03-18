From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] New: sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Mon, 18 Mar 2013 09:13:02 +0000 (UTC)
Message-ID: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411

           Summary: sysfs per-cpu cpufreq subdirs/symlinks screwed up
                    after s2ram
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9-rc3
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: 1i5t5.duncan@cox.net
        Regression: Yes


Created an attachment (id=95681)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=95681)
kernel config

I have a kde/superkaramba theme that monitors system state, including current
cpu frequencies.  Testing the 3.9-pre kernels (from git), I noticed that after
a suspend2ram and resume, several of the current frequency readouts were
missing!  Investigating, I found that the per-cpu sysfs cpufreq
subdirs/symlinks were screwed up after an s2ram/resume cycle.

The CPU's an AMD bulldozer tri-cluster/6-core.

Abridged (perms/dates omitted) fresh-boot (good)
ls -dl /sys/devices/system/cpu/cpu?/cpufreq :

/sys/devices/system/cpu/cpu0/cpufreq/
/sys/devices/system/cpu/cpu1/cpufreq -> ../cpu0/cpufreq/
/sys/devices/system/cpu/cpu2/cpufreq/
/sys/devices/system/cpu/cpu3/cpufreq -> ../cpu2/cpufreq/
/sys/devices/system/cpu/cpu4/cpufreq/
/sys/devices/system/cpu/cpu5/cpufreq -> ../cpu4/cpufreq/

After a s2ram/resume cycle (now bad):

/sys/devices/system/cpu/cpu0/cpufreq/
/sys/devices/system/cpu/cpu1/cpufreq -> ../cpu0/cpufreq/
/sys/devices/system/cpu/cpu3/cpufreq/
/sys/devices/system/cpu/cpu5/cpufreq/

The subdirs for cpu2 and 4 disappeared, and cpu3 and 5 now have subdirs instead
of symlinks to the (missing) cp2 2 and 4 subdirs.

No WONDER the cat of the scaling_cur_freq files ends up returning nothing for
some cpus, those files, along with the dirs they were in, disappeared!

Additionally, some of the values in the remaining files are screwy.  I'll
comment on them as I attach...

Attached is my config (redirected zcat /proc/config.gz, note that it's
monolithic, no modules), and I'll attach dmesg, a grep . of the cpufreq files
both good and bad, and cpufreq-info output both good and bad (based on the
attachment requests I saw for a different cpufreq bug), as well.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
