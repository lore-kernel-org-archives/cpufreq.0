From: bugme-daemon@osdl.org
Subject: [Bug 3142] New: Loading speedstep-ich module seg faults
Date: Sun, 1 Aug 2004 12:54:37 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408011954.i71Jsbf9006641@fire-1.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3142

           Summary: Loading speedstep-ich module seg faults
    Kernel Version: 2.6.7
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: jtwind@cinci.rr.com


Distribution: Linux From scratch 5.0
Hardware Environment: Dell 5150 Laptop
Software Environment: Kernel 2.6.7
Problem Description: Loading speedstep-ich module segfaults on load

Unable to handle kernel NULL pointer dereference at virtual address 00000018
 printing eip:
c0243f00
*pde = 00000000
Oops: 0000 [#1]
PREEMPT SMP
Modules linked in: speedstep_ich uhci_hcd ehci_hcd usbhid cpufreq_userspace
cpufreq_powersave speedstep_lib thermal processor fan button battery ac i8k
ohci1394 ieee1394 nvidia snd_intel8x0 snd_ac97_codec snd_pcm snd_timer
snd_page_alloc snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcore
ndiswrapper rtc ntfs
CPU:    1
EIP:    0060:[<c0243f00>]    Tainted: P
EFLAGS: 00210246   (2.6.7)
EIP is at cpufreq_notify_transition+0x7f/0x119
eax: 00000001   ebx: c0332ce4   ecx: 00000000   edx: 00000000
esi: e19f1de4   edi: 00000000   ebp: 00000002   esp: e19f1da4
ds: 007b   es: 007b   ss: 0068
Process modprobe (pid: 3780, threadinfo=e19f1000 task=eeb13360)
Stack: c03b5690 00000000 e19f1de4 e19f1ddc e19f1ddc e19f1ddc f0a7141c e19f1de4
       00000000 002ecade 00000001 e19f1de0 00000001 00000003 00000003 00000000
       00000001 002ecade 002ecade c017bf00 00000001 00000000 efdd4238 00000001
Call Trace:
 [<f0a7141c>] speedstep_target+0x17a/0x26b [speedstep_ich]
 [<c017bf00>] simple_statfs+0x9/0x1e
 [<c02437ec>] __cpufreq_driver_target+0x3c/0x44
 [<c024438a>] cpufreq_governor_performance+0x32/0x38
 [<c02438d7>] __cpufreq_governor+0x6c/0x141
 [<c0243cb2>] __cpufreq_set_policy+0x124/0x1a9
 [<c0243d83>] cpufreq_set_policy+0x4c/0x8c
 [<f0a71659>] speedstep_get+0x0/0xf [speedstep_ich]
 [<c02431e1>] cpufreq_add_dev+0x224/0x3bf
 [<c0243474>] handle_update+0x0/0x5
 [<c01f7528>] sysdev_driver_register+0xc0/0xd5
 [<c0244029>] cpufreq_register_driver+0x8f/0x16c
 [<f0a74039>] speedstep_init+0x39/0x54 [speedstep_ich]
 [<c01379bb>] sys_init_module+0x12a/0x270
 [<c0104157>] syscall_call+0x7/0xb

Code: 8b 47 18 85 c0 74 07 8b 56 04 39 c2 75 53 89 74 24 08 c7 44


Steps to reproduce: modprobe speedstep-ich

It also seg faults if built into the kernel

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
