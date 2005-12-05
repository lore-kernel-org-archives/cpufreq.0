From: Rob Hess <robwhess@gmail.com>
Subject: Re: why does speedstep_detect_processor() return failure?
Date: Sun, 4 Dec 2005 16:43:30 -0800
Message-ID: <8dff05a00512041643id27fc97y7595c3dd04a3e016@mail.gmail.com>
References: <8dff05a00511291916h39427e1fsff55e81e3a843b21@mail.gmail.com>
	<20051204165751.GC8422@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051204165751.GC8422@isilmar.linta.de>
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
To: Rob Hess <robwhess@gmail.com>, cpufreq@lists.linux.org.uk

Thanks for responding.

> Please post the output of /proc/cpuinfo and of x86info

/proc/cpuinfo:
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 4
model name      : Mobile Intel(R) Pentium(R) 4 CPU 2.80GHz
stepping        : 1
cpu MHz         : 2791.294
cache size      : 1024 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe pni
monitor ds_cpl est tm2 cid xtpr
bogomips        : 5589.46



x86info:
CPU #1
Family: 15 Model: 4 Stepping: 1 Type: 0 Brand: 0
CPU Model: Pentium 4 Xeon (Foster) Original OEM
Feature flags:
 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat
pse36 clflsh dtes acpi mmx fxsr sse sse2 selfsnoop ht acc pbe
Extended feature flags:
 est tm2 cntx-id
Instruction trace cache:
        Size: 12K uOps  8-way associative.
L1 Data cache:
        Size: 16KB      Sectored, 8-way associative.
        line size=3D64 bytes.
L2 unified cache:
        Size: 1MB       Sectored, 8-way associative.
        line size=3D64 bytes.
Instruction TLB: 4K, 2MB or 4MB pages, fully associative, 64 entries.
Data TLB: 4KB or 4MB pages, fully associative, 64 entries.
Processor serial: 0000-0F41-0000-0000-0000-0000
The physical package supports 2 logical processors


Note that two identical processors show up in each of these because I
have SMP enabled so I can use HyperThreading.  I've cut out the second
processor in both outputs.

Also, the model name in /proc/cpuinfo is correct.  The one in x86info is no=
t.


Rob
