From: Scott Russ <scott@linuxjihad.com>
Subject: VIA C3 problems
Date: Tue, 16 Sep 2003 03:40:52 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030916104052.53283.qmail@web13504.mail.yahoo.com>
Reply-To: scott@linuxjihad.com
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I am having problems with using cpufreq.  I used to use it fine and just
recently tried applying it again.  I am using 2.4.22 with the CK-2 patches
(http://members.optusnet.com.au/ckolivas/kernel/).

When I modprobe longhaul I get a kernel oops and lsmod shows longhaul as still
initalizing and I can't rmmod.  I also tried the 2.4.22-ac2 patch which
includes cpufreq with the same results.  Any suggestions?

longhaul: VIA CPU detected. Longhaul version 2 supported
longhaul: MinMult(x10)=30 MaxMult(x10)=60
longhaul: Lowestspeed=0 Highestspeed=0
longhaul: FSB:0 Mult(x10):100
divide error: 0000
CPU:    0
EIP:    0010:[<c010c533>]    Not tainted
EFLAGS: 00010246
eax: 0051e9fe   ebx: 00001f2c   ecx: 0051e9fe edx: 00000000
esi: 00000000   edi: 00000000   ebp: 00000000 esp: dde65da8
ds: 0018   es: 0018   ss: 0018
Process insmod (pid: 227, stackpage=dde65000)
Stack: c022f0b0 dde65e38 00000001 c0238804 00000000 c0120f4a c022f0b0 00000001
       dde65e38 00000000 00000000 dde65e38 c01b37e0 c02a65ac 00000001 dde65e38
       0000000b 00000000 0000110a dde65e44 00001f2c e01c1411 dde65e38 00000001
Call Trace:    [<c0120f4a>] [<c01b37e0>] [<e01c1411>] [<e01c1878>] [<c01b3222>]
  [<c01b32cd>] [<c01b369b>] [<c01b3037>] [<c01b3880>] [<e01c19f4>] [<e01c2240>]
  [<c0118491>] [<e01c1060>] [<c0106d33>]
Sep 13 03:35:13 legends kernel:
Code: f7 f7 89 c1 89 d6 0f af cb 0f af f3 89 f0 31 d2 f7 f7 01 c8
