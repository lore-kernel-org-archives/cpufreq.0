From: =?utf-8?q?Micha=C5=82_Pytasz?= <mpytasz@pai.net.pl>
Subject: Re: Can you please try this powernow-k8.c patch ?
Date: Tue, 16 Nov 2004 17:53:11 +0000
Message-ID: <200411161753.11367.mpytasz@pai.net.pl>
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

Thanks for the patch, I tried it, here is the rssult:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09e)
powernow-k8:    0 : fid 0x8, vid 0x6
powernow-k8:    1 : fid 0x0, vid 0x18
powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
powernow-k8: cpu0, init lo 0x608, hi 0x1
powernow-k8: policy current frequency 1600000 kHz
powernow-k8: cpu_init done, current fid 0x8, vid 0x6
powernow-k8: targ: cpu 0, 1600000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 1500000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 1400000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 1300000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 1200000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 1100000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 1000000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 900000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x8, giving vid 0x6
powernow-k8: target matches current values (fid 0x8, vid 0x6)
powernow-k8: targ: cpu 0, 800000 kHz, min 800000, max 1600000, relation 0
powernow-k8: targ: curr fid 0x8, vid 0x6
powernow-k8: cpu 0 transition to index 1
powernow-k8: table matched fid 0x0, giving vid 0x18
powernow-k8: cpu 0, changing to fid 0x0, vid 0x18
powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x6, reqvid 0x18, rvo =
0x2
powernow-k8: ph1 complete, currfid 0x8, currvid 0x6
powernow-k8: ph2 (cpu0): starting, currfid 0x8, currvid 0x6, reqfid 0x0
powernow-k8: writing fid 0x0, lo 0x10600, hi 0x190
powernow-k8: ph2 complete, currfid 0x0, currvid 0x6
powernow-k8: ph3 (cpu0): starting, currfid 0x0, currvid 0x6
powernow-k8: writing vid 0x18, lo 0x11800, hi 0x1
powernow-k8: ph3 complete, currfid 0x0, currvid 0x18
powernow-k8: transitioned (cpu0): new fid 0x0, vid 0x18

Well, it seems to have done the trick for the frequency,
Thanks very much,=20

Also I can see in /sys/devices/system/cpu/cpu0/cpufreq a changed value of=20
frequency, is it possible to see if voltage changes as well? Looking at the=
=20
log provided, I see, that only frequency seems to be changing (although I=20
finally seem to get cooler CPU, I can hear the fan reducing RPM, sometimes=
=20
turning off at all :))

Micha=C5=82
