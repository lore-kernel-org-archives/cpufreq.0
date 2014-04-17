From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Thu, 17 Apr 2014 08:13:41 +0000
Message-ID: <bug-73781-12968-MkkaUC409Y@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

--- Comment #12 from Stuart Foster <smf.linux@ntlworld.com> ---
My bisect attempt reports this as the source of the issue:

root@Mars:/work/linux-git# git bisect bad
b981513f806d26b2cc971eb65ced14bede67558b is the first bad commit
commit b981513f806d26b2cc971eb65ced14bede67558b
Author: Jiang Liu <jiang.liu@linux.intel.com>
Date:   Thu Jan 9 16:15:19 2014 +0800

    ACPI / scan: bail out early if failed to parse APIC ID for CPU

    Enhance ACPI CPU hotplug driver to print clear error message and
    bail out early if BIOS returns wrong value in ACPI MADT table or
    _MAT method. Otherwise it will add the CPU device even if failed
    to get APIC ID and fails any operations against sysfs interface:
    /sys/devices/system/cpu/cpux/online

    Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

:040000 040000 beed2874da58eff342807a9bed397a9b3f23accb
07f57bb8eb502216ae49cce21293a191b594095d M    drivers

-- 
You are receiving this mail because:
You are the assignee for the bug.
