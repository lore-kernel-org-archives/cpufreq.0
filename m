From: Anatoli Gorchetchnikov <anatoli@cns.bu.edu>
Subject: Re: 2G P4M won't go above 1.2 - cpuinfo_max_freq too low
Date: Tue, 9 Dec 2003 13:13:58 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200312091313.59017.anatoli@cns.bu.edu>
References: <200311261702.56907.simon@highlyillogical.org>
	<3FCF542B.9040703@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3FCF542B.9040703@suse.de>
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

On Thursday 04 December 2003 10:35 am, Thomas Renninger wrote:
> I post a small prog you can mesure your real speed.
> It's called procspeed(think it was part of Carl Thomson's cpufreqd).

I'm not sure it measures a _real_ speed though... I changed sleep(1) statement 
to

int i = 0;
for(; i < 1000000; ++i)
	exp(-pow(i, -3.5));

and added some output lines, 
here are the results:

with AC power on:
2806.402282 MHz processor.
Running time 0.475273 seconds
Runs 1333807266 cycles

with AC off
2806.406065 MHz processor.
Running time 1.297433 seconds
Runs 3641123744 cycles

I strongly suspect that the calculation above takes exactly the same number of 
CPU cycles, therefore this program measures TSC cycles which are _not equal_ 
to CPU cycles. I noticed this problem when running bogomips, TSC version 
reports the same value for AC and battery, while old version reports 3 fold 
difference.

I wonder if this is specific to Sony Vaio with SiS chipset (which according to 
the archives is not going to be hacked in near future) or more general. Just 
in case my cpuinfo:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Pentium(R) 4 CPU 2.80GHz
stepping        : 9
cpu MHz         : 2806.410
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 5596.77


-- 
Regards,

Anatoli
