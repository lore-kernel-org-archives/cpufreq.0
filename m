From: Janpieter Sollie <janpieter.sollie@UGent.be>
Subject: PROBLEM: Amd powernow lowest freqency (athlon 4 1500+ palomino core)
 2.6.16-7
Date: Sun, 21 May 2006 19:47:39 +0000
Message-ID: <4470C3DB.1020109@UGent.be>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Sir / mrs,

I think there is a bug in the cpufreq driver for powernow.

here's the system setup as described by /scripts/ver_linux:
---------------------------------------------------------------------------------------------------
Linux portablejp 2.6.16-gentoo-r7 #2 Fri May 19 17:29:06 Local time zone 
must be set--see zic manu i686 mobile AMD Athlon(tm) 4 1500+ Processor 
AuthenticAMD GNU/Linux

Gnu C                  3.3.5-20050130
Gnu make               3.80
binutils               2.16.1
util-linux             2.12r
mount                  2.12r
module-init-tools      3.0
e2fsprogs              1.38
reiserfsprogs          line
reiser4progs           line
pcmcia-cs              3.2.8
PPP                    2.4.2
Linux C Library        2.3.4
Dynamic linker (ldd)   2.3.4
Procps                 3.2.5
Net-tools              1.60
Kbd                    1.12
Sh-utils               5.2.1
udev                   058
Modules Loaded         r8169 parport_pc lp snd_pcm_oss snd_mixer_oss 
snd_seq_oss snd_seq_midi_event snd_seq snd_via82xx snd_ac97_codec 
snd_ac97_bus snd_pcm snd_timer snd_page_alloc snd_mpu401_uart 
snd_rawmidi snd_seq_device snd soundcore cifs evdev autofs4 genrtc dummy 
via_rhine libcrc32c yenta_socket rsrc_nonstatic parport pcmcia 
pcmcia_core ntfs usbhid usb_storage uhci_hcd ohci_hcd usbcore 
firmware_class md5 des deflate zlib_deflate zlib_inflate
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Problem description:
The driver reports following frequencies:
(cpy&paste from /sys/../cpufreq/scaling_available_frequencies)
300069 700161 800184 900207 1000230 1100253 1300299
The 300069 setting causes the system to hang immediately.
Symptoms:
echo 300069 > /sys/../cpufreq/scaling_setspeeds causes the system to 
hang (with userspace as governor ofc)
the governor powersave causes the system to hang
the governor conservative crashes sometimes during very idle periods.

I hope this report was helpful,

greetings,

Janpieter Sollie
