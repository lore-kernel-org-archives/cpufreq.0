From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 19 Oct 2010 02:50:14 GMT
Message-ID: <201010190250.o9J2oEDn013377@demeter2.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #20 from Thomas Renninger <trenn@suse.de>  2010-10-19 02:50:10 ---
I possibly know the problem.
What does:
cat /sys/devices/system/cpu/cpu0/cpufreq/{affected_cpus,related_cpus}
say?
I expect (and from ACPI table info it's very likely this is the case for
Heinz's system) that ACPI_PDC_SMP_P_HWCOORD is used.
Compare with 8.4.4.5 _PSD (P-State Dependency) (ACPI spec):
CoordType: DWordConst
The type of coordination that exists (hardware) or is required (software) as a
result of the underlying hardware dependency. Could be either 0xFC (SW_ALL),
0xFD (SW_ANY) or 0xFE (HW_ALL) indicating whether OSPM is responsible for
coordinating the P-state transitions among processors with dependencies (and
needs to initiate the transition on all or any processor in the domain) or
whether the hardware will perform this coordination.

Heinz's BIOS differs _PDC (OS capabilities) and exports HW_ANY in case the
kernel tells the BIOS it can do it (and it does).

I remember another machine (Jean Delvare) where frequency switching was totally
messed up then.
So this may not be a real kernel bug. I can provide a patch so that HW_COORD OS
capability is not set, that should help Heinz can we can verify whether it's
that.

It's hard to check which coordination type is used at runtime.
I once looked it up a bit and the if affected_cpus, related_cpus are not the
same it must be HW_ANY, iirc.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
