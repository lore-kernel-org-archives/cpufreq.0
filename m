From: Gregor von Stangen <gvs@pironet-ndh.com>
Subject: Mobile P4 3.06 GHz / 533 MHz FSB only detected after dirty patch
Date: Tue, 16 Sep 2003 12:48:13 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.53.0309161216180.1302@linux.local>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hello,

my Mobile P4 3.06 Ghz with 533 MHz FSB (Kernel 2.4.22) is only detected
after applying a dirty patch to function "speedstep_detect_processor" in
file speedstep-lib.c:

/*
                ebx = cpuid_ebx(0x00000001);
                ebx &= 0x000000FF;
                if ((ebx != 0x0e) && (ebx != 0x0f))
                        return 0;
*/

After commenting out the above lines, the routine returns P4M as processor
type and I can load the module speedstep-ich.

After loading speedstep-ich, a "cat /proc/cpufreq" shows

          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0      1200000 kHz ( 52 %)  -    2300000 kHz (100 %)  -  performance

but "/proc/cpuinfo" shows

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Genuine Intel(R) CPU 3.06GHz
stepping        : 9
cpu MHz         : 3056.507
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 6094.84

If I set the cpumode to powersave, a "cat /proc/cpufreq" shows

          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0      1200000 kHz ( 52 %)  -    2300000 kHz (100 %)  -  powersave

and "/proc/cpuinfo" shows

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Genuine Intel(R) CPU 3.06GHz
stepping        : 9
cpu MHz         : 1594.699
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 3179.92

So it looks like it works perfectly well for me. Anyway, I'm not too firm
in assembly language programming of the Pentium and the counters from
cpufreq seem to be broken after this hack. I'm not sure, if I only had
luck in hacking the driver and I'd like to know, if there might be a
better fix for my problem.

Best regards,

  Gregor
