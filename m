From: Matthias Hannich <dumb@tcpa-info.org>
Subject: Coppermine, cpufreq
Date: Thu, 30 Oct 2003 14:49:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FA11700.8080908@tcpa-info.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

I have a laptop (Gericom Webboy) with a PIII Coppermine.
I am working on a 2.4.22-kernel (from kernel.org) and patched the=20
patch-2.4.22-ac4.bz2 from Alan Cox against it.

Because of having a low battery-capacity I tried to enable cpufreq and=20
ACPI-stuff in the kernel (and tried to compile them as modules as well).

If I then boot the machine, I tried the following:

$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 6
cpu MHz         : 1000.916
cache size      : 256 KB
physical id     : 0
siblings        : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge=20
mca cmov pat pse36 mmx fxsr sse
bogomips        : 1998.84

$ cat /proc/cpufreq
           minimum CPU frequency  -  maximum CPU frequency  -  policy

root:/usr/src/linux-2.4.22# insmod speedstep-ich
Using /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o
/lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o:=20
unresolved symbol speedstep_get_processor_frequency
/lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o:=20
unresolved symbol speedstep_detect_processor
/lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o:=20
unresolved symbol speedstep_get_freqs

and didn't saw any real frequencies.

At the moment I don't know if my cpu could handle cpufreq-controlling at=20
all, but hope it. I searched the archive of this ml, but except of=20
"Coppermines might cause problems, might not work..." I can't find=20
helpful things.

Thanks a lot and if there is something you need to help get it running,=20
or I should do or try, please tell me. (Well I tried to understand the=20
stuff in Documentation/cpu-freq, but...;))

Best regards,
Matthias
--=20
Freundliche Gr=FC=DFe,          ###  http://www.stop1984.com
Matthias Hannich            ###  nulli@stop1984.com
                             ###  KeyID: 407A2F69
Fingerprint: 600D 7E07 105C F674 0C4B  12C2 4DE4 A8DF 407A 2F69
