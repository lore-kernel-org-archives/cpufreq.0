From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6851] New: Software Suspend and Ondemand Lockup/Stack trace
Date: Mon, 17 Jul 2006 08:42:08 -0700
Message-ID: <200607171542.k6HFg8xr018400@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6851

           Summary: Software Suspend and Ondemand Lockup/Stack trace
    Kernel Version: 2.16.18-rc1, 2.6.18-rc1-mm1, 2.6.18-rc1-mm2
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: brandon@ifup.org


Most recent kernel where this bug did not occur:

Distribution: Debian GNU/Linux (unstable)

Hardware Environment: Thinkpad x60s w/ Forrest Zhao's patches for AHCI suspend:
http://marc.theaimsgroup.com/?l=linux-ide&m=115277002327654&w=2

Software Environment: gcc version 4.1.2 20060630 (prerelease) (Debian 4.1.1-6)

Problem Description: Suspend to ram failure (echo mem > /sys/power/state) w/
backtrace on 2.6.18-rc1-mm1

Steps to reproduce:

1) Use ondemand governor
2) echo mem > /sys/power/state
3) 
Freezing cpus ...
CPU 1 is now offline
SMP alternatives: switching to UP code
divide error: 0000 [#1]
8K_STACKS SMP
last sysfs file: /power/state
Modules linked in: binfmt_misc rfcomm l2cap bluetooth ipv6 nvram uinput button
ac battery joydev ibm_acpi hdaps cpufreq_userspace speedstep_centrino freq_table
sbp2
cpufreq_ondemand tsdev intelfb i2c_algo_bit snd_hda_intel i2c_i801 psmouse
nsc_ircc snd_hda_codec pcspkr intel_agp agpgart eth1394 evdev i2c_core serio_raw
irda snd_pcm
snd_timer snd soundcore yenta_socket rsrc_nonstatic pcmcia_core snd_page_alloc
crc_ccitt ata_piix piix sd_mod generic ide_core uhci_hcd ohci1394 ieee1394
ehci_hcd usbcore
e1000 ahci libata scsi_mod thermal processor fan
CPU:    0
EIP:    0060:[<f8a0d20d>]    Not tainted VLI
EFLAGS: 00210246   (2.6.18-rc1-mm1 #2)
EIP is at do_dbs_timer+0xcb/0x14e [cpufreq_ondemand]
eax: 00000000   ebx: 00000000   ecx: 00000001   edx: 00000000
esi: c1dda380   edi: 00000002   ebp: c1dda380   esp: f7d5ff4c
ds: 007b   es: 007b   ss: 0068
Process kondemand/0 (pid: 5266, ti=f7d5e000 task=dff48b90 task.ti=f7d5e000)
Stack: 00000000 c1bfaba0 00000000 00000000 c1c02bb4 c1c02bb8 f7f69d80 00200286
       c012c04c 00000000 f8a0d142 00000000 f7f69d94 f7f69d80 f7f69d8c 00000000
       c012c9a2 00000001 00000000 c1c01280 00010000 00000000 00000000 dff48b90
Call Trace:
 [<c012c04c>] run_workqueue+0x80/0xbc
 [<f8a0d142>] do_dbs_timer+0x0/0x14e [cpufreq_ondemand]
 [<c012c9a2>] worker_thread+0xf3/0x125
 [<c0117c57>] default_wake_function+0x0/0x15
 [<c012c8af>] worker_thread+0x0/0x125
 [<c012ef9c>] kthread+0xc3/0xef
 [<c012eed9>] kthread+0x0/0xef
 [<c0101005>] kernel_thread_helper+0x5/0xb
Code: 00 39 44 24 0c 0f 46 44 24 0c 89 44 24 0c 56 57 e8 2f 79 7c c7 5b 89 c7 5d
83 ff 01 76 a3 8b 44 24 08 31 d2 2b 44 24 0c 6b c0 64 <f7> 74 24 08 89 c1 a1 a8
e6 a0 f8
39 c1 76 0d 8b 46 1c 39 46 20
EIP: [<f8a0d20d>] do_dbs_timer+0xcb/0x14e [cpufreq_ondemand] SS:ESP 0068:f7d5ff4c

Note: 2.6.18-rc1 and 2.16.18-rc1-mm2 do not create the stack trace and simply
stop suspending at: SMP alternatives: switching to UP code.  

5) A ctrl+alt+del reboots the box cleanly

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
