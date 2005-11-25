From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [powernow-k8] some wrong frequencies on opterons 252,
	howto find them?
Date: Fri, 25 Nov 2005 11:58:59 +0100
Message-ID: <20051125105859.GA8628@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi all,

At work we have some HP DL385 with those processors:

# cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 37
model name      : AMD Opteron(tm) Processor 252
stepping        : 1
cpu MHz         : 2606.278
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext fxsr_opt
lm 3dnowext 3dnow pni
bogomips        : 5218.90

Unfortunately, I got that:

powernow-k8: Found 2 AMD Athlon 64 / Opteron processors (version 1.50.4)
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
cpu_init done, current fid 0x12, vid 0x6
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
cpu_init done, current fid 0x12, vid 0x6

The low frequency is missing.  I think the correct one is
1000 MHz, 1100 mV, but I don't find exactly the correct spec
under "AMD Opteron Processor Power and Thermal Data Sheet",
even though I'm pretty sure it is the one at page 33.

Someone from AMD people that could validate this, please?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
