From: Matt Wright <matt@consultmatt.co.uk>
Subject: Cpufreq and AMD mobile Athlon 4
Date: 02 Sep 2003 12:02:30 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1062500550.5141.3.camel@riogrande>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi guys,

I've just tried the cpufreq modules that come with 2.4.21-ac1 and I'm
having no luck getting them to work. I have a Compaq mx9005 based on the
mobile Athlon 4 (2400+). When I load the powernow-k7 module I get the
following:

powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and
voltage.
powernow: Found PSB header at c00f18c0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 14 PST tables. (Only dumping ones relevant to this CPU).

Nothing else, it doesn't seem to dump and PST tables (as other examples
I've seen show the driver reporting extra info about the CPU).

If I execute the following command:

echo "5000000:17000000:performance" > /proc/cpufreq

Then the module panics and I get the following in dmesg

Unable to handle kernel NULL pointer dereference at virtual address
00000004
 printing eip:
c019423c
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c019423c>]    Not tainted
EFLAGS: 00010246
eax: 00000000   ebx: c0c45f10   ecx: 00000000   edx: 00000000
esi: 00000000   edi: ffffffff   ebp: 00000000   esp: c0c45ebc
ds: 0018   es: 0018   ss: 0018
Process bash (pid: 4881, stackpage=c0c45000)
Stack: 00000000 c02a2ee0 c0c45f10 c0c45f40 c0c45f10 ccd157e8 c0c45f10
00000000
       c012860e c0c45f10 c34767d8 0000000c 400153f0 0000001d 00000000
c0c45f40
       c0c45f10 c0194838 c0c45f10 c0c45f10 0000001d 00000000 00000000
00000000
Call Trace:    [<ccd157e8>] [<c012860e>] [<c0194838>] [<c015dce0>]
[<c013c1d3>]
  [<c0108dc7>]
 
Code: 8b 45 04 31 c9 83 f8 fe 74 1b 83 f8 ff 74 0c 3b 43 04 72 5a

Do I need to add some kind of processor defintion? If so how do I do it?

Regards,

Matt
