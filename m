From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] Problems with hibernation, with bisect
Date: Sun, 01 Dec 2013 18:08:40 +0000
Message-ID: <bug-65671-12968-bdtXBCGljU@https.bugzilla.kernel.org/>
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

--- Comment #5 from higuita <higuita@gmx.net> ---
ok, more info.

I have spend half of the weekend to try to debug this with kernel 2.12.1 and
this is what i found:

in the bios if i disable both the "V-Link 8X Support" and "AGP Fast write",
things get more stable and i only have problems if i hibernate with the machine
with load (actually, i'm using the glxgears)

If i disable the "ACPI APIC", i have no problem at all, the machine is stable
during many hibernations cycles, even on heavy load... saddly, i lost the
second CPU without APIC

So i think this points to something related to the AGP bus.

With the APIC turn on and the "Vlink" and the "AGP fast write" turn on, i get
the problem even on the console, without the X11 loaded, so maybe the something
used by the modeset.

I will try to disable it and do some more test.

Again, i only have problems with hibernations, if i dont hibernate, everything
looks stable during several weeks/months

-- 
You are receiving this mail because:
You are the assignee for the bug.
