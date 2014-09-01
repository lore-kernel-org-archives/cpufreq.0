From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 83701] New: divide error 0000 in intel_pstate_set_pstate
Date: Mon, 01 Sep 2014 21:15:01 +0000
Message-ID: <bug-83701-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=83701

            Bug ID: 83701
           Summary: divide error 0000 in intel_pstate_set_pstate
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.14.6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: gdm85@iragan.org
        Regression: No

Created attachment 148991
  --> https://bugzilla.kernel.org/attachment.cgi?id=148991&action=edit
photo of terminal with divide error: 0000 kernel panic

I left this Arch Linux NAS running for about 20 days and all of a sudden it
died; I checked the terminal window today and found kernel panic in attachment.
By searching online I found a bug report for same kernel panic that is
mistakenly attributed to VirtualBox (https://www.virtualbox.org/ticket/12070),
however I am running on bare metal here (Intel i3-4340).

Never seen this before and I am afraid it will be a bit difficult to trigger it
again; I wanted to contribute with this bug report as I thought it is a rare
kernel panic.

Sorry for the bad quality of the screenshot, it's the best I could do as I
don't normally connect a serial tty to this box. A section of photo (related to
modules) was removed because of the flash flare. If it can be of help, these
are the modules currently loaded (and there's no reason to suspect they would
be any different at time of incident):

ext4 crc16 mbcache jbd2 snd_hda_codec_hdmi fuse nls_iso8859_1 nls_cp437 vfat
fat coretemp hwmon joydev mousedev x86_pkg_temp_thermal intel_powerclamp
kvm_intel iTCO_wdt i915 iTCO_vendor_support evdev mac_hid kvm
snd_hda_codec_realtek psmouse snd_hda_codec_generic microcode serio_raw pcspkr
i2c_i801 drm_kms_helper tpm_tis alx tpm snd_hda_intel mdio drm snd_hda_codec
snd_hwdep battery nuvoton_cir snd_pcm intel_gtt rc_core i2c_algo_bit snd_timer
lpc_ich i2c_core video snd shpchp soundcore mei_me button mei processor xpad
ff_memless led_class nfs lockd sunrpc fscache loop dm_crypt hid_logitech_dj
sd_mod crc_t10dif hid_generic usbhid hid atkbd libps2 ahci libahci libata
crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel ghash_clmulni_intel
aesni_intel aes_x86_64 lrw gf128mul glue_helper ablk_helper cryptd ehci_pci
xhci_hcd ehci_hcd scsi_mod usbcore usb_common i8042 serio crc32c btrfs raid6_pq
xor dm_mod

-- 
You are receiving this mail because:
You are the assignee for the bug.
