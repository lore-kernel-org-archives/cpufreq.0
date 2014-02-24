From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked
Date: Mon, 24 Feb 2014 03:17:21 +0000
Message-ID: <bug-65671-12968-KxUKvKyOLO@https.bugzilla.kernel.org/>
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

--- Comment #12 from higuita <higuita@gmx.net> ---
Ok, i have a little more information:


i found that ondemand still causes problems and after the upgrade to 3.13.3, it
also lock up, just like the conservative governor. I then change my hibernate
script to include this before the hibernation

cpufreq-set -g  performance
rmmod powernow_k8

and after the hibernation i revert that:

modprobe powernow_k8
cpufreq-set -g  ondemand

All seems to be working fine, i'm getting higher uptimes, many hibernations
cycles without problems and zero Filesystem corruption.

i have seen this on the dmesg, after waking from hibernation:

[ 8379.324747] [Firmware Bug]: powernow-k8: No compatible ACPI _PSS objects
found.
[ 8379.324747] [Firmware Bug]: powernow-k8: First, make sure Cool'N'Quiet is
enabled in the BIOS.
[ 8379.324747] [Firmware Bug]: powernow-k8: If that doesn't help, try upgrading
your BIOS.
[ 8379.324858] powernow-k8: Found 1 Dual Core AMD Opteron(tm) Processor 175 (2
cpu cores) (version 2.20.00)

This motherboard (asus A8V deluxe) don't have ACPI cpufreq, but the
cool'n'quiet is enabled in the bios.

-- 
You are receiving this mail because:
You are the assignee for the bug.
