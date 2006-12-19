From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: sempron 64 bits support
Date: Tue, 19 Dec 2006 10:16:32 -0600
Message-ID: <1449F58C868D8D4E9C72945771150BDF15E6C9@SAUSEXMB1.amd.com>
References: <20061218194838.693b2810.sebastien.fievet@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Sebastien Fievet <sebastien.fievet@free.fr>, cpufreq@lists.linux.org.uk

Not all Semprons support PowerNow!.  Generally, if the error is that the =

PowerNow! driver says your processor doesn't support PowerNow!,=20
your processor doesn't support PowerNow!.  If you get an ACPI or
PSS related error, it is sometimes possible to update your BIOS to
get more Linux friendly _PSS objects.
=20
In your case, with the 2.6.19 kernel, you probably do not have a=20
processor that supports PowerNow!.
=20
-Mark Langsdorf
AMD, Inc.

________________________________

From: cpufreq-bounces@lists.linux.org.uk on behalf of Sebastien Fievet
Sent: Mon 12/18/2006 12:48 PM
To: cpufreq@lists.linux.org.uk
Subject: sempron 64 bits support



Hello there,

i have a sempron 64 bits processor and would like to enable the =
frequency scaling
capability of the kernel for it. Unfortunately, both powernow-k8 and =
acpi-cpufreq
modules fail to detect my processor as Cool 'n quiet capable.

Below is the result of "cat /proc/cpuinfo"

processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 44
model name      : AMD Sempron(tm) Processor 2800+
stepping        : 2
cpu MHz         : 1607.349
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge =
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext fxsr_opt =
lm 3dnowext 3dnow pni lahf_lm ts ttp tm stc
bogomips        : 3217.70

The presence of the "lm" bit in the flags should confirm that i have the =
64 bits core.
My motherboard (K8NF4G) supports "cool 'n quiet", and it is activated in =
the bios.

I spent a lot of time googling to find out what could be wrong.
The only thing i found is that the powernow flags of my proc are not =
reported in a
"power management" section but all together with the others flags.
Could it lead the kernel module to misdetect the "cool 'n quiet" =
capability?

I just compiled the 2.6.19.1 kernel...

Thank you if you can help me save the arctic ices! :-)

S=E9b.

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq
