From: Juliusz Chroboczek <jch@pps.jussieu.fr>
Subject: Cpufreq: powernow-k7 weirdness
Date: 06 Jul 2003 03:00:35 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: davej@suse.de

Running stock 2.5.73 (ACPI + preempt) on a Compaq Presario 711, CPU is
a 950MHz mobile Duron.  I'm getting unexpected timings when enabling
cpufreq.

On a kernel compiled without cpufreq, a CPU bound program (repeated
sieve within L1 cache) gives the following, which is consistent with
what I get under 2.4.18:

  real    0m1.729s
  user    0m1.725s
  sys     0m0.003s

On a kernel with cpufreq (powernow-k7), I get the following at boot time:
  
  powernow: AMD K7 CPU detected.
  powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
  powernow: Found PSB header at c00f6b30
  powernow: Table version: 0x12
  powernow: Flags: 0x0 (Mobile voltage regulator)
  powernow: Settling Time: 100 microseconds.
  powernow: Has 36 PST tables. (Only dumping ones relevant to this CPU).
  powernow: PST:25 (@c00f6cb8)
  powernow:  cpuid: 0x771 fsb: 100        maxFID: 0xd     startvid: 0xb
  powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xe (1.300V)
  powernow:    FID: 0x8 (7.0x [700MHz])   VID: 0xe (1.300V)
  powernow:    FID: 0xd (9.5x [950MHz])   VID: 0xb (1.450V)

However, the timings I get are roughly 10% lower than what I'd
expect, namely as follows:

At 950 MHz:

  real    0m1.932s
  user    0m1.930s
  sys     0m0.002s

At 700 MHz:

  real    0m2.347s
  user    0m2.346s
  sys     0m0.002s

At 500 MHz:

  real    0m3.288s
  user    0m3.285s
  sys     0m0.003s

In all three cases, /proc/cpuinfo reflects the expected frequency.

If there's any more testing that I can do, please let me know by e-mail.

                                        Juliusz Chroboczek

P.S. I am not subscribed to the list, and would appreciate being CCd
     with any replies.

P.P.S. /proc/cpuinfo, under a non-powerstep kernel:

  processor       : 0
  vendor_id       : AuthenticAMD
  cpu family      : 6
  model           : 7
  model name      : Mobile AMD Duron(tm) Processor
  stepping        : 1
  cpu MHz         : 946.875
  cache size      : 64 KB
  fdiv_bug        : no
  hlt_bug         : no
  f00f_bug        : no
  coma_bug        : no
  fpu             : yes
  fpu_exception   : yes
  cpuid level     : 1
  wp              : yes
  flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
  bogomips        : 1863.68
