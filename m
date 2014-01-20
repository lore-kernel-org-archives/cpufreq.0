From: Benoit Pradelle <benoit.pradelle@uvsq.fr>
Subject: Kernel taint on setspeed
Date: Mon, 20 Jan 2014 15:08:36 +0100
Message-ID: <52DD2DE4.6080002@uvsq.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org

Hi all,

On Linux 3.12.6 over an Intel x86 processor (with intel_pstate=disable), 
I am trying to change the frequency with the following command sequence:

echo "userspace" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "3000000" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_setspeed

It used to work well on older kernels, but since a recent (unknown) 
kernel version, the last command occasionaly never returns but I got the 
following log:

[344746.428121] ------------[ cut here ]------------
[344746.428132] WARNING: CPU: 7 PID: 1882 at 
/build/linux-xS3nxO/linux-3.12.6/drivers/cpufreq/cpufreq_governor.c:203 
cpufreq_governor_dbs+0x6a2/0x710()
[344746.428134] Modules linked in: msr cpufreq_userspace nfsv3 
parport_pc ppdev lp parport bnep rfcomm bluetooth ip6table_filter 
ip6_tables iptable_filter ip_tables x_tables autofs4 tun pci_stub 
vboxpci(O) vboxnetadp(O) vboxnetflt(O) vboxdrv(O) binfmt_misc uinput 
nfsd auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc fuse loop 
joydev hid_generic usbhid hid snd_hda_codec_hdmi x86_pkg_temp_thermal 
snd_hda_codec_realtek snd_hda_intel snd_hda_codec intel_powerclamp 
snd_hwdep coretemp kvm_intel kvm crc32_pclmul nvidia(PO) snd_pcm 
iTCO_wdt iTCO_vendor_support snd_page_alloc crc32c_intel 
ghash_clmulni_intel hp_wmi sparse_keymap evdev rfkill acpi_cpufreq 
processor psmouse snd_seq snd_seq_device snd_timer snd mei_me 
aesni_intel wmi pcspkr i2c_i801 serio_raw aes_x86_64 ablk_helper cryptd 
lrw gf128mul soundcore mei glue_helper lpc_ich mfd_core i2c_core button 
ext4 crc16 mbcache jbd2 sg sd_mod sr_mod crc_t10dif crct10dif_common 
cdrom xhci_hcd ahci libahci ehci_pci ehci_hcd libata scsi_mod e1000e 
usbcore usb_common ptp pps_core thermal fan thermal_sys
[344746.428213] CPU: 7 PID: 1882 Comm: tee Tainted: P           O 
3.12-1-amd64 #1 Debian 3.12.6-2
[344746.428215] Hardware name: Hewlett-Packard HP Z220 CMT 
Workstation/1790, BIOS K51 v01.14 09/27/2012
[344746.428217]  0000000000000009 ffffffff8148c9d5 0000000000000000 
ffffffff8105b572
[344746.428221]  0000000000000000 ffff880037046a00 0000000000000007 
0000000000000002
[344746.428224]  ffffffff81881fe0 ffffffff81376732 ffffffff8148f559 
ffff88033449dd00
[344746.428228] Call Trace:
[344746.428237]  [<ffffffff8148c9d5>] ? dump_stack+0x41/0x51
[344746.428245]  [<ffffffff8105b572>] ? warn_slowpath_common+0x72/0x90
[344746.428248]  [<ffffffff81376732>] ? cpufreq_governor_dbs+0x6a2/0x710
[344746.428253]  [<ffffffff8148f559>] ? mutex_lock+0x9/0x30
[344746.428261]  [<ffffffffa02d600f>] ? 
acpi_processor_ppc_notifier+0xc0/0xc4 [processor]
[344746.428267]  [<ffffffff81495c64>] ? notifier_call_chain+0x44/0x70
[344746.428274]  [<ffffffff81372b84>] ? __cpufreq_governor+0xf4/0x280
[344746.428277]  [<ffffffff81373b59>] ? __cpufreq_set_policy+0x129/0x1f0
[344746.428280]  [<ffffffff81373fa5>] ? store_scaling_governor+0xd5/0x1e0
[344746.428284]  [<ffffffff81373d30>] ? cpufreq_update_policy+0x110/0x110
[344746.428287]  [<ffffffff81373902>] ? store+0x72/0xb0
[344746.428292]  [<ffffffff811deba9>] ? sysfs_write_file+0xb9/0x140
[344746.428297]  [<ffffffff81173113>] ? vfs_write+0xb3/0x1e0
[344746.428301]  [<ffffffff81173b23>] ? SyS_write+0x43/0xa0
[344746.428305]  [<ffffffff81499b39>] ? system_call_fastpath+0x16/0x1b
[344746.428307] ---[ end trace 42394bba698a65fd ]---
[344746.428314] BUG: unable to handle kernel NULL pointer dereference at 
           (null)
