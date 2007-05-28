From: Muskat Nuss <muskatnuss@gmx.at>
Subject: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change Frequency!
Date: Mon, 28 May 2007 21:12:44 +0200
Message-ID: <1180379564.5763.8.camel@Tux-Devil>
Reply-To: muskatnuss@gmx.at
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

So, im sorry for my last mail...
don read your mail correctly.

but nowaday after reading many How-to's and tutorial's about compiling 
own kernel in ubuntu i managed my own kernel to work =)
so sorry again that i donot understand what you meant!

now my kernel got that module cpufreq debubugging within it!
now i got that output from dmesg | grep power
:
[   56.286434] powernow-k8: Found 2 AMD Turion(tm) 64 X2 Mobile
Technology TL-52 processors (version 2.00.00)
[   56.286449] powernow-k8:    0 : fid 0x8, vid 0x13
[   56.286455] powernow-k8:    1 : fid 0x0, vid 0x1e
[   56.286459] powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x13
[   56.286462] powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x1e
[   56.286467] powernow-k8: cpu0, init lo 0x1308, hi 0x1
[   56.286471] powernow-k8: policy current frequency 1600000 kHz
[   56.286475] powernow-k8: cpu_init done, current fid 0x8, vid 0x13
[   56.286520] powernow-k8: targ: cpu 0, 800000 kHz, min 800000, max
800000, relation 1
[   56.286524] powernow-k8: targ: curr fid 0x8, vid 0x13
[   56.286527] powernow-k8: cpu 0 transition to index 1
[   56.286530] powernow-k8: table matched fid 0x0, giving vid 0x1e
[   56.286533] powernow-k8: cpu 0, changing to fid 0x0, vid 0x1e
[   56.286539] powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid
0x13, reqvid 0x1e, rvo 0x2
[   56.286543] powernow-k8: ph1 maxvid=0x11
[   56.286546] powernow-k8: ph1 complete, currfid 0x8, currvid 0x13
[   56.286549] powernow-k8: ph2 (cpu0): starting, currfid 0x8, currvid
0x13, reqfid 0x0
[   56.286554] powernow-k8: writing fid 0x0, lo 0x11300, hi 0x258
[   56.300255] powernow-k8: ph2 complete, currfid 0x0, currvid 0x13
[   56.300258] powernow-k8: ph3 (cpu0): starting, currfid 0x0, currvid
0x13
[   56.300262] powernow-k8: writing vid 0x1e, lo 0x11e00, hi 0x1
[   56.300265] powernow-k8: ph3 complete, currfid 0x0, currvid 0x1e
[   56.300269] powernow-k8: transitioned (cpu0): new fid 0x0, vid 0x1e
[   56.300275] powernow-k8: targ: cpu 0, 800000 kHz, min 800000, max
800000, relation 1
[   56.300278] powernow-k8: targ: curr fid 0x0, vid 0x1e
[   56.300281] powernow-k8: cpu 0 transition to index 1
[   56.300284] powernow-k8: table matched fid 0x0, giving vid 0x1e
[   56.300287] powernow-k8: target matches current values (fid 0x0, vid
0x1e)
[   59.119526] powernow-k8: targ: cpu 0, 800000 kHz, min 800000, max
800000, relation 1
[   59.119534] powernow-k8: targ: curr fid 0x0, vid 0x1e
[   59.119539] powernow-k8: cpu 0 transition to index 1
[   59.119542] powernow-k8: table matched fid 0x0, giving vid 0x1e
[   59.119545] powernow-k8: target matches current values (fid 0x0, vid
0x1e)

so far... looks like i can only get 800 MHz ...
