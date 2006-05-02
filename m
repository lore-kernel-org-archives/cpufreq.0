From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6478] New: rmmod powernow_k8 BUG
Date: Tue, 2 May 2006 01:08:37 -0700
Message-ID: <200605020808.k4288bs8001794@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6478

           Summary: rmmod powernow_k8 BUG
    Kernel Version: 2.6.17-rc3-git2
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: ralf.hildebrandt@charite.de


Most recent kernel where this bug did not occur: 2.6.17-rc3-mm1
Distribution: Debian/unstable
Hardware Environment: AMD Turion(tm) 64 Mobile Technology ML-30
Software Environment:
Problem Description: 

Steps to reproduce:

% sync && modprobe powernow_k8

results in 

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.60.2)
powernow-k8:    0 : fid 0x0 (800 MHz), vid 0x12 (1100 mV)
powernow-k8:    1 : fid 0x8 (1600 MHz), vid 0x4 (1450 mV)
cpu_init done, current fid 0x8, vid 0x2
powernow-k8: ph2 null fid transition 0x8

and a subsequent 

% sync && rmmod powernow_k8

BUG: unable to handle kernel NULL pointer dereference at virtual address 
0000002c
 printing eip:
dcda3b09
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: powernow_k8 freq_table radeon drm thermal fan button 
processor ac battery af_packet ide_scsi sata_sil libata scsi_mod eeprom 
saa7134_dvb mt352 saa7134 compat_ioctl32 v4l2_common v4l1_compat ir_kbd_i2c 
ir_common videodev video_buf_dvb dvb_core video_buf nxt200x dvb_pll tda1004x 
usbhid usbmouse tsdev 8250_pci pcmcia firmware_class rt2500 8250 yenta_socket 
serial_core psmouse evdev rsrc_nonstatic pcmcia_core 8139too ehci_hcd ohci_hcd 
ide_cd usbcore ati_agp agpgart snd_atiixp_modem snd_atiixp snd_ac97_codec 
snd_ac97_bus snd_pcm snd_timer snd soundcore snd_page_alloc cdrom unix
CPU:    0
EIP:    0060:[<dcda3b09>]    Not tainted VLI
EFLAGS: 00010286   (2.6.17-rc3-git2 #1)
EIP is at acpi_processor_unregister_performance+0x1e/0x3e [processor]
eax: 00000000   ebx: da498400   ecx: 00000001   edx: 00000000
esi: da0bed80   edi: 00000286   ebp: da0bee0c   esp: d97e8f1c
ds: 007b   es: 007b   ss: 0068
Process rmmod (pid: 5075, threadinfo=d97e8000 task=d7891570)
Stack: <0>d02c2dc0 dcdad4e6 da0bed80 da0beda8 c02973d2 c03aef48 c034dd4c 
c034b01c
       c034b000 c0275c47 00000880 dcdaf100 00000000 d97e8000 c02960f5 c01366e6
       65776f70 776f6e72 00386b5f cf439e34 c0149f89 b7f6a000 dae58900 c014b3b8
Call Trace:
 <dcdad4e6> powernowk8_cpu_exit+0x26/0x50 [powernow_k8]   <c02973d2> 
cpufreq_remove_dev+0xb2/0x120
 <c0275c47> sysdev_driver_unregister+0x67/0x80   <c02960f5> 
cpufreq_unregister_driver+0x25/0x60
 <c01366e6> sys_delete_module+0x146/0x1c0   <c0149f89> remove_vma+0x39/0x50
 <c014b3b8> do_munmap+0x198/0x1f0   <c0102f2b> syscall_call+0x7/0xb
Code: 01 00 00 31 c0 83 c4 2c 5b 5e 5f 5d c3 53 ff 0d e0 60 da dc 0f 88 f8 01 
00 00 8b 1c 95 8c 62 da dc 85 db 74 18 8b 83 6c 02 00 00 <8b> 40 2c e8 0f 26 
3b e3 c7 83 6c 02 00 00 00 00 00 00 ff 05 e0
EIP: [<dcda3b09>] acpi_processor_unregister_performance+0x1e/0x3e [processor] 
SS:ESP 0068:d97e8f1c

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
