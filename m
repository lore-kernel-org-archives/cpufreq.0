From: "Oliver M. Bolzer" <oliver@fakeroot.net>
Subject: powernow-k8: Two PSTs
Date: Thu, 9 Sep 2004 00:39:56 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040908223956.GA1731@magi.fakeroot.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi!

At work we recently got about 80 new Athlon64 PCs (Fujitsu-Siemens
Scenic P320, VIA K8M800, Athlon64 3200+ 512KB L2, newest BIOS Rev 1.02
dated 2004-07-14) and I'm experimenting with cpufreq to even further
lower the heat generated and power consumption, one of the main reasons why
we chose Athlon64s in the first place.

At first, powernow-k8 wouldn't load because the number of PSTs was != 1
(actually 2) but after simply commenting out the numpst check, everything
worked as advertised.

vanilla 2.6.8.1:
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8: BIOS error: numpst must be 1

with hack (and DEBUG defined):
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8: found PSB header at 0x00000100000f0d80
powernow-k8: table vers: 0x14
powernow-k8: flags: 0x0
powernow-k8: voltage stabilization time: 5(*20us)
powernow-k8: flags2: 0xe
powernow-k8: ramp voltage offset: 2
powernow-k8: isochronous relief time: 3
powernow-k8: maximum voltage step: 0 - 0x1
powernow-k8: numpst: 0x2
powernow-k8: plllocktime: 0x2 (units 1us)
powernow-k8: maxfid: 0xe
powernow-k8: maxvid: 0x0
powernow-k8: numpstates: 0x4
powernow-k8: cfid 0xe, cvid 0x0
powernow-k8:    0 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8:    1 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
powernow-k8:    3 : fid 0xe (2200 MHz), vid 0x2 (1500 mV)
powernow-k8: currfid/vid do not match PST, ignoring
powernow-k8: cpu0, init lo 0xe, hi 0x1
powernow-k8: policy current frequency 2200000 kHz
powernow-k8: cpu_init done, current fid 0xe, vid 0x0
powernow-k8: targ: cpu 0, 2200000 kHz, min 1000000, max 2200000, relation 1
powernow-k8: targ: curr fid 0xe, vid 0x0
powernow-k8: cpu 0 transition to index 3
powernow-k8: table matched fid 0xe, giving vid 0x2
powernow-k8: cpu 0, changing to fid 0xe, vid 0x2
powernow-k8: ph1 (cpu0): start, currfid 0xe, currvid 0x0, reqvid 0x2, rvo 0x2
powernow-k8: ph1 complete, currfid 0xe, currvid 0x0
powernow-k8: ph1 complete, currfid 0xe, currvid 0x0
powernow-k8: ph2 null fid transition 0xe
powernow-k8: ph3 (cpu0): starting, currfid 0xe, currvid 0x0
powernow-k8: writing vid 0x2, lo 0x1020e, hi 0x1
powernow-k8: ph3 complete, currfid 0xe, currvid 0x2
powernow-k8: transitioned (cpu0): new fid 0xe, vid 0x2

frequency change to 1GHz works according to bogomips(1), actual benchmarking
and CPU temperature.

Why ACPI isn't used, I havn't checked yet, but it's probably because
the ACPI tables don't seem to be containing anything useful.

mana:/tmp# uname -a
Linux mana 2.6.8.1 #6 Wed Sep 8 23:33:18 CEST 2004 x86_64 GNU/Linux
mana:/tmp# cat /proc/acpi/info                
version:                 20040326
mana:/tmp# cat /proc/acpi/processor/CPU1/info 
processor id:            0
acpi id:                 1
bus mastering control:   no
power management:        no
throttling control:      no
limit interface:         no

BIOS is set to ACPI 2.0 and Cool'N'Quiet enabled.

After subscribing to the list and looking at the archive, I found Mark
Langsdorf's patch and explanation for my problem.
(http://www.linux.org.uk/mailman/private/cpufreq/2004-August/004191.html) 
It's unfortunate that the archive isn't public but the patch worked perfectly.
Is there any chance for this or a similar patch to be submitted for inclusion
into the mainline kernel ? 

-- 
	Oliver M. Bolzer

GPG (PGP) Fingerprint = 621B 52F6 2AC1 36DB 8761  018F 8786 87AD EF50 D1FF
