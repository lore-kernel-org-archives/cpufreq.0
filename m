From: conrad@bungled.net (Nathan Conrad)
Subject: Wrong frequencies sometimes on Sony Vaio Athlon4
Date: Tue, 29 Nov 2005 08:54:23 -0500
Message-ID: <20051129135423.GA20258@bungled.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Hi,

I have a 1.2 GHz Athlon4 CPU on my Sony Vaio PCG-FXA49 laptop. I use
the powernow CPU scaling. Sometimes (a few percent of the time), the
driver records my laptop's CPU as the wrong speed. For example, right
now the following speeds are available:

1292256 1076880 861504 646128 538440

The first should be almost exactly 1.2 GHz while the last should be
500 MHz.

/proc/cpuinfo:

processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 6
model name      : mobile AMD Athlon(tm) 4
stepping        : 2
cpu MHz         : 1076.885
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips        : 2144.24

dmesg reports:

CPU: After generic identify, caps: 0383f9ff c1cbf9ff 00000000 00000000 00000000 00000000 00000000
CPU: After vendor identify, caps: 0383f9ff c1cbf9ff 00000000 00000000 00000000 00000000 00000000
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 256K (64 bytes/line)
CPU: After all inits, caps: 0383f9ff c1cbf9ff 00000000 00000020 00000000 00000000 00000000
CPU: AMD mobile AMD Athlon(tm) 4  stepping 02
powernow: PowerNOW! Technology present. Can scale: frequency and
voltage.
Detected 1292.262 MHz processor.
powernow: No PST tables match this cpuid (0x762)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: Minimum speed 538 MHz. Maximum speed 1292 MHz.
