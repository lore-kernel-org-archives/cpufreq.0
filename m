From: =?iso-8859-2?q?Micha=B3_Pytasz?= <mpytasz@pai.net.pl>
Subject: Re: [PATCH] dual-core powernow-k8
Date: Mon, 2 May 2005 23:16:34 +0200
Message-ID: <200505022316.34851.mpytasz@pai.net.pl>
References: <84EA05E2CA77634C82730353CBE3A84301CFBFB4@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFBFB4@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi,

On Monday 02 of May 2005 21:23, Langsdorf, Mark wrote:
> With the release of the dual-core AMD Opterons last week,
> it's high time that cpufreq supported them.  The attached
> patch applies cleanly to 2.6.12-rc3 and updates powernow-k8
> to support the latest Athlon 64 and Opteron processors.
>
> Update the driver to version 1.40.0 and provide support
> for dual-core processors.
>
> Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
>
> -Mark Langsdorf
> AMD, Inc.

I just tried applying patch against 2.6.11.8, well it builds fine, however 
when I try to use it (Athlon64 3200+ s939) I get:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.40.0)
powernow-k8:    0 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x8 (1350 mV)
powernow-k8:    2 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
Losing some ticks... checking if CPU frequency changed.
cpu_init done, current fid 0xc, vid 0x6

which looks quite fine, but after ondemand govenor is started:

powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed

and so on.

Here is my cpuinfo (when I see above):

# cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 31
model name      : AMD Athlon(tm) 64 Processor 3200+
stepping        : 0
cpu MHz         : 2000.108
cache size      : 512 KB
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush mmx fxsr sse sse2 pni syscall nx mmxext fxsr_opt lm 
3dnowext 3dnow
bogomips        : 3915.77
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp

built with gcc:
# gcc --version
gcc (GCC) 3.4.3-20050110 (Gentoo Linux 3.4.3.20050110-r2, 
ssp-3.4.3.20050110-0, pie-8.7.7)

system is running in native x86_64 mode.

Michal
