From: Matt Wright <matt@consultmatt.co.uk>
Subject: Driver segfault on mobile Athlon 4
Date: Wed, 30 Jul 2003 14:21:49 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307301421.33327.matt@consultmatt.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

I've just bought a new laptop, an HP Compaq nx9005. After noticing a 
difference in processing power in XP when I had it plugged in or not I looked 
up the processor. The laptop has a "mobile AMD Athlon(tm) 4 2400+" (straight 
out of /proc/cpuinfo) and according to AMD's website the Athlon 4's have 
PowerNow!

So I patched my 2.4.21 kernel with the cpufreq patches from codemonkey.org.uk 
and selected the K7 driver and the userspace access. Everything is fine and 
when I load the powernow-k7 module I get the following:

Jul 30 13:36:44 riogrande kernel: powernow: AMD K7 CPU detected.
Jul 30 13:36:44 riogrande kernel: powernow: PowerNOW! Technology present. Can 
scale: frequency and voltage.
Jul 30 13:36:44 riogrande kernel: powernow: Found PSB header at c00f18c0
Jul 30 13:36:44 riogrande kernel: powernow: Table version: 0x12
Jul 30 13:36:44 riogrande kernel: powernow: Flags: 0x0 (Mobile voltage 
regulator)
Jul 30 13:36:44 riogrande kernel: powernow: Settling Time: 100 microseconds.
Jul 30 13:36:44 riogrande kernel: powernow: Has 14 PST tables. (Only dumping 
ones relevant to this CPU).

I noticed that it doesn't actually display a PST table which worried me first. 
Secondly I tried the following:

echo "500000:1700000:powersave" > /proc/cpufreq

Then the module segfaults the following:

Jul 30 13:38:59 riogrande kernel:  printing eip:
Jul 30 13:38:59 riogrande kernel: c01dc933
Jul 30 13:38:59 riogrande kernel: Oops: 0000
Jul 30 13:38:59 riogrande kernel: CPU:    0
Jul 30 13:38:59 riogrande kernel: EIP:    0010:[<c01dc933>]    Not tainted
Jul 30 13:38:59 riogrande kernel: EFLAGS: 00010246
Jul 30 13:38:59 riogrande kernel: eax: 00000000   ebx: ffffffff   ecx: 
00000000   edx: ca5adf38
Jul 30 13:38:59 riogrande kernel: esi: 00000000   edi: 00000000   ebp: 
00000019   esp: ca5adee8
Jul 30 13:38:59 riogrande kernel: ds: 0018   es: 0018   ss: 0018
Jul 30 13:38:59 riogrande kernel: ProceJul 30 13:38:59 riogrande kernel:        
00000000 ca5adf38 ca5adf38 00000019 c0363f9c c01dcdc3 c01dcdf6 ca5adf38
Jul 30 13:38:59 riogrande kernel:        00000000 caf75640 ffffffea 00000019 
00000000 00000000 00000000 c3499ac0
Jul 30 13:38:59 riogrande kernel: Call Trace:    [<cd4d4760>] [<c01221f5>] 
[<c01dcdc3>] [<c01dcdf6>] [<c014f4aa>]
Jul 30 13:38:59 riogrande kernel:   [<c0132b96>] [<c0106d03>]
Jul 30 13:38:59 riogrande kernel:
Jul 30 13:38:59 riogrande kernel: Code: 83 7e 04 fe 74 2f 8d b4 26 00 00 00 00 
8b 44 ce 04 83 f8 ff
ss bash (pid: 628, stackpage=ca5ad000)
Jul 30 13:38:59 riogrande kernel: Stack: 00000000 ca5adf38 ca5adf38 cd4d4760 
ca5adf38 00000000 c01221f5 ca5adf38

At that point any access to /proc/cpufreq or trying rmmod powernow-k7 hangs. I 
can't get the console freed until I reboot.

Any ideas guys?

Regards,

Matt
