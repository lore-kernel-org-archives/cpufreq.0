From: "Joshua McBeth" <tiberizzle@gmail.com>
Subject: powernow-k7, 760MPX, SMP
Date: Tue, 26 Sep 2006 22:31:35 -0400
Message-ID: <b58dead90609261931l4b97aa51se298d2230d577212@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

I've been looking at powernow-k7 and have it working actually with two
entirely unmodified (factory MP-unlocked, as certain batches were)
Barton-core XP-M 2500+ processors, on a Tyan Thunder K7X S2468.  I had to
patch the powernow-k7 driver to include a user-defined frequency table, and
toggle the FID_CHANGE bit (register 44 bit 0, to value 1) in the PCI
configuration registers for 00:00.0.  If FID_CHANGE is not set when
powernow-k7 loads the system hangs.

Anyway, the first processor will accept multiplier changes via
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed.  The second processor
does not have the cpufreq /sys interface.

This results in the following slightly amusing scenario:
-------------------------------
thunder cpufreq # uname -a
Linux thunder 2.6.17-gentoo-r5 #2 SMP Tue Sep 26 21:08:17 EDT 2006 i686 AMD
Athlon(tm) Processor GNU/Linux
thunder cpufreq # cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 10
model name      : AMD Athlon(tm) Processor
stepping        : 0
cpu MHz         : 1600.104
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow ts fid vid
bogomips        : 3204.10

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 10
model name      : AMD Athlon(tm) Processor
stepping        : 0
cpu MHz         : 800.057
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow ts fid vid
bogomips        : 1600.36
-------------------------------


Reportedly, a small tool for Windows (CPUMSR) can successfully set both
processors' multipliers assuming FID_CHANGE is enabled (via WPCREDIT,
essentially setpci for Windows), and FID_CHANGE is even set by default on
some 760MPX BIOSes.  Knowing that the 760MPX chipset supports it, and that
many processors in the wild support it with or without modification, I can
see no reason why the powernow-k7 driver should continue to lack this
functionality.  Can anyone tell me off-hand how difficult it would be to
generalize powernow-k7 for SMP?

kthx~
