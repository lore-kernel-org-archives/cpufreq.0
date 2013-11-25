From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] Problems with hibernation, with bisect
Date: Mon, 25 Nov 2013 17:08:50 +0000
Message-ID: <bug-65671-12968-almeZeXYJG@https.bugzilla.kernel.org/>
References: <bug-65671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65671-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65671

--- Comment #4 from higuita <higuita@gmx.net> ---
I don't have a intel card, i have a old ATI HD2600 AGP on a old Asus A8V MB.
Here is the lspci:

00:00.0 Host bridge: VIA Technologies, Inc. K8T800Pro Host Bridge
00:00.1 Host bridge: VIA Technologies, Inc. K8T800Pro Host Bridge
00:00.2 Host bridge: VIA Technologies, Inc. K8T800Pro Host Bridge
00:00.3 Host bridge: VIA Technologies, Inc. K8T800Pro Host Bridge
00:00.4 Host bridge: VIA Technologies, Inc. K8T800Pro Host Bridge
00:00.7 Host bridge: VIA Technologies, Inc. K8T800Pro Host Bridge
00:01.0 PCI bridge: VIA Technologies, Inc. VT8237/8251 PCI bridge
[K8M890/K8T800/K8T890 South]
00:07.0 FireWire (IEEE 1394): VIA Technologies, Inc. VT6306/7/8 [Fire II(M)]
IEEE 1394 OHCI Controller (rev 80)
00:08.0 RAID bus controller: Promise Technology, Inc. PDC20378 (FastTrak
378/SATA 378) (rev 02)
00:0a.0 Ethernet controller: Marvell Technology Group Ltd. 88E8001 Gigabit
Ethernet Controller (rev 13)
00:0e.0 Multimedia video controller: Brooktree Corporation Bt878 Video Capture
(rev 11)
00:0e.1 Multimedia controller: Brooktree Corporation Bt878 Audio Capture (rev
11)
00:0f.0 RAID bus controller: VIA Technologies, Inc. VIA VT6420 SATA RAID
Controller (rev 80)
00:0f.1 IDE interface: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE (rev 06)
00:10.0 USB controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.1 USB controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.2 USB controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.3 USB controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev 81)
00:10.4 USB controller: VIA Technologies, Inc. USB 2.0 (rev 86)
00:11.0 ISA bridge: VIA Technologies, Inc. VT8237 ISA bridge
[KT600/K8T800/K8T890 South]
00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233/A/8235/8237
AC97 Audio Controller (rev 60)
00:11.6 Communication controller: VIA Technologies, Inc. AC'97 Modem Controller
(rev 80)
00:18.0 Host bridge: AMD [Advanced Micro Devices, Inc.] K8 [Athlon64/Opteron]
HyperTransport Technology Configuration
00:18.1 Host bridge: AMD [Advanced Micro Devices, Inc.] K8 [Athlon64/Opteron]
Address Map
00:18.2 Host bridge: AMD [Advanced Micro Devices, Inc.] K8 [Athlon64/Opteron]
DRAM Controller
00:18.3 Host bridge: AMD [Advanced Micro Devices, Inc.] K8 [Athlon64/Opteron]
Miscellaneous Control
01:00.0 VGA compatible controller: AMD/ATI [Advanced Micro Devices, Inc.] RV630
XT [Radeon HD 2600 XT AGP]


But that bug asks this:
"I primarily meant outside of gfx domain. It would be likely to see fs
corruption for example. Depending on your system, it might be unlikely to see
this corruption without using various memory debugging tools. My fear is we've
traded silent memory corruption for hangs."

in the past, i had some FS corruption after several hibernations cycles...
could it be that i have this kind of silent memory corruption problem and that
patch triggers the problem when in the past it was hidden?

when i wakeup the machine, i get this 

[ 5137.948087] Uhhuh. NMI received for unknown reason 2c on CPU 0.
[ 5137.950056] Do you have a strange power saving mode enabled?
[ 5137.995447] Dazed and confused, but trying to continue

Could this corrupt some part of the memory?

I recently run the memtest86+ for several hours and didn't got any problem.
Also, if i don't hibernate the machine, it works fine for several months,
without any problem.

Is any tool to do some sort of memory checksum before and after the
hibernation, to try to catch any (bad) change?

-- 
You are receiving this mail because:
You are the assignee for the bug.
