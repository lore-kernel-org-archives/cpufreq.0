From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: oops on resume
Date: Thu, 05 Aug 2004 15:02:04 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Distribution: Fedora Core/Rawhide
Hardware Environment: Dell Inspiron 4150
Software Environment: Fedora Core 2/Rawhide
Problem Description: when returning from a sleep, the kernel oopses

Steps to reproduce:
- boot kernel (fedora kernel 2.6.7-1.503 currently which is
2.6.8-rc2-bk11 according to the changelog in the kernel package)
- as root: "echo mem >/sys/power/state" and watch as it goes to sleep

Stopping tasks: ===============================================|
PM: Entering state.

- press power button to wake it up and watch on the console as it does:

Back to C!
zapping low mappings.
Warning: CPU frequency out of sync: cpufreq and timingcore thinks of 1200000, i.divide error: 0000 [#1]
Modules linked in: parport_pc(U) lp(U) parport(U) autofs4(U) ds(U) yenta_socket)CPU:    0
EIP:    0060:[<02111d75>]    Not tainted
EFLAGS: 00000216   (2.6.7-1.503custom)
EIP is at time_cpufreq_notifier+0x29c/0x2a3
eax: 0233f4e8   ebx: 00000891   ecx: 0021794a   edx: 0000080e
esi: 000003ea   edi: 002191c0   ebp: 00000000   esp: 2108cec0
ds: 0068   es: 007b   ss: 0068
Process bash (pid: 14500, threadinfo=2108c000 task=1f3b6030)
Stack: 0233ccc0 2108cef0 00000008 00000004 0212c929 2108cef0 21fcb684 023c1828
       02291741 02324a1e 00124f80 002191c0 00000000 00124f80 002191c0 0210ebc0
       0235edb4 023548e0 0222c151 00000000 00000002 00000246 0222f17c 021390ae
Call Trace:
 [<0212c929>] notifier_call_chain+0x17/0x2b
 [<02291741>] cpufreq_resume+0xa9/0xd1
 [<0210ebc0>] mtrr_restore+0x42/0x47
 [<0222c151>] sysdev_resume+0x55/0xa5
 [<0222f17c>] device_power_up+0x5/0xa
 [<021390ae>] suspend_enter+0x25/0x2d
 [<02139131>] enter_state+0x54/0x7f
 [<02139239>] state_store+0x84/0x99
 [<021391b5>] state_store+0x0/0x99
 [<021a56df>] subsys_attr_store+0x19/0x21
 [<021a5852>] flush_write_buffer+0x1d/0x22
 [<021a5879>] sysfs_write_file+0x22/0x35
 [<02160b77>] vfs_write+0xb6/0xe2
 [<02160c11>] sys_write+0x2c/0x42
Code: 31 c0 5b 5e 5f 5d c3 55 bd a4 cc 33 02 57 56 53 83 ec 24 8b

Any ideas?

b.
