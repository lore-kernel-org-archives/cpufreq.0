From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42807] New: Frequency scaling causes micro-freezes / lags /
 stutters with AMD Zambezi (Bulldozer) CPU
Date: Tue, 21 Feb 2012 18:23:21 GMT
Message-ID: <bug-42807-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42807

           Summary: Frequency scaling causes micro-freezes / lags /
                    stutters with AMD Zambezi (Bulldozer) CPU
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.2.0-17
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: mightyiampresence@gmail.com
        Regression: No


Dear Ones,

This is reported downstream Ubuntu, where the usual files are attached. I can
attach any file here if necessary. Here's the URL:
https://bugs.launchpad.net/ubuntu/+source/linux-meta/+bug/927918

When frequency scaling is activated (more details below) the system has short
freezes, short lags, short "time-outs". They vary in length and can be as long
as about 1 second. Here's a video(1).

I've received help from the fantastic folks at the xorg-driver-ati mailing
list. Here's the thread(2).

Windows 7 runs smooth, without the stuttering / framedrop problem.

Here's some testing with different governors:
performance: smoothness goodness
ondemand: the stuttering as demonstrated in the video
conservative: stuttering reduced to seemingly about 10% compared to ondemand
powersave: stuttering increase seemingly to about five times more than with
ondemand

When using ondemand, raising minimum frequencies results in less stuttering.
Raising the minimum frequency of all four cores to the second step, 1.7GHz,
helps a lot and and raising it to 2.5GHz results no stuttering. This is under
the limited strain of dragging windows around in 1280x1024 in compiz.

It didn't happen when my CPU was an AMD Sempron 140. As soon as I switched to
the AMD FX-4100 CPU this started.

As per Gigabyte's instructions(3), in order to have support for this CPU, I
upgraded the BIOS from the "F2" version to the "F3" version before replacing
the CPU. If it is necessary, I can still put in the old Sempron 140 CPU for
testing.

More stuff I tried since replacing the CPU: I have played with BIOS settings -
trying different configurations. I also replaced to a new, more adequate PSU. I
also tried different RAM sticks and different amounts of them (1, 2 and 4
sticks).

Thanks and blessings,
Shahar

Links:
1. http://bit.ly/xDOZF3 (on Google Docs)
2. http://lists.x.org/archives/xorg-driver-ati/2012-February/022223.html
3. http://www.gigabyte.com/support-downloads/cpu-support-popup.aspx?pid=3817

Here is the usual dump from Ubuntu:
ProblemType: BugDistroRelease: Ubuntu 11.10
Package: xorg 1:7.6+7ubuntu7.1
ProcVersionSignature: Ubuntu 3.0.0-15.26-generic 3.0.13
Uname: Linux 3.0.0-15-generic x86_64
.tmp.unity.support.test.0:

ApportVersion: 1.23-0ubuntu4
Architecture: amd64
CompizPlugins:
[core,bailer,detection,composite,opengl,decor,mousepoll,vpswitch,regex,animation,snap,expo,move,compiztoolbox,place,grid,imgpng,gnomecompat,wall,ezoom,workarounds,resize,fade,unitymtgrabhandles,scale,session,unityshell]
CompositorRunning: None
Date: Mon Feb 6 23:38:39 2012
DistUpgraded: Log time: 2011-10-16 02:49:10.693391
DistroCodename: oneiric
DistroVariant: ubuntu
EcryptfsInUse: Yes
ExtraDebuggingInterest: Yes, whatever it takes to get this fixed in Ubuntu
GraphicsCard:
 ATI Technologies Inc RS880 [Radeon HD 4250] [1002:9715] (prog-if 00 [VGA
controller])
   Subsystem: Giga-byte Technology Device [1458:d000]InstallationMedia: Ubuntu
10.10 "Maverick Meerkat" - Release amd64 (20101007)
MachineType: Gigabyte Technology Co., Ltd. GA-880GMA-USB3
ProcKernelCmdLine: BOOT_IMAGE=/boot/vmlinuz-3.0.0-15-generic
root=UUID=57641e34-8b71-4e2e-9324-ff40ca1bc82a ro quiet splash
vt.handoff=7SourcePackage: xorg
UpgradeStatus: Upgraded to oneiric on 2011-10-16 (113 days ago)
dmi.bios.date: 10/20/2011
dmi.bios.vendor: Award Software International, Inc.
dmi.bios.version: F3
dmi.board.name: GA-880GMA-USB3
dmi.board.vendor: Gigabyte Technology Co., Ltd.
dmi.chassis.type: 3
dmi.chassis.vendor: Gigabyte Technology Co., Ltd.
dmi.modalias:
dmi:bvnAwardSoftwareInternational,Inc.:bvrF3:bd10/20/2011:svnGigabyteTechnologyCo.,Ltd.:pnGA-880GMA-USB3:pvr:rvnGigabyteTechnologyCo.,Ltd.:rnGA-880GMA-USB3:rvr:cvnGigabyteTechnologyCo.,Ltd.:ct3:cvr:
dmi.product.name: GA-880GMA-USB3
dmi.sys.vendor: Gigabyte Technology Co., Ltd.
version.compiz: compiz 1:0.9.6+bzr20110929-0ubuntu6
version.ia32-libs: ia32-libs 20090808ubuntu26
version.libdrm2: libdrm2 2.4.26-1ubuntu1
version.libgl1-mesa-dri: libgl1-mesa-dri 7.11-0ubuntu3
version.libgl1-mesa-dri-experimental: libgl1-mesa-dri-experimental N/A
version.libgl1-mesa-glx: libgl1-mesa-glx 7.11-0ubuntu3
version.xserver-xorg: xserver-xorg 1:7.6+7ubuntu7.1
version.xserver-xorg-input-evdev: xserver-xorg-input-evdev 1:2.6.0-1ubuntu13
version.xserver-xorg-video-ati: xserver-xorg-video-ati
1:6.14.99~git20110811.g93fc084-0ubuntu1
version.xserver-xorg-video-intel: xserver-xorg-video-intel
2:2.15.901-1ubuntu2.1
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20110411+8378443-1

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
