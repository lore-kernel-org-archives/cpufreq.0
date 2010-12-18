From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 25132] New: longhaul : failed to set requested frequency
Date: Sat, 18 Dec 2010 14:52:32 GMT
Message-ID: <bug-25132-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=25132

           Summary: longhaul : failed to set requested frequency
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.32
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: mathieu.ruellan@gmail.com
        Regression: No


After a few day (but can be a short time), powernowd or the ondemand governor
doesn't work anymore. The cpu frequency can't be changed. I can unload the
longhaul module but, after modprobe longhaul fail (not found on my system).
I have to reboot.

/var/log/message:

Dec 18 05:01:09 www -- MARK --
Dec 18 05:21:09 www -- MARK --
Dec 18 05:41:09 www -- MARK --
Dec 18 06:01:09 www -- MARK --
Dec 18 06:02:05 www kernel: [379334.212264] longhaul: Failed to set requested
frequency!
Dec 18 06:02:05 www kernel: [379334.212302] longhaul: Enabling "Ignore Revision
ID" option.
Dec 18 06:02:06 www kernel: [379334.424201] longhaul: Failed to set requested
frequency!
Dec 18 06:02:06 www kernel: [379334.684090] longhaul: Failed to set requested
frequency!
Dec 18 06:03:00 www kernel: [379389.008089] longhaul: Failed to set requested
frequency!


www:~# lspci
00:00.0 Host bridge: VIA Technologies, Inc. CN333/CN400/PM880 Host Bridge
00:00.1 Host bridge: VIA Technologies, Inc. CN333/CN400/PM880 Host Bridge
00:00.2 Host bridge: VIA Technologies, Inc. CN333/CN400/PM880 CPU Host Bridge
00:00.3 Host bridge: VIA Technologies, Inc. CN333/CN400/PM880 Host Bridge
00:00.4 Host bridge: VIA Technologies, Inc. CN333/CN400/PM880 Host Bridge
00:00.7 Host bridge: VIA Technologies, Inc. CN333/CN400/PM880 Host Bridge
00:01.0 PCI bridge: VIA Technologies, Inc. VT8237/VX700 PCI Bridge
00:0d.0 Ethernet controller: VIA Technologies, Inc. VT6102 [Rhine-II] (rev 8d)
00:0f.0 RAID bus controller: VIA Technologies, Inc. VIA VT6420 SATA RAID
Controller (rev 80)
00:0f.1 IDE interface: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE (rev 06)
00:10.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.2 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.3 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.4 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 86)
00:11.0 ISA bridge: VIA Technologies, Inc. VT8237 ISA bridge
[KT600/K8T800/K8T890 South]
00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102 [Rhine-II] (rev 78)
01:00.0 VGA compatible controller: VIA Technologies, Inc.
CN400/PM800/PM880/PN800/PN880 [S3 UniChrome Pro] (rev 02)

kernel options:

GRUB_CMDLINE_LINUX="noapic nolapic clocksource=acpi_pm"


www:~# more /proc/cpuinfo 
processor    : 0
vendor_id    : CentaurHauls
cpu family    : 6
model        : 9
model name    : VIA Nehemiah
stepping    : 10
cpu MHz        : 532.000
cache size    : 64 KB
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 1
wp        : yes
flags        : fpu vme de pse tsc msr cx8 sep mtrr pge cmov pat mmx fxsr sse up
rng rng_en ace ace_en
bogomips    : 1066.67
clflush size    : 32
cache_alignment    : 32
address sizes    : 32 bits physical, 32 bits virtual
power management:

Contact me if you need more details.

Best regards,

Mathieu Ruellan

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
