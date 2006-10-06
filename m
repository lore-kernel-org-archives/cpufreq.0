From: Luca <morpheus@ferrara.linux.it>
Subject: Cpufreq on kernel 2.6.18
Date: Fri, 6 Oct 2006 22:01:01 +0200
Message-ID: <20061006220101.722689c2.morpheus@ferrara.linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Hello,
I just updated the kernel from 2.6.15.2 to 2.6.18 and the frequency scaling=
 of my Centrinlo Laptop stopped working (keeping the same configuration).
The dir /sys/devices/system/cpu/cpu0/ is empty and I don't know which other=
 tests I could make.
I also tried to move CONFIG_X86_ACPI_CPUFREQ from builtin to module: loadin=
g the module does not give any information nor any error.
I need 2.6.18 for other drivers, so it would be really nice if I could solv=
e this problem that seems to be the only driver that's not working properly=
 (and my battery would be much happier :) )
If you need more informations just tell me.

Bests,
	Luca.


my cpu is:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.73GHz
stepping        : 8
cpu MHz         : 1729.621
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx est tm2
bogomips        : 3462.49


--=20
       .-------------------------------------.
  -=3D<(=A7  Luca <morpheus AT ferrara.linux.it>  =A7)>=3D-
       =B0-------------------------------------=B0
