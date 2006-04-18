From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6367] acpi-cpufreq: fancy CPUfreq values - can't load
	p4-clockmod anymore
Date: Tue, 18 Apr 2006 12:23:53 -0700
Message-ID: <200604181923.k3IJNrCY015328@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6367





------- Additional Comments From oopla@users.sf.net  2006-04-18 12:23 -------
k2.6.16.7 (some printk() added - note: PREEMPT in on)

1- p4-clockmod as shipped :
  in cpufreq_p4_cpi_init()
p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available
has_N44_O17_errata[policy->cpu]=0, has_N60_errata[policy->cpu]=1
p4clockmod_table[1].frequency = -1
p4clockmod_table[2].frequency = -1
p4clockmod_table[3].frequency = -1
p4clockmod_table[4].frequency = -1
p4clockmod_table[5].frequency = -1
p4clockmod_table[6].frequency = 2025000
p4clockmod_table[7].frequency = 2362500
p4clockmod_table[8].frequency = 2700000

 - removing 'else if (has_N60...)':
p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available
has errata -- disabling frequencies lower than 2ghz
p4clockmod_table[1].frequency = 337500
p4clockmod_table[2].frequency = 675000
p4clockmod_table[3].frequency = 1012500
p4clockmod_table[4].frequency = 1350000
p4clockmod_table[5].frequency = 1687500
p4clockmod_table[6].frequency = 2025000
p4clockmod_table[7].frequency = 2362500
p4clockmod_table[8].frequency = 2700000

and it works fine as before, in 2.6.15. I can change F, bogomips/actual
performance are consistent with F selected. I'm almost always using
'ondemand', other governors seem to get stuck to either L/H limits.
So, looks like such 'has_N60_errata' test is wrong here.


2- oops on 'rmmod cpufreq_stats': same as original report, still b0rked:

Unable to handle kernel paging request at virtual address dfa6e000
 printing eip:
dfa6e000
*pde = 01465067
*pte = 00000000
Oops: 0000 [#1]
PREEMPT 
Modules linked in: cpufreq_stats cpufreq_conservative cpufreq_powersave cpufreq_
userspace cpufreq_ondemand p4_clockmod freq_table usb_storage ipt_ULOG ipv6 twof
ish serpent des sha256 crypto_null capi capifs kernelcapi pcmcia firmware_class 
iptable_filter xfrm_user ipcomp esp4 ah4 iptable_mangle ip_tables x_tables nls_i
so8859_15 nls_cp850 vfat fat dm_mod sg sr_mod sd_mod scsi_mod lp speedstep_lib s
oftdog i915 drm hangcheck_timer toshiba_acpi thermal processor fan button batter
y ac video non_fatal capability commoncap cpuid usbhid evdev 8250_pci e100 mii y
enta_socket rsrc_nonstatic pcmcia_core 8250 serial_core snd_intel8x0 snd_intel8x
0m snd_ac97_codec snd_ac97_bus snd_pcm_oss snd_mixer_oss snd_pcm intel_agp agpga
rt ide_cd psmouse ehci_hcd i2c_i801 uhci_hcd snd_timer snd soundcore snd_page_al
loc parport_pc parport cdrom serio_raw rtc i2c_core pcspkr
CPU:    0
EIP:    0060:[<dfa6e000>]    Not tainted VLI
EFLAGS: 00010282   (2.6.16.7-ss2.2.4-p4.1 #1) 
EIP is at 0xdfa6e000
eax: 00000000   ebx: dfba2500   ecx: 00000000   edx: ffff0001
esi: 00000000   edi: 00000880   ebp: d625c000   esp: d625df4c
ds: 007b   es: 007b   ss: 0068
Process rmmod (pid: 8558, threadinfo=d625c000 task=d33a3a90)
Stack: <0>dfba16e7 dfba247c 00000007 00000000 c01361a2 dfba2500 00000880 d625df6
c 
       00000000 66757063 5f716572 74617473 c2fa0073 d143d494 b7f0e000 b7f0f000 
       d143d494 cef4d200 cef4d234 00000000 d625c000 c015b2fe cef4d200 00f0e000 
Call Trace:
 [<dfba16e7>] cpufreq_stats_exit+0x47/0x4b [cpufreq_stats]
 [<c01361a2>] sys_delete_module+0x133/0x161
 [<c015b2fe>] sys_munmap+0x44/0x64
 [<c0102bd9>] syscall_call+0x7/0xb
Code:  Bad EIP value.



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