[344746.428317] IP: [<ffffffff813760df>] cpufreq_governor_dbs+0x4f/0x710
[344746.428321] PGD 3be4fe067 PUD 35dc6a067 PMD 0
[344746.428325] Oops: 0000 [#1] SMP
[344746.428327] Modules linked in: msr cpufreq_userspace nfsv3 
parport_pc ppdev lp parport bnep rfcomm bluetooth ip6table_filter 
ip6_tables iptable_filter ip_tables x_tables autofs4 tun pci_stub 
vboxpci(O) vboxnetadp(O) vboxnetflt(O) vboxdrv(O) binfmt_misc uinput 
nfsd auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc fuse loop 
joydev hid_generic usbhid hid snd_hda_codec_hdmi x86_pkg_temp_thermal 
snd_hda_codec_realtek snd_hda_intel snd_hda_codec intel_powerclamp 
snd_hwdep coretemp kvm_intel kvm crc32_pclmul nvidia(PO) snd_pcm 
iTCO_wdt iTCO_vendor_support snd_page_alloc crc32c_intel 
ghash_clmulni_intel hp_wmi sparse_keymap evdev rfkill acpi_cpufreq 
processor psmouse snd_seq snd_seq_device snd_timer snd mei_me 
aesni_intel wmi pcspkr i2c_i801 serio_raw aes_x86_64 ablk_helper cryptd 
lrw gf128mul soundcore mei glue_helper lpc_ich mfd_core i2c_core button 
ext4 crc16 mbcache jbd2 sg sd_mod sr_mod crc_t10dif crct10dif_common 
cdrom xhci_hcd ahci libahci ehci_pci ehci_hcd libata scsi_mod e1000e 
usbcore usb_common ptp pps_core thermal fan thermal_sys
[344746.428386] CPU: 7 PID: 1882 Comm: tee Tainted: P        W  O 
3.12-1-amd64 #1 Debian 3.12.6-2
[344746.428388] Hardware name: Hewlett-Packard HP Z220 CMT 
Workstation/1790, BIOS K51 v01.14 09/27/2012
[344746.428390] task: ffff8803a3f03080 ti: ffff88033449c000 task.ti: 
ffff88033449c000
[344746.428391] RIP: 0010:[<ffffffff813760df>]  [<ffffffff813760df>] 
cpufreq_governor_dbs+0x4f/0x710
[344746.428395] RSP: 0018:ffff88033449dc50  EFLAGS: 00010293
[344746.428397] RAX: 0000000000000024 RBX: 0000000000000000 RCX: 
0000000000000006
[344746.428398] RDX: 0000000000000007 RSI: 0000000000000000 RDI: 
0000000000000009
[344746.428400] RBP: ffff880037046a00 R08: 000000000000000a R09: 
0000000000000376
[344746.428402] R10: 0000000000000000 R11: ffff88033449d986 R12: 
0000000000000007
[344746.428403] R13: 0000000000000002 R14: ffffffff81881fe0 R15: 
ffff88040cba16d8
[344746.428406] FS:  00007f4067ae6700(0000) GS:ffff88041ddc0000(0000) 
knlGS:0000000000000000
[344746.428407] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[344746.428409] CR2: 0000000000000000 CR3: 000000035dc7d000 CR4: 
00000000001407e0
[344746.428411] Stack:
[344746.428412]  ffffffff8148f559 ffff88033449dd00 ffffffffa02d600f 
00000000fffffffe
[344746.428415]  ffffffff81495c64 ffffffff81881be0 0000000000000000 
ffff880037046a00
[344746.428419]  0000000000000002 ffffffff81881d00 ffff8803df64b000 
000000000000000a
[344746.428422] Call Trace:
[344746.428425]  [<ffffffff8148f559>] ? mutex_lock+0x9/0x30
[344746.428432]  [<ffffffffa02d600f>] ? 
acpi_processor_ppc_notifier+0xc0/0xc4 [processor]
[344746.428436]  [<ffffffff81495c64>] ? notifier_call_chain+0x44/0x70
[344746.428440]  [<ffffffff81372b84>] ? __cpufreq_governor+0xf4/0x280
[344746.428443]  [<ffffffff81373b59>] ? __cpufreq_set_policy+0x129/0x1f0
[344746.428446]  [<ffffffff81373fa5>] ? store_scaling_governor+0xd5/0x1e0
[344746.428449]  [<ffffffff81373d30>] ? cpufreq_update_policy+0x110/0x110
[344746.428452]  [<ffffffff81373902>] ? store+0x72/0xb0
[344746.428456]  [<ffffffff811deba9>] ? sysfs_write_file+0xb9/0x140
[344746.428459]  [<ffffffff81173113>] ? vfs_write+0xb3/0x1e0
[344746.428463]  [<ffffffff81173b23>] ? SyS_write+0x43/0xa0
[344746.428466]  [<ffffffff81499b39>] ? system_call_fastpath+0x16/0x1b
[344746.428468] Code: c0 0f 84 55 02 00 00 48 8b 9d b0 00 00 00 48 85 db 
0f 84 4c 06 00 00 41 83 fd 04 0f 84 7b 02 00 00 41 83 fd 05 0f 84 41 02 
00 00 <48> 8b 03 44 89 e7 ff 50 20 48 89 44 24 08 48 8b 03 83 38 01 0f
[344746.428500] RIP  [<ffffffff813760df>] cpufreq_governor_dbs+0x4f/0x710
[344746.428503]  RSP <ffff88033449dc50>
[344746.428504] CR2: 0000000000000000
[344746.428507] ---[ end trace 42394bba698a65fe ]---

Can anyone help with that?

Cheers,

Benoit.
