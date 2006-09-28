From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7221] New: acpi_cpufreq_target calls smp_processor_id while
	preemptible
Date: Thu, 28 Sep 2006 01:47:02 -0700
Message-ID: <200609280847.k8S8l2NC030005@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7221

           Summary: acpi_cpufreq_target calls smp_processor_id while
                    preemptible
    Kernel Version: 2.6.18
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: djwong@us.ibm.com
                CC: lcm@us.ibm.com


Most recent kernel where this bug did not occur: <shrug> At the very least,
before cpufreq existed
Distribution: ubuntu
Hardware Environment: IBM x346, 2x 3.6GHz Xeon with EIST enabled.
Software Environment:
Problem Description: acpi_cpufreq_target should disable preemption when it calls
smp_processor_id; its failure to do so results in complaints in dmesg.

Steps to reproduce: 1. Build kernel with CONFIG_PREEMPT_DEBUGGING=y
2. Boot system
3. Observe complaints in dmesg:

BUG: using smp_processor_id() in preemptible [00000001] code: powernowd/1930
caller is acpi_cpufreq_target+0x14b/0x266 [acpi_cpufreq]

Call Trace:
 [<ffffffff8016b1b1>] show_trace+0xae/0x33a
 [<ffffffff8016b654>] dump_stack+0x13/0x15
 [<ffffffff8023dff8>] debug_smp_processor_id+0xbb/0xcb
 [<ffffffff88263779>] :acpi_cpufreq:acpi_cpufreq_target+0x14b/0x266
 [<ffffffff802db992>] __cpufreq_driver_target+0x62/0x72
 [<ffffffff8824f112>] :cpufreq_userspace:store_speed+0xb1/0xd3
 [<ffffffff801719d7>] store+0x4a/0x64
 [<ffffffff801f66c7>] sysfs_write_file+0xc9/0x102
 [<ffffffff80115412>] vfs_write+0xae/0x154
 [<ffffffff80115cd3>] sys_write+0x47/0x6f
 [<ffffffff8015ca8e>] system_call+0x7e/0x83
DWARF2 unwinder stuck at system_call+0x7e/0x83
Leftover inexact backtrace:

I'm not quite sure how to fix this one--disable preemption in that
acpi_cpufreq_target function?  That may be a big hammer to swing though.  In any
case I'm not the author so I don't really know.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
