From: Simon <simon@highlyillogical.org>
Subject: 2G P4M won't go above 1.2 - cpuinfo_max_freq too low
Date: Wed, 26 Nov 2003 17:02:56 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200311261702.56907.simon@highlyillogical.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

Hope I should be posting this here and not on linux-kernel...

I've just upgraded to 2.6.0-test10 and am trying to use the new cpufreq stuff 
in there. I had everything working perfectly with 2.4.21-ac2, and the old 
/proc/cpufreq interface.

I have a P4 2ghz, but it's not running at over about 1.2ghz here now. If I 
`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq` it tells me: 
"1198976". It should go faster than that. Similarly, 
scaling_available_frequencies says "149872 299744 449616 599488 749360 899232 
1049104 1198976"

Enabling the old interface in the kernel and doing a `echo -n 
0%0%100%performance > /proc/cpufreq` doesn't change things either.

Here is my /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 2.00GHz
stepping        : 7
cpu MHz         : 1198.976
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat 
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 2359.29

Any ideas how to get hold of my extra mhz?

Cheers,
Simon
