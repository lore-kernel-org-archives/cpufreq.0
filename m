From: Fredrik =?iso-8859-1?Q?Sj=F6gren?= <d98-fsj@d.kth.se>
Subject: Athlon XP 2000+ cpu freq scaling
Date: Fri, 31 Oct 2003 00:06:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031030230631.GM17964@britney>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi!

I have an Athlon XP2000+ and I want to make it possible to lower the
freq in software.

I installed the 2.4.22 kernel with ac4 patch and enabled:

[*] CPU Frequency scaling
[*]  CPU frequency table helpers
--- CPUFreq governors
[*]  "userspace" for userspace frequency scaling
--- CPUFreq processor drivers
<*>  AMD Mobile Athlon/Duron K7 PowerNow! 

The kernel boots fine but when I do:

# cat /proc/cpufreq 
   minimum CPU frequency  -  maximum CPU frequency  -  policy

Shouldn't say some frequencys like?

        minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       500000 kHz ( 41 %)  -    1200000 kHz (100 %)  -  performance


Info about my cpu:

# cat /proc/cpuinfo 
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 8
model name      : AMD Athlon(tm) XP 1700+
stepping        : 0
cpu MHz         : 1488.804
cache size      : 256 KB
physical id     : 0
siblings        : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 mmx fxsr sse syscall mmxext 3dnowext 3dnow
bogomips        : 2968.78

(Currently it's under clocked but I have tested with it at 2000+ mode)


Have I missed something in the kernel?

Please help.

Regards
Fredrik
