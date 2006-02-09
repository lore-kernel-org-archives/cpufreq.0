From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6034] New: powernow-k8 fails to load on AMD Mobile Sempron
	3000+ system
Date: Thu, 9 Feb 2006 00:40:28 -0800
Message-ID: <200602090840.k198eSin013009@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6034

           Summary: powernow-k8 fails to load on AMD Mobile Sempron 3000+
                    system
    Kernel Version: 2.6.15.2
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: e_val@inbox.ru


Most recent kernel where this bug did not occur: 2.6.13 (sure) or 2.6.14 (not
100% sure)

Distribution: Arch Linux 0.7.1

Hardware Environment: Laptop: AMD Mobile Sempron 3000+ / 512Mb RAM / VIA K8N800
Video Adapter (Built-in) / SAMSUNG MP0402H 30Gb HDD / UJDA 760 ATAPI DVD/CDRW /
Via Rhine Ethernet Adapter (Built-in) / Intel 2200 BG Wi-Fi Adapter (Mini PC)

Software Environment: ver_linux output is the following:
--------------------------------------------------------
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
 
Linux laptop 2.6.15.2-CUSTOM #7 SMP PREEMPT Thu Feb 9 12:59:49 YEKT 2006 i686
Mobile AMD Sempron(tm) Processor 3000+ AuthenticAMD GNU/Linux
 
Gnu C                  4.0.3
Gnu make               3.80
binutils               2.16.1
util-linux             2.12r
mount                  2.12r
module-init-tools      3.2.2
e2fsprogs              1.38
jfsutils               1.1.10
reiserfsprogs          3.6.19
reiser4progs           line
PPP                    2.4.3
Linux C Library        2.3.5
Dynamic linker (ldd)   2.3.5
Linux C++ Library      6.0.7
Procps                 3.2.6
Net-tools              1.60
Kbd                    1.12
Sh-utils               5.2.1
udev                   079
Modules Loaded         nls_cp866 vfat fat isofs zlib_inflate nls_koi8_r udf
freq_table uhci_hcd ehci_hcd usbhid usblp usb_storage pcmcia yenta_socket
rsrc_nonstatic pcmcia_core ipw2200 ieee80211 ieee80211_crypt via_rhine mii
via_ircc irda snd_via82xx snd_via82xx_modem snd_ac97_codec snd_ac97_bus
snd_mpu401_uart snd_rawmidi snd_seq_oss snd_seq_midi_event snd_seq
snd_seq_device snd_pcm_oss snd_pcm snd_timer snd_page_alloc snd_mixer_oss snd
soundcore crc_ccitt pcspkr gameport evdev i2c_viapro i2c_core rtc amd64_agp
agpgart usbcore xfs reiserfs jfs ext3 jbd qlogicfas408 sr_mod sg
scsi_transport_sas sd_mod ide_cd cdrom ide_disk via82cxxx generic ide_core
--------------------------------------------------------
Problem Description:
Module powernow-k8 fails to load with the following error message:
[root@laptop ~]# modprobe powernow-k8
FATAL: Error inserting powernow_k8
(/lib/modules/2.6.15.2-CUSTOM/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k8.ko):
No such device

With cpufreq.debug=2, dmesg indicates the following error:
----------------------------------------------------------
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.50.4)
powernow-k8: register performance failed: bad ACPI data
powernow-k8: found PSB header at 0xc00f1200
powernow-k8: table vers: 0x14
powernow-k8: flags: 0x0
powernow-k8: voltage stabilization time: 5(*20us)
powernow-k8: flags2: 0x4e
powernow-k8: ramp voltage offset: 2
powernow-k8: isochronous relief time: 3
powernow-k8: maximum voltage step: 0 - 0x1
powernow-k8: numpst: 0x33
powernow-k8: BIOS error: numpst must be 1
--------------------------------------------------------
There is also two-line error report in system-wide messages.log:
Feb  9 13:13:00 laptop powernow-k8: Found 1 AMD Athlon 64 / Opteron processors
(version 1.50.4)
Feb  9 13:13:00 laptop ACPI-0508: *** Error: Method execution failed
[\_PR_.CPU0._PSS] (Node c14c9d00), AE_AML_PACKAGE_LIMIT

The problem does not seem to depend on kernel config or loaded modules list
(I've tried several variants with no luck) but in case it will be useful my
current config.gz is attached to the report.

Steps to reproduce: 
Enter `modprobe powernow-k8` command and watch the output.
Expected results: Module powernow-k8 successfully loads
Actual results: -ENODEV error is returned.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
