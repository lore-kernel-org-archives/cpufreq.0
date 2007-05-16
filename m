From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpuinfo / speedstep-centrino
Date: Wed, 16 May 2007 09:18:47 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F5E6FC7C@scsmsx415.amr.corp.intel.com>
References: <20070516170413.2861c83d@snowcat.jan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Class: urn:content-classes:message
In-Reply-To: <20070516170413.2861c83d@snowcat.jan>
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
To: Jan Piechotta <j@diesedomainwarnochfrei.de>, cpufreq@lists.linux.org.uk


What is the kernel version?

Thanks,
Venki=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Jan Piechotta
>Sent: Wednesday, May 16, 2007 8:04 AM
>To: cpufreq@lists.linux.org.uk
>Subject: cpuinfo / speedstep-centrino
>
>Hi,=20
>
>my kernel wants me to send you a mail:
>
><<<snip>>>=20
>cpufreq-core: trying to register driver centrino
>cpufreq-core: adding CPU 0 speedstep-centrino: found unsupported CPU
>with Enhanced SpeedStep: send /proc/cpuinfo to
>cpufreq@lists.linux.org.uk=20
>cpufreq-core: initialization failed
><<<snip>>>
>
>Mainboard is MSI 915GM Speedster-FA4 bought Dec 2005.
>Here you go:
>
><<<snip>>>
>processor	: 0
>vendor_id	: GenuineIntel
>cpu family	: 6
>model		: 13
>model name	: Intel(R) Pentium(R) M processor 1.73GHz
>stepping	: 8
>cpu MHz		: 1729.049
>cache size	: 2048 KB
>fdiv_bug	: no
>hlt_bug		: no
>f00f_bug	: no
>coma_bug	: no
>fpu		: yes
>fpu_exception	: yes
>cpuid level	: 2
>wp		: yes
>flags		: fpu vme de pse tsc msr pae mce cx8 apic sep=20
>mtrr pge mca cmov
>pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx est tm2
>bogomips	: 3460.62
>clflush size	: 64
><<<snip>>>
>
>I also tried acpi-cpufreq without success.
>
>HTH, Jan
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
