From: olgaAr <olgaAr@fuckup.homelinux.com>
Subject: Help! Cpufreq makes my laptop crash!
Date: Wed, 14 Jul 2004 16:57:25 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40F549D5.8030100@fuckup.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hello all,

I hope someone out there can help me with my problem which I've been
playing around for quite some time now:
I have enabled cpufreq and powernow support in my 2.6.7-gentoo-r6
kernel, and everything works fine so far. I can manually switch between
different CPU frequencies, my battery all of a sudden lasts longer than
50 minutes, and I'm happy...
After some time, however, the system will simply freeze! It can't even
be pinged from outside any longer! The log files also don't give a hint
about what might cause the lockups. If, however I tell cpufreq to run my
cpu at maximum frequency, it runs fine for hours. So what's the deal?
What causes my lappie to crash when trying to save power?

cpuinfo says this:
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 8
model name      : mobile AMD Athlon(tm) XP 1800+
stepping        : 0
cpu MHz         : 1526.282
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
cmov pat p
se36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips        : 3006.46

and here's lspci, just in case:
0000:00:00.0 Host bridge: VIA Technologies, Inc. P/KN266 Host Bridge
0000:00:01.0 PCI bridge: VIA Technologies, Inc. VT8633 [Apollo Pro266 AGP]
0000:00:09.0 CardBus bridge: ENE Technology Inc CB1410 Cardbus Controller
0000:00:0a.0 Network controller: Intel Corp.: Unknown device 1043 (rev 04)
0000:00:0b.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394 Host
Controller (rev 80)
0000:00:10.0 USB Controller: VIA Technologies, Inc. USB (rev 80)
0000:00:10.1 USB Controller: VIA Technologies, Inc. USB (rev 80)
0000:00:10.3 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 82)
0000:00:11.0 ISA bridge: VIA Technologies, Inc. VT8235 ISA Bridge
0000:00:11.1 IDE interface: VIA Technologies, Inc. VT82C586/B/686A/B
PIPC Bus Master IDE (rev 06)
0000:00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233
AC97 Audio Controller (rev 50)
0000:00:11.6 Communication controller: VIA Technologies, Inc. Intel 537
[AC97 Modem] (rev 80)
0000:00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102
[Rhine-II] (rev 74)
0000:01:00.0 VGA compatible controller: S3 Inc. VT8751 [ProSavageDDR
P4M266] VGA Controller

Sorry for the lengty mail, I just wanted to provide all details needed
in advance.

Thank you very much in advance!
Oliver Gmelch
