From: Alaios <alaios@yahoo.com>
Subject: Pentium III ( Coppermine)
Date: Sat, 11 Jun 2005 21:15:16 -0700 (PDT)
Message-ID: <20050612041516.43517.qmail@web54709.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk, alaios@yahoo.com

HI :)
I try to make the cpufreq to work with my Pentium III
Coppermine and that what i have done up to now
My cpu is
ctaksideytis:/usr/src/linux-2.6.9# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 1
cpu MHz         : 448.304
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8
sep mtrr pge mca cmov pat pse36 mmx fxsr sse
bogomips        : 878.59





I use the 2.6.9 kernel and i have enabled the
following  options
CPU frequency scaling
Cpu frequency table helpers
Intel Speedstep on ICH-M chipsets (ioport interface)
Intel Speedsetp on 440BX/ZX/MX chipsets (SMI
INTERFACE)
Relaxed speedstep capability check


Especially i have slected the 2 intel speedstep
because the help files gives information about the
Pentium III coppermine.....

After recompiling the kernel i couldnt find cpufreq so
i need your help.. U have to examine if i have done
sth wrong os i have forhooten sth or my cpou is not
supoorted

Also my system bus is
0000:00:01.0 PCI bridge: Intel Corp. 440BX/ZX/DX -
82443BX/ZX/DX AGP bridge (rev  03) (prog-if 00 [Normal
decode])
        Flags: bus master, 66MHz, medium devsel,
latency 128
        Bus: primary=00, secondary=01, subordinate=01,
sec-latency=64
        I/O behind bridge: 0000e000-0000efff
        Memory behind bridge: fd000000-fecfffff
I think that u have to look to the 
Intel Speedsetp on 440BX/ZX/MX chipsets (SMI
INTERFACE)
option because i think that there u can find info
about my bus...

I think that the provided info is enough... I need
your suggestions for my lovely laptop
Have a nice daya


		
__________________________________ 
Discover Yahoo! 
Get on-the-go sports scores, stock quotes, news and more. Check it out! 
http://discover.yahoo.com/mobile.html
