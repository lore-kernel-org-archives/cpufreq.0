From: Tim Dijkstra <newsuser@famdijkstra.org>
Subject: Which driver for Mobile P4 CPU?
Date: Wed, 5 Jan 2005 20:07:21 +0100
Message-ID: <20050105200721.21c6f5f8@bonenpikster.drs.p>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

Maybe this is a FAQ, but your archive is not really easy searchable. If
you have pointers to more info, I'm all ears.

According to the vendor of my laptop (ACER)it has a speedstep-able
processor.

tdykstra@bonenpikster:~$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 2.00GHz
stepping        : 7
cpu MHz         : 1196.242
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 2351.10


None of the drivers in the 2.6.10 kernel that have speedstep in their
name are loadable. Does this mean that my CPU isn't supported or I'm a
doing something wrong? 

Maybe I shouldn't be complaining, because with acpi-freq I'm able to
switch between 1.2 and 2 GHz. I do however get kernel messages like:

kernel: acpi-cpufreq: Transition failed

Do the specific speedstep-* drivers have some extra features over (are
'better' than) the acpi-cpufreq driver or can just as well work with
that?

grts Tim
