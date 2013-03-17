From: Bruce Dawson <bruced@valvesoftware.com>
Subject: CPU power management bug -- CPU bound task fails to raise CPU
 frequency
Date: Sun, 17 Mar 2013 01:07:24 +0000
Message-ID: <2AC155A009400B4C8B05D518E4819AEF071D2E6B@exchange10.valvesoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Dave Jones <davej@redhat.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Dave/others, I've come up with a simple (and real) scenario where a CPU bound task running on Ubuntu (and presumably other Linux flavors) fails to be detected as CPU bound by the Linux kernel, meaning that the CPU continues to run at low speed, meaning that this CPU bound task takes (on my machines) about three times longer to run than it should.

I found these e-mail addresses in the MAINTAINERS list under CPU FREQUENCY DRIVERS which I'm hoping is the correct area.

The basic problem is that on a multi-core system if you run a shell script that spawns lots of sub processes then the workload ends up distributed across all of the CPUs. Therefore, since none of the CPUs are particularly busy, the Linux kernel doesn't realize that a CPU bound task is running, so it leaves the CPU frequency set to low. I have confirmed the behavior in multiple ways. Specifically, I have used "iostat 1" and "mpstat -P ALL 1" to confirm that a full core's worth of CPU work is being done. mpstat also showed that the work was distributed across multiple cores. Using the zoom profiler UI for perf showed the sub processes (and bash) being spread across multiple cores, and perf stat showed that the CPU frequency was staying low even though the task was CPU bound.

I have only reproed this behavior on six-core/twelve-thread systems. I would assume that at least a two-core system would be needed to repro this bug, and perhaps more. The bug will not repro if the system is not relatively idle, since a background CPU hog will force the frequency up.

The repro is exquisitely simple -- ExprCount() is a simplified version of the repro (portable looping in a shell script) and BashCount() is an optimized and less portable version that runs far faster and also avoids this power management problem -- the CPU frequency is raised appropriately. Running a busy loop in another process is another way to get the frequency up and this makes ExprCount() run ~3x faster. Here is the script:

--------------------------------------
#!/bin/bash
function ExprCount() {
	i=$1
	while [ $i -gt 0 ]; do
		i=$(expr $i - 1)
	done
	echo Just did $1 iterations using expr math
}

function BashCount() {
	i=$1
	while [ $i -gt 0 ]; do
		(( i-- ))
	done
	echo Just did $1 iterations using bash math
}

time ExprCount 1000
time BashCount 150000
--------------------------------------

The ExprCount function demonstrates the problem. The BashCount function demonstrates expected power management behavior -- it raises the CPU's frequency.

Here is the output of ver_linux on one of my test machines. Note that I have also run this on a 64-bit 3.5 kernel but I don't have that machine handy at this moment.

$ sh /data/kernel/source/linux-3.2.0/scripts/ver_linux
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
 
Linux brucedglados2 3.2.0-38-generic-pae #60-Ubuntu SMP Wed Feb 13 13:47:26 UTC 2013 i686 i686 i386 GNU/Linux
 
Gnu C                  4.6
Gnu make               3.81
binutils               2.22
util-linux             2.20.1
mount                  support
module-init-tools      3.16
e2fsprogs              1.42
pcmciautils            018
PPP                    2.4.5
Linux C Library        2.15
Dynamic linker (ldd)   2.15
Procps                 3.2.8
Net-tools              1.60
Kbd                    1.15.2
Sh-utils               8.13
wireless-tools         30
Modules Loaded         des_generic md4 nls_utf8 cifs bnep rfcomm bluetooth parport_pc ppdev nfsd nfs lockd fscache auth_rpcgss nfs_acl binfmt_misc sunrpc snd_hda_codec_hdmi snd_hda_codec_realtek nvidia joydev snd_hda_intel snd_hda_codec hid_microsoft snd_hwdep snd_pcm snd_seq_midi snd_rawmidi usbhid snd_seq_midi_event eeepc_wmi hid psmouse snd_seq asus_wmi snd_timer serio_raw sparse_keymap snd_seq_device mxm_wmi snd soundcore snd_page_alloc mei mac_hid wmi lp parport firewire_ohci firewire_core crc_itu_t e1000e
