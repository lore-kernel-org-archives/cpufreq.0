From: =?utf-8?q?Micha=C5=82_Pytasz?= <mpytasz@pai.net.pl>
Subject: powernow-k8 problem (Mobile Sempron 2800+, Acer Aspire 1362)
Date: Mon, 15 Nov 2004 17:06:33 +0000
Message-ID: <200411151706.33410.mpytasz@pai.net.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="macroman"
To: cpufreq@www.linux.org.uk

Hello,

I'm sorry, in previous e-mail I have attached too short part of log (Having=
=20
had compiled debug enabled module powernow-k8).

On modprobe I get:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09e)
powernow-k8:    0 : fid 0x8, vid 0x6
powernow-k8:    1 : fid 0x0, vid 0x18
powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
powernow-k8: cpu0, init lo 0x408, hi 0x1
powernow-k8: policy current frequency 1600000 kHz
powernow-k8: cpu_init done, current fid 0x8, vid 0x4
powernow-k8: targ: cpu 0, 1600000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed

when powernowd starts it is followed by:

owernow-k8: targ: cpu 0, 1500000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 1400000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 1300000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 1200000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 1100000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 1000000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 900000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, rvo 0=
x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 800000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x4
powernow-k8: cpu 0 transition to index 1
powernow-k8: table matched fid 0x0, giving vid 0x18
powernow-k8: cpu 0, changing to fid 0x0, vid 0x18
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x18, rvo =
0x2
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed

All suggestions on making it work are welcome,
Thanks in advance,
Micha=C5=82

P.S.=20
1. Well, IMHO frequencies are read properly, it is a problem of VID, I can'=
t=20
figure out why writting 0x3 is attempted... (since above I see propper=20
values, I guess...)
2. Above conditions occured in linux gentoo, kernel 2.6.9 as well as=20
2.6.10-rc1 (plain as well as patched by gentoo), Acer Aspire1362 laptop.=20
gcc 3.4.3, PowerNow Daemon v0.90hun6
