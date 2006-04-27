From: Andrew Morton <akpm@osdl.org>
Subject: Fw: [Bugme-new] [Bug 6450] New: soft lockup on suspend to mem if
 cpufreq loaded
Date: Thu, 27 Apr 2006 11:13:36 -0700
Message-ID: <20060427111336.3593aef4.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk



Begin forwarded message:

Date: Thu, 27 Apr 2006 08:41:45 -0700
From: bugme-daemon@bugzilla.kernel.org
To: bugme-new@lists.osdl.org
Subject: [Bugme-new] [Bug 6450] New: soft lockup on suspend to mem if cpufreq loaded


http://bugzilla.kernel.org/show_bug.cgi?id=6450

           Summary: soft lockup on suspend to mem if cpufreq loaded
    Kernel Version: 2.6.16.11
            Status: NEW
          Severity: normal
             Owner: acpi_power-sleep-wake@kernel-bugs.osdl.org
         Submitter: ga7j61q3r30m9bmgbb9qd7rdt7@dgd.no-ip.com


Most recent kernel where this bug did not occur: From testing with liveCDs,
around 2.6.12.
Distribution: Debian
Hardware Environment: Dell Latitude D510
Software Environment: reproduced in KDE/Xorg7 and from console
Problem Description: When the speedstep_centrino module is loaded, suspend will
produce a lockup.

Steps to reproduce:
1) modprobe speedstep_centrino
2) echo mem > /sys/power/state
3) press power key to resume and lockup

I've tried this with and without the cpufreq_userspace module loaded. Since
suspend seems to disable the serial console, I've copied all of this manually.

Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0
BUG: soft lockup detected on CPU#0!

Pid: 4, comm:             events/0
EIP: 0060:[<c01373c7>] CPU: 0
EIP is at handle_IRQ_event+0x18/0x69
 EFLAGS: 00000246    Not tainted  (2.6.16.11+z4 #1)
EAX: 0000000b EBX: f7bbfcc0 ECX: f7bbfcc0 EDX: c1907ee8
ESI: 00000000 EDI: c1907ee8 EBP: c1907ee8 DS: 007b ES: 007b
CR0: 8005003b CR2: 80050033 CR3: 37030000 CR4: 000006d0
 [<c01df6de>] vgacon_switch+0x77/0xcc
 [<c0102e14>] apic_timer_interrupt+0x1c/0x24
 [<c01374e0>] __do_IRQ+0x58/0xa8
 [<c01048ef>] do_IRQ+0x19/0x2a
 [<c0102df2>] common_interrupt+0x1a/0x20
 [<c033d019>] schedule+0x302/0x5b1
 [<c01265ae>] worker_thread+0x14c/0x14e
 [<c01265ae>] worker_thread+0x14c/0x14e
 [<c0115394>] default_wake_function+0x0/0x15
 [<c01291eb>] kthread+0xd2/0xd6
 [<c0126462>] worker_thread+0x0/0x14e
 [<c0129119>] kthread+0x0/0xd6
 [<c0101005>] kernel_thread_helper+0x5/0xb

Kernel config is at http://daniel.6dns.org/misc/config-2.6.16+z4 if needed

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
